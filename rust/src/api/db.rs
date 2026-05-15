use stoolap::{Database, Value};
use anyhow::Result;
use crate::frb_generated::StreamSink;
use chrono::{TimeZone, Utc};

/// An opaque handle to a Stoolap database connection.
#[flutter_rust_bridge::frb(opaque)]
pub struct StoolapDb {
    pub(crate) inner: Database,
}

/// Represents a single value in a Stoolap database row or a query parameter.
#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub enum StoolapValue {
    /// 64-bit signed integer
    Integer(i64),
    /// 64-bit floating point
    Float(f64),
    /// UTF-8 text string
    Text(String),
    /// Boolean value
    Boolean(bool),
    /// Native vector for semantic search
    Vector(Vec<f32>),
    /// JSON data
    Json(String),
    /// UTC Timestamp in milliseconds since epoch
    Timestamp(i64),
    /// Date (days since epoch)
    Date(i64),
    /// Database NULL
    Null,
}

/// A single row returned from a SQL query.
#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub struct StoolapRow {
    /// Names of the columns in the row
    pub columns: Vec<String>,
    /// Values in the row corresponding to the columns
    pub values: Vec<StoolapValue>,
}

impl StoolapDb {
    /// Opens a connection to a database specified by the DSN.
    pub fn open(dsn: String) -> Result<StoolapDb> {
        let dsn = if dsn == ":memory:" { "memory://".to_string() } else { dsn };
        let db = Database::open(&dsn)?;
        Ok(StoolapDb { inner: db })
    }

    /// Clones the database handle, creating a new connection with independent transaction state.
    pub fn clone_handle(&self) -> Result<StoolapDb> {
        Ok(StoolapDb { inner: self.inner.clone() })
    }

    fn convert_params(params: Vec<StoolapValue>) -> Vec<Value> {
        params.into_iter().map(|p| match p {
            StoolapValue::Integer(i) => Value::integer(i),
            StoolapValue::Float(f) => Value::float(f),
            StoolapValue::Text(s) => Value::text(s),
            StoolapValue::Boolean(b) => Value::boolean(b),
            StoolapValue::Vector(v) => Value::vector(v),
            StoolapValue::Json(j) => Value::json(j),
            StoolapValue::Timestamp(t) => Value::timestamp(chrono::Utc.timestamp_millis_opt(t).unwrap().into()),
            StoolapValue::Date(d) => Value::integer(d),
            StoolapValue::Null => Value::null_unknown(),
        }).collect()
    }

    /// Executes a SQL statement with parameters.
    pub fn execute(&self, sql: String, params: Vec<StoolapValue>) -> Result<()> {
        let stoolap_params = Self::convert_params(params);
        self.inner.execute(&sql, stoolap_params.as_slice())?;
        Ok(())
    }

    /// Executes a batch of SQL statements efficiently.
    pub fn batch_execute(&self, sqls: Vec<String>) -> Result<()> {
        for sql in sqls {
            self.inner.execute(&sql, ())?;
        }
        Ok(())
    }

    /// Queries the database and returns a list of rows.
    pub fn query(&self, sql: String, params: Vec<StoolapValue>) -> Result<Vec<StoolapRow>> {
        let stoolap_params = Self::convert_params(params);
        let mut results = Vec::new();
        // Updated: query takes params as tuple or slice, assuming dereferencing or removal of &
        for row in self.inner.query(&sql, &*stoolap_params)? {
            let row = row?;
            // Updated: access columns and values using new API
            let columns: Vec<String> = row.columns().iter().map(|c| c.to_string()).collect();
            let mut values = Vec::new();
            for i in 0..columns.len() {
                // Updated: use get_value to get reference to Value
                let val = row.get_value(i);
                values.push(match val {
                    Some(Value::Integer(i)) => StoolapValue::Integer(*i),
                    Some(Value::Float(f)) => StoolapValue::Float(*f),
                    Some(Value::Text(s)) => StoolapValue::Text(s.to_string()),
                    Some(Value::Boolean(b)) => StoolapValue::Boolean(*b),
                    // Updated: use Value constructor methods
                    Some(v) => match v {
                        Value::Integer(i) => StoolapValue::Integer(*i),
                        Value::Float(f) => StoolapValue::Float(*f),
                        Value::Text(s) => StoolapValue::Text(s.to_string()),
                        Value::Boolean(b) => StoolapValue::Boolean(*b),
                        Value::Timestamp(t) => StoolapValue::Timestamp(t.timestamp_millis()),
                        _ => {
                            if let Some(vec) = v.as_vector_f32() {
                                StoolapValue::Vector(vec.to_vec())
                            } else if let Some(json) = v.as_json() {
                                StoolapValue::Json(json.to_string())
                            } else if let Some(d) = v.as_int64() {
                                // Assuming Date is represented as an integer (days since epoch)
                                StoolapValue::Date(d)
                            } else {
                                StoolapValue::Null
                            }
                        }
                    },
                    None => StoolapValue::Null,
                });
            }
            results.push(StoolapRow { columns, values });
        }
        Ok(results)
    }

    /// Explicitly begins a transaction.
    pub fn begin(&self) -> Result<()> {
        self.execute("BEGIN".to_string(), vec![])
    }

    /// Commits the active transaction.
    pub fn commit(&self) -> Result<()> {
        self.execute("COMMIT".to_string(), vec![])
    }

    /// Rolls back the active transaction.
    pub fn rollback(&self) -> Result<()> {
        self.execute("ROLLBACK".to_string(), vec![])
    }

    /// Creates a named savepoint.
    pub fn savepoint(&self, name: String) -> Result<()> {
        self.execute(format!("SAVEPOINT {}", name), vec![])
    }

    /// Releases a named savepoint.
    pub fn release_savepoint(&self, name: String) -> Result<()> {
        self.execute(format!("RELEASE SAVEPOINT {}", name), vec![])
    }

    /// Rolls back to a named savepoint.
    pub fn rollback_to_savepoint(&self, name: String) -> Result<()> {
        self.execute(format!("ROLLBACK TO SAVEPOINT {}", name), vec![])
    }

    /// Executes a PRAGMA command to configure or inspect the database engine.
    pub fn pragma(&self, name: String, value: Option<String>) -> Result<Vec<StoolapRow>> {
        let sql = if let Some(v) = value {
            format!("PRAGMA {} = {}", name, v)
        } else {
            format!("PRAGMA {}", name)
        };
        self.query(sql, vec![])
    }

    /*
    /// Sets up a stream for internal engine logs.
    pub fn setup_log_stream(sink: flutter_rust_bridge::StreamSink<String>) -> Result<()> {
        std::thread::spawn(move || {
            let _ = sink.add("Stoolap Rust engine logger initialized".to_string());
        });
        Ok(())
    }
    */

    /// Executes a statement and returns results (e.g., for RETURNING clause).
    pub fn execute_with_results(&self, sql: String, params: Vec<StoolapValue>) -> Result<Vec<StoolapRow>> {
        self.query(sql, params)
    }

    /// Returns the execution plan and profiling info for a SQL statement.
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
