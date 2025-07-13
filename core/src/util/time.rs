use std::time::{SystemTime, SystemTimeError, UNIX_EPOCH};

pub(crate) fn unix_timestamp_u64() -> Result<u64, SystemTimeError> {
    let seconds = SystemTime::now().duration_since(UNIX_EPOCH)?.as_secs();

    Ok(seconds)
}
