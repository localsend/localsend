use crate::http::server::common::error::AppError;
use hyper::StatusCode;
use lru::LruCache;
use std::collections::HashMap;
use std::net::IpAddr;
use tokio::sync::Mutex;

/// Maximum failed PIN attempts per IP before requests are blocked with 429.
const MAX_PIN_ATTEMPTS: u32 = 3;

/// Checks the `pin` query parameter against the required PIN (if any).
pub(crate) async fn check_pin(
    required_pin: Option<&str>,
    pin_attempts: &Mutex<LruCache<IpAddr, u32>>,
    query: &HashMap<String, String>,
    ip: IpAddr,
) -> Result<(), AppError> {
    let Some(required_pin) = required_pin else {
        return Ok(());
    };

    let mut attempts = pin_attempts.lock().await;
    let count = attempts.get(&ip).copied().unwrap_or(0);
    if count >= MAX_PIN_ATTEMPTS {
        return Err(AppError::Message(
            StatusCode::TOO_MANY_REQUESTS,
            "Too many requests".to_string(),
        ));
    }

    match query.get("pin") {
        Some(pin) if pin == required_pin => {
            attempts.pop(&ip);
            Ok(())
        }
        Some(_) => {
            attempts.put(ip, count + 1);
            Err(AppError::Message(
                StatusCode::UNAUTHORIZED,
                "Invalid PIN".to_string(),
            ))
        }
        None => Err(AppError::Message(
            StatusCode::UNAUTHORIZED,
            "PIN required".to_string(),
        )),
    }
}
