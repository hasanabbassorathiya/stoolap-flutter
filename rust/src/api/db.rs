use stoolap::{Database, Value};
use anyhow::Result;
use std::sync::Mutex;
use once_cell::sync::Lazy;

static DB: Lazy<Mutex<Option<Database>>> = Lazy::new(|| Mutex::new(None));

#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub enum StoolapValue {
    Integer(i64),
    Float(f64),
    Text(String),
    Vector(Vec<f32>),
    Json(String),
    Timestamp(i64),
    Null,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub struct StoolapRow {
    pub columns: Vec<String>,
    pub values: Vec<StoolapValue>,
}

#[flutter_rust_bridge::frb(opaque)]
pub struct StoolapDb {}

impl StoolapDb {
    pub fn open(path: String) -> Result<()> {
        let mut db_guard = DB.lock().unwrap();
        let db = Database::open(&path)?;
        *db_guard = Some(db);
        Ok(())
    }

    fn convert_params(params: Vec<String>) -> Vec<Value> {
        params.into_iter().map(|p| Value::Text(p)).collect()
    }

    pub fn execute(sql: String, params: Vec<String>) -> Result<()> {
        let db_guard = DB.lock().unwrap();
        if let Some(db) = db_guard.as_ref() {
            let stoolap_params = Self::convert_params(params);
            db.execute(&sql, &stoolap_params)?;
            Ok(())
        } else {
            Err(anyhow::anyhow!("Database not open"))
        }
    }

    pub fn query(sql: String, params: Vec<String>) -> Result<Vec<StoolapRow>> {
        let db_guard = DB.lock().unwrap();
        if let Some(db) = db_guard.as_ref() {
            let stoolap_params = Self::convert_params(params);
            let mut results = Vec::new();
            for row in db.query(&sql, &stoolap_params)? {
                let row = row?;
                let columns: Vec<String> = row.columns().iter().map(|c| c.name().to_string()).collect();
                let mut values = Vec::new();
                for i in 0..columns.len() {
                    let val = row.get_raw(i).unwrap();
                    values.push(match val {
                        Value::Integer(i) => StoolapValue::Integer(*i),
                        Value::Float(f) => StoolapValue::Float(*f),
                        Value::Text(s) => StoolapValue::Text(s.clone()),
                        Value::Vector(v) => StoolapValue::Vector(v.to_vec()),
                        Value::Json(j) => StoolapValue::Json(j.to_string()),
                        Value::Timestamp(t) => StoolapValue::Timestamp(*t),
                        Value::Null => StoolapValue::Null,
                        _ => StoolapValue::Text(format!("{:?}", val)),
                    });
                }
                results.push(StoolapRow { columns, values });
            }
            Ok(results)
        } else {
            Err(anyhow::anyhow!("Database not open"))
        }
    }

    pub fn begin() -> Result<()> {
        Self::execute("BEGIN".to_string(), vec![])
    }

    pub fn commit() -> Result<()> {
        Self::execute("COMMIT".to_string(), vec![])
    }

    pub fn rollback() -> Result<()> {
        Self::execute("ROLLBACK".to_string(), vec![])
    }

    pub fn savepoint(name: String) -> Result<()> {
        Self::execute(format!("SAVEPOINT {}", name), vec![])
    }

    pub fn release_savepoint(name: String) -> Result<()> {
        Self::execute(format!("RELEASE SAVEPOINT {}", name), vec![])
    }

    pub fn rollback_to_savepoint(name: String) -> Result<()> {
        Self::execute(format!("ROLLBACK TO SAVEPOINT {}", name), vec![])
    }

    pub fn pragma(name: String, value: Option<String>) -> Result<Vec<StoolapRow>> {
        let sql = if let Some(v) = value {
            format!("PRAGMA {} = {}", name, v)
        } else {
            format!("PRAGMA {}", name)
        };
        Self::query(sql, vec![])
    }

    pub fn setup_log_stream(sink: flutter_rust_bridge::DefaultStreamSink<String>) -> Result<()> {
        // Simple bridge to forward internal Rust logs (if exposed by stoolap crate)
        // For now, we'll use a thread to emit heartbeat/ready events to demonstrate the bridge
        std::thread::spawn(move || {
            let _ = sink.add("Stoolap Rust engine logger initialized".to_string());
        });
        Ok(())
    }

    pub fn execute_with_results(sql: String, params: Vec<String>) -> Result<Vec<StoolapRow>> {
        Self::query(sql, params)
    }

    pub fn explain(sql: String, params: Vec<String>) -> Result<String> {
        let explain_sql = format!("EXPLAIN ANALYZE {}", sql);
        let results = Self::query(explain_sql, params)?;
        let mut output = String::new();
        for row in results {
            if let Some(StoolapValue::Text(val)) = row.values.first() {
                output.push_str(val);
                output.push('\n');
            }
        }
        Ok(output)
    }

    pub fn close() -> Result<()> {
        let mut db_guard = DB.lock().unwrap();
        *db_guard = None;
        Ok(())
    }
}
