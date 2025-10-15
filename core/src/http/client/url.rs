use crate::model::discovery::ProtocolType;
use std::borrow::Cow;

pub struct TargetUrl {
    pub version: ApiVersion,
    pub protocol: ProtocolType,
    pub host: String,
    pub port: u16,
    pub path: &'static str,
}

pub enum ApiVersion {
    V2,
    V3,
}

impl TargetUrl {
    pub fn to_string(&self) -> String {
        format!(
            "{}://{}:{}/api/localsend/{}{}",
            self.protocol.as_str(),
            match self.host.contains(':') {
                true => Cow::Owned(format!("[{}]", self.host)), // IPv6 addresses need to be enclosed in brackets
                false => Cow::Borrowed(&self.host),
            },
            self.port,
            match self.version {
                ApiVersion::V2 => "v2",
                ApiVersion::V3 => "v3",
            },
            self.path
        )
    }
}
