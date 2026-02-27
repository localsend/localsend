use std::borrow::Cow;

pub struct TargetUrl<'a> {
    pub version: ApiVersion,
    pub protocol: &'static str,
    pub host: String,
    pub port: u16,
    pub path: &'static str,

    /// Query parameters as key-value pairs.
    /// Note: It is expected that the caller will URL-encode the values if necessary.
    pub params: &'a [(&'static str, &'a str)],
}

pub enum ApiVersion {
    V2,
    V3,
}

impl<'a> TargetUrl<'a> {
    pub fn to_string(&self) -> String {
        let base = format!(
            "{}://{}:{}/api/localsend/{}{}",
            self.protocol,
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
        );
        if self.params.is_empty() {
            base
        } else {
            let query = self
                .params
                .iter()
                .map(|(k, v)| format!("{}={}", k, v))
                .collect::<Vec<_>>()
                .join("&");
            format!("{}?{}", base, query)
        }
    }
}
