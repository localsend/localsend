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

#[cfg(test)]
mod tests {
    use super::{ApiVersion, TargetUrl};

    #[test]
    fn test_build_url_ipv4() {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: "https",
            host: "192.168.1.1".to_string(),
            port: 53317,
            path: "/register",
            params: &[],
        }
        .to_string();
        assert_eq!(url, "https://192.168.1.1:53317/api/localsend/v2/register");
    }

    #[test]
    fn test_build_url_ipv6() {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: "https",
            host: "::1".to_string(),
            port: 53317,
            path: "/register",
            params: &[],
        }
        .to_string();
        assert_eq!(url, "https://[::1]:53317/api/localsend/v2/register");
    }

    #[test]
    fn test_build_url_http() {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: "http",
            host: "192.168.1.1".to_string(),
            port: 53317,
            path: "/info",
            params: &[],
        }
        .to_string();
        assert_eq!(url, "http://192.168.1.1:53317/api/localsend/v2/info");
    }
}
