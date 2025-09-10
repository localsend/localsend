use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// Clipboard data types that can be shared
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum ClipboardDataType {
    Text,
    Image,
    Html,
    Url,
    Files,
}

/// Clipboard data structure for transfer between devices
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ClipboardData {
    pub id: String,
    pub data_type: ClipboardDataType,
    pub mime_type: String,
    pub data: Option<String>, // Base64 encoded for binary content
    pub text: Option<String>,
    pub html: Option<String>,
    pub url: Option<String>,
    pub file_paths: Option<Vec<String>>,
    pub size: u64,
    pub timestamp: String, // ISO 8601 timestamp
}

/// Request to send clipboard data
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SendClipboardRequest {
    pub clipboard_data: ClipboardData,
}

/// Response for clipboard send request
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SendClipboardResponse {
    pub success: bool,
    pub message: Option<String>,
}

/// Request to receive clipboard data
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ReceiveClipboardRequest {
    pub device_id: String,
}

/// Response for clipboard receive request
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ReceiveClipboardResponse {
    pub success: bool,
    pub clipboard_data: Option<ClipboardData>,
    pub message: Option<String>,
}

/// Clipboard manager for handling clipboard operations
pub struct ClipboardManager {
    // In a real implementation, this would store clipboard data
    // For now, we'll use a simple in-memory storage
    clipboard_data: HashMap<String, ClipboardData>,
}

impl ClipboardManager {
    pub fn new() -> Self {
        Self {
            clipboard_data: HashMap::new(),
        }
    }

    /// Store clipboard data
    pub fn store_clipboard_data(&mut self, data: ClipboardData) {
        self.clipboard_data.insert(data.id.clone(), data);
    }

    /// Retrieve clipboard data by ID
    pub fn get_clipboard_data(&self, id: &str) -> Option<&ClipboardData> {
        self.clipboard_data.get(id)
    }

    /// Get all clipboard data
    pub fn get_all_clipboard_data(&self) -> Vec<&ClipboardData> {
        self.clipboard_data.values().collect()
    }

    /// Clear clipboard data
    pub fn clear_clipboard_data(&mut self) {
        self.clipboard_data.clear();
    }
}

impl Default for ClipboardManager {
    fn default() -> Self {
        Self::new()
    }
}
