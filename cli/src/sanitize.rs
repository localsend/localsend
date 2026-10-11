/// Sanitizes a remote string for a single line: line breaks and tabs become
/// spaces, every other control character is removed.
pub fn single_line(s: &str) -> String {
    s.chars()
        .filter_map(|c| match c {
            '\t' | '\n' | '\r' => Some(' '),
            c if c.is_control() => None,
            c => Some(c),
        })
        .collect()
}

/// Sanitizes a multi-line remote string: line breaks and tabs are kept
/// (`\r\n` and lone `\r` become `\n`), every other control character is removed.
pub fn multi_line(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    let mut chars = s.chars().peekable();
    while let Some(c) = chars.next() {
        match c {
            '\r' => {
                if chars.peek() == Some(&'\n') {
                    chars.next();
                }
                out.push('\n');
            }
            '\n' | '\t' => out.push(c),
            c if c.is_control() => {}
            c => out.push(c),
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::{multi_line, single_line};

    #[test]
    fn keeps_plain_text() {
        assert_eq!(single_line("Cute Tomato 🍅"), "Cute Tomato 🍅");
        assert_eq!(multi_line("Cute Tomato 🍅"), "Cute Tomato 🍅");
    }

    #[test]
    fn strips_escape_sequences() {
        assert_eq!(single_line("\u{1b}[31mred\u{1b}[0m"), "[31mred[0m");
        assert_eq!(multi_line("\u{1b}]0;title\u{7}text"), "]0;titletext");
    }

    #[test]
    fn strips_del_and_c1_controls() {
        assert_eq!(single_line("a\u{7f}b\u{9b}31mc"), "ab31mc");
        assert_eq!(multi_line("a\u{7f}b\u{9b}31mc"), "ab31mc");
    }

    #[test]
    fn single_line_flattens_line_breaks() {
        assert_eq!(single_line("a\r\nb\tc\nd"), "a  b c d");
    }

    #[test]
    fn multi_line_normalizes_line_breaks() {
        assert_eq!(multi_line("a\r\nb\rc\nd\te"), "a\nb\nc\nd\te");
    }
}
