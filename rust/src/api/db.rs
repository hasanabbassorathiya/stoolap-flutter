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

    pub fn execute(sql: String, params: Vec<String>) -> Result<()> {
        let db_guard = DB.lock().unwrap();
        if let Some(db) = db_guard.as_ref() {
            // Placeholder for parameter conversion logic
            db.execute(&sql, ())?;
            Ok(())
        } else {
            Err(anyhow::anyhow!("Database not open"))
        }
    }

    pub fn query(sql: String, params: Vec<String>) -> Result<Vec<StoolapRow>> {
        let db_guard = DB.lock().unwrap();
        if let Some(db) = db_guard.as_ref() {
            let mut results = Vec::new();
            for row in db.query(&sql, ())? {
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

    pub fn close() -> Result<()> {
        let mut db_guard = DB.lock().unwrap();
        *db_guard = None;
        Ok(())
    }
}
