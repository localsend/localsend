use std::borrow::Cow;
use std::fmt::Write;

pub struct TargetUrl<'a> {
    pub version: ApiVersion,
    pub protocol: &'static str,
    pub host: String,
    pub port: u16,
    pub path: &'static str,

    /// Query parameters as key-value pairs.
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
                .map(|(k, v)| format!("{}={}", k, percent_encode(v)))
                .collect::<Vec<_>>()
                .join("&");
            format!("{}?{}", base, query)
        }
    }
}

/// Percent-encodes characters that are not unreserved in a URL query value
/// (RFC 3986: unreserved = ALPHA / DIGIT / "-" / "." / "_" / "~").
fn percent_encode(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    for b in s.bytes() {
        match b {
            b'A'..=b'Z' | b'a'..=b'z' | b'0'..=b'9' | b'-' | b'.' | b'_' | b'~' => {
                out.push(b as char);
            }
            _ => write!(out, "%{b:02X}").unwrap(),
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::percent_encode;
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

    #[test]
    fn test_percent_encode() {
        assert_eq!(percent_encode("hello"), "hello");
        assert_eq!(percent_encode("a b"), "a%20b");
        assert_eq!(percent_encode("key=value"), "key%3Dvalue");
        assert_eq!(percent_encode("a&b"), "a%26b");
        assert_eq!(percent_encode("foo-bar_baz.qux~"), "foo-bar_baz.qux~");
    }

    #[test]
    fn test_build_url_with_params() {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: "https",
            host: "192.168.1.1".to_string(),
            port: 53317,
            path: "/register",
            params: &[("sessionId", "abc-123"), ("token", "t&v=1")],
        }
        .to_string();
        assert_eq!(
            url,
            "https://192.168.1.1:53317/api/localsend/v2/register?sessionId=abc-123&token=t%26v%3D1"
        );
    }
}
