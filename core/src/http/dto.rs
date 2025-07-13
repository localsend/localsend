use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, PartialEq, Eq, Deserialize, Serialize)]
pub struct NonceRequest {
    /// The nonce string.
    pub nonce: String,
}
