use std::collections::HashMap;

/// Parses a URL query string into a key-value map with percent-decoding.
pub(crate) fn parse_query(query: Option<&str>) -> HashMap<String, String> {
    let Some(query) = query else {
        return HashMap::new();
    };

    form_urlencoded::parse(query.as_bytes())
        .map(|(key, value)| (key.into_owned(), value.into_owned()))
        .collect()
}

#[cfg(test)]
mod tests {
    use super::parse_query;

    #[test]
    fn test_parse_query() {
        let query = parse_query(Some("sessionId=abc&fileId=some%20file&token=a%2Bb+c"));
        assert_eq!(query.get("sessionId").unwrap(), "abc");
        assert_eq!(query.get("fileId").unwrap(), "some file");
        assert_eq!(query.get("token").unwrap(), "a+b c");
    }

    #[test]
    fn test_parse_query_empty() {
        assert!(parse_query(None).is_empty());
        assert!(parse_query(Some("")).is_empty());
    }

    #[test]
    fn test_parse_query_no_value() {
        let query = parse_query(Some("flag&pin=123456"));
        assert_eq!(query.get("flag").unwrap(), "");
        assert_eq!(query.get("pin").unwrap(), "123456");
    }

    #[test]
    fn test_parse_query_invalid_percent() {
        let query = parse_query(Some("a=%zz&b=%4"));
        assert_eq!(query.get("a").unwrap(), "%zz");
        assert_eq!(query.get("b").unwrap(), "%4");
    }
}
