use std::error::Error;
use std::fmt::{Display, Formatter};

/// Displays an error together with its whole source chain, joined by `: `.
///
/// Plain [`Display`] only prints the outermost error, which hides the actual
/// cause for wrappers like `reqwest::Error` ("error sending request for url ...").
pub struct ErrorChain<'a>(pub &'a dyn Error);

impl Display for ErrorChain<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.0)?;

        let mut source = self.0.source();
        while let Some(err) = source {
            write!(f, ": {err}")?;
            source = err.source();
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Debug)]
    struct TestError(&'static str, Option<Box<TestError>>);

    impl Display for TestError {
        fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
            write!(f, "{}", self.0)
        }
    }

    impl Error for TestError {
        fn source(&self) -> Option<&(dyn Error + 'static)> {
            self.1.as_ref().map(|err| err as &(dyn Error + 'static))
        }
    }

    #[test]
    fn formats_the_whole_chain() {
        let err = TestError(
            "outer",
            Some(Box::new(TestError(
                "middle",
                Some(Box::new(TestError("inner", None))),
            ))),
        );

        assert_eq!(ErrorChain(&err).to_string(), "outer: middle: inner");
    }

    #[test]
    fn formats_a_single_error() {
        assert_eq!(ErrorChain(&TestError("only", None)).to_string(), "only");
    }
}
