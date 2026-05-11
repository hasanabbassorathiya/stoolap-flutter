use stoolap::{Database, Value};
use anyhow::Result;
use std::sync::Arc;

#[flutter_rust_bridge::frb(opaque)]
pub struct StoolapDb {
    pub(crate) inner: Database,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub enum StoolapValue {
    Integer(i64),
    Float(f64),
    Text(String),
    Boolean(bool),
    Vector(Vec<f32>),
    Json(String),
    Timestamp(i64),
    Date(i64),
    Null,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub struct StoolapRow {
    pub columns: Vec<String>,
    pub values: Vec<StoolapValue>,
}

impl StoolapDb {
    pub fn open(dsn: String) -> Result<StoolapDb> {
        let db = Database::open(&dsn)?;
        Ok(StoolapDb { inner: db })
    }

    pub fn clone_handle(&self) -> Result<StoolapDb> {
        Ok(StoolapDb { inner: self.inner.clone() })
    }

    fn convert_params(params: Vec<StoolapValue>) -> Vec<Value> {
        params.into_iter().map(|p| match p {
            StoolapValue::Integer(i) => Value::Integer(i),
            StoolapValue::Float(f) => Value::Float(f),
            StoolapValue::Text(s) => Value::Text(s.into()),
            StoolapValue::Boolean(b) => Value::Boolean(b),
            StoolapValue::Vector(v) => Value::Vector(v.into()),
            StoolapValue::Json(j) => Value::Json(j.into()),
            StoolapValue::Timestamp(t) => Value::Timestamp(chrono::DateTime::from_timestamp_millis(t).unwrap().into()),
            StoolapValue::Date(d) => Value::Date(d),
            StoolapValue::Null => Value::Null(stoolap::DataType::Text), // Simplified default
        }).collect()
    }

    pub fn execute(&self, sql: String, params: Vec<StoolapValue>) -> Result<()> {
        let stoolap_params = Self::convert_params(params);
        self.inner.execute(&sql, &stoolap_params)?;
        Ok(())
    }

    pub fn batch_execute(&self, sqls: Vec<String>) -> Result<()> {
        for sql in sqls {
            self.inner.execute(&sql, ())?;
        }
        Ok(())
    }

    pub fn query(&self, sql: String, params: Vec<StoolapValue>) -> Result<Vec<StoolapRow>> {
        let stoolap_params = Self::convert_params(params);
        let mut results = Vec::new();
        for row in self.inner.query(&sql, &stoolap_params)? {
            let row = row?;
            let columns: Vec<String> = row.columns().iter().map(|c| c.name().to_string()).collect();
            let mut values = Vec::new();
            for i in 0..columns.len() {
                let val = row.get_raw(i).unwrap();
                values.push(match val {
                    Value::Integer(i) => StoolapValue::Integer(*i),
                    Value::Float(f) => StoolapValue::Float(*f),
                    Value::Text(s) => StoolapValue::Text(s.to_string()),
                    Value::Boolean(b) => StoolapValue::Boolean(*b),
                    Value::Vector(v) => StoolapValue::Vector(v.to_vec()),
                    Value::Json(j) => StoolapValue::Json(j.to_string()),
                    Value::Timestamp(t) => StoolapValue::Timestamp(t.timestamp_millis()),
                    Value::Date(d) => StoolapValue::Date(*d),
                    Value::Null(_) => StoolapValue::Null,
                    _ => StoolapValue::Text(format!("{:?}", val)),
                });
            }
            results.push(StoolapRow { columns, values });
        }
        Ok(results)
    }

    pub fn begin(&self) -> Result<()> {
        self.execute("BEGIN".to_string(), vec![])
    }

    pub fn commit(&self) -> Result<()> {
        self.execute("COMMIT".to_string(), vec![])
    }

    pub fn rollback(&self) -> Result<()> {
        self.execute("ROLLBACK".to_string(), vec![])
    }

    pub fn savepoint(&self, name: String) -> Result<()> {
        self.execute(format!("SAVEPOINT {}", name), vec![])
    }

    pub fn release_savepoint(&self, name: String) -> Result<()> {
        self.execute(format!("RELEASE SAVEPOINT {}", name), vec![])
    }

    pub fn rollback_to_savepoint(&self, name: String) -> Result<()> {
        self.execute(format!("ROLLBACK TO SAVEPOINT {}", name), vec![])
    }

    pub fn pragma(&self, name: String, value: Option<String>) -> Result<Vec<StoolapRow>> {
        let sql = if let Some(v) = value {
            format!("PRAGMA {} = {}", name, v)
        } else {
            format!("PRAGMA {}", name)
        };
        self.query(sql, vec![])
    }

    pub fn setup_log_stream(sink: flutter_rust_bridge::DefaultStreamSink<String>) -> Result<()> {
        std::thread::spawn(move || {
            let _ = sink.add("Stoolap Rust engine logger initialized".to_string());
        });
        Ok(())
    }

    pub fn execute_with_results(&self, sql: String, params: Vec<StoolapValue>) -> Result<Vec<StoolapRow>> {
        self.query(sql, params)
    }

    pub fn explain(&self, sql: String, params: Vec<StoolapValue>) -> Result<String> {
        let explain_sql = format!("EXPLAIN ANALYZE {}", sql);
        let results = self.query(explain_sql, params)?;
        let mut output = String::new();
        for row in results {
            if let Some(StoolapValue::Text(val)) = row.values.first() {
                output.push_str(val);
                output.push('\n');
            }
        }
        Ok(output)
    }
}
