//! Filename sanitization for untrusted, peer-supplied file names.

/// Characters that are illegal on Windows and FAT volumes.
const ILLEGAL_WINDOWS_CHARS: &[char] = &['<', '>', ':', '"', '/', '\\', '|', '?', '*'];

/// Characters that are illegal on HFS/APFS. `:` is the classic Mac path
/// separator and still shows up as `/` in Finder.
const ILLEGAL_HFS_CHARS: &[char] = &['/', ':'];

/// Characters that are illegal on POSIX filesystems.
const ILLEGAL_POSIX_CHARS: &[char] = &['/'];

/// Device names Windows reserves regardless of extension.
const RESERVED_WINDOWS_NAMES: &[&str] = &[
    "con", "prn", "aux", "nul", "com1", "com2", "com3", "com4", "com5", "com6", "com7", "com8",
    "com9", "lpt1", "lpt2", "lpt3", "lpt4", "lpt5", "lpt6", "lpt7", "lpt8", "lpt9",
];

/// Maximum file name length in bytes, the limit on ext4, APFS and HFS+.
const MAX_LEN: usize = 255;

/// The naming rules to apply, selected by target filesystem rather than by OS
/// so that callers can sanitize for a destination that is not the local one
/// (a SAF tree on external FAT storage, for instance).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Rules {
    /// NTFS: illegal characters, reserved device names, no trailing `.` or ` `.
    Windows,
    /// HFS+/APFS: `/` and `:`.
    Hfs,
    /// FAT/exFAT, the common case for Android external storage: the Windows
    /// character set without the reserved names.
    Fat,
    /// POSIX: `/` and NUL only.
    Posix,
    /// The intersection of all of the above. Use when the destination
    /// filesystem is unknown or the file may be copied between platforms.
    Universal,
}

impl Rules {
    /// The rules for the platform this binary was compiled for.
    pub const fn current() -> Self {
        if cfg!(target_os = "windows") {
            Self::Windows
        } else if cfg!(any(target_os = "macos", target_os = "ios")) {
            Self::Hfs
        } else if cfg!(target_os = "android") {
            Self::Fat
        } else if cfg!(unix) {
            Self::Posix
        } else {
            Self::Universal
        }
    }

    fn illegal_chars(self) -> &'static [char] {
        match self {
            Self::Windows | Self::Fat => ILLEGAL_WINDOWS_CHARS,
            Self::Hfs => ILLEGAL_HFS_CHARS,
            Self::Posix => ILLEGAL_POSIX_CHARS,
            // `Universal` is handled by combining the sets, see `is_illegal_char`.
            Self::Universal => &[],
        }
    }

    fn is_illegal_char(self, c: char) -> bool {
        if c.is_control() {
            return true;
        }
        match self {
            Self::Universal => ILLEGAL_WINDOWS_CHARS.contains(&c) || ILLEGAL_HFS_CHARS.contains(&c),
            _ => self.illegal_chars().contains(&c),
        }
    }

    /// Whether reserved device names and trailing `.`/` ` matter.
    fn is_windows_like(self) -> bool {
        matches!(self, Self::Windows | Self::Universal)
    }
}

/// Options for [`sanitize_with`].
#[derive(Debug, Clone, Copy)]
pub struct Options<'a> {
    /// Substituted for each illegal character.
    pub replacement: &'a str,
    /// Used when sanitization leaves the name empty.
    pub placeholder: &'a str,
}

impl Default for Options<'_> {
    fn default() -> Self {
        Self {
            replacement: "_",
            placeholder: "untitled",
        }
    }
}

/// Rewrites `name` into a file name that is legal under `rules`, using the
/// default [`Options`].
///
/// `name` must already be a single path segment; this does not split paths and
/// will replace any separator it finds. Callers holding a peer-supplied path
/// should take the last segment first — see [`sanitize_path`].
pub fn sanitize(name: &str, rules: Rules) -> String {
    sanitize_with(name, rules, &Options::default())
}

/// [`sanitize`] with explicit replacement and placeholder strings.
pub fn sanitize_with(name: &str, rules: Rules, options: &Options) -> String {
    let mut result = String::with_capacity(name.len());
    for c in name.chars() {
        if rules.is_illegal_char(c) {
            result.push_str(options.replacement);
        } else {
            result.push(c);
        }
    }

    if rules.is_windows_like() {
        collapse_trailing_run(&mut result, options.replacement);

        if let Some(reserved) = reserved_prefix(&result) {
            result = format!("{}{}", options.replacement, &result[reserved.len()..]);
        }
    }

    truncate_bytes(&mut result, MAX_LEN);

    if rules.is_windows_like() {
        // Truncation can cut right after a `.` or ` `, leaving a trailing run
        // that did not exist before the cut.
        collapse_trailing_run(&mut result, options.replacement);
        truncate_bytes(&mut result, MAX_LEN);
    }

    if result.is_empty() || is_relative(&result) {
        result = options.placeholder.to_string();
        truncate_bytes(&mut result, MAX_LEN);
    }

    result
}

/// Replaces a trailing run of `.`/` ` with a single `replacement`.
fn collapse_trailing_run(result: &mut String, replacement: &str) {
    let trimmed_len = result.trim_end_matches(['.', ' ']).len();
    if trimmed_len != result.len() {
        result.truncate(trimmed_len);
        result.push_str(replacement);
    }
}

/// Whether `name` is already legal under `rules`, i.e. whether [`sanitize`]
/// would leave it untouched. Suitable for validating user input before it is
/// written.
pub fn is_valid(name: &str, rules: Rules) -> bool {
    if name.is_empty() || name.len() > MAX_LEN || is_relative(name) {
        return false;
    }

    if name.chars().any(|c| rules.is_illegal_char(c)) {
        return false;
    }

    if rules.is_windows_like()
        && (name.ends_with('.') || name.ends_with(' ') || reserved_prefix(name).is_some())
    {
        return false;
    }

    true
}

/// Sanitizes a peer-supplied *path* — a name that may carry directory
/// components, as protocol v2 allows for folder transfers — into a single
/// legal file name.
///
/// Only the last segment survives, so `../../etc/passwd` becomes `passwd`:
/// this collapses the path rather than preserving the directory structure.
pub fn sanitize_path(path: &str, rules: Rules) -> String {
    let last = path
        .rsplit(['/', '\\'])
        .find(|segment| !segment.is_empty() && !is_relative(segment))
        .unwrap_or("");

    sanitize(last, rules)
}

/// Returns the reserved device name `name` starts with, if its stem (the part
/// before the first `.`) is reserved.
fn reserved_prefix(name: &str) -> Option<&'static str> {
    let stem = name.split('.').next().unwrap_or(name);
    RESERVED_WINDOWS_NAMES
        .iter()
        .copied()
        .find(|reserved| stem.eq_ignore_ascii_case(reserved))
}

fn is_relative(name: &str) -> bool {
    name == "." || name == ".."
}

/// Truncates in place to at most `max` bytes, cutting on a character boundary.
fn truncate_bytes(value: &mut String, max: usize) {
    if value.len() <= max {
        return;
    }

    let mut end = max;
    while !value.is_char_boundary(end) {
        end -= 1;
    }
    value.truncate(end);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_replaces_illegal_characters() {
        assert_eq!(
            sanitize("a<b>c:d\"e/f\\g|h?i*j", Rules::Windows),
            "a_b_c_d_e_f_g_h_i_j"
        );
        assert_eq!(sanitize("a/b:c", Rules::Hfs), "a_b_c");
        assert_eq!(sanitize("a/b:c", Rules::Posix), "a_b:c");
        assert_eq!(sanitize("a\u{0}b\u{7f}c", Rules::Posix), "a_b_c");
    }

    #[test]
    fn test_keeps_legal_names() {
        for rules in [
            Rules::Windows,
            Rules::Hfs,
            Rules::Fat,
            Rules::Posix,
            Rules::Universal,
        ] {
            assert_eq!(
                sanitize("holiday photo (1).jpg", rules),
                "holiday photo (1).jpg"
            );
            assert_eq!(sanitize("Ünïcödé — 文件.txt", rules), "Ünïcödé — 文件.txt");
        }
    }

    #[test]
    fn test_windows_trailing_characters() {
        assert_eq!(sanitize("report.", Rules::Windows), "report_");
        assert_eq!(sanitize("report...  ", Rules::Windows), "report_");
        assert_eq!(sanitize("report.", Rules::Posix), "report.");
        assert_eq!(sanitize("report.", Rules::Fat), "report.");
    }

    #[test]
    fn test_reserved_windows_names() {
        assert_eq!(sanitize("con", Rules::Windows), "_");
        assert_eq!(sanitize("NUL.txt", Rules::Windows), "_.txt");
        assert_eq!(sanitize("com9.tar.gz", Rules::Windows), "_.tar.gz");
        // Only the exact stem is reserved.
        assert_eq!(sanitize("console.txt", Rules::Windows), "console.txt");
        assert_eq!(sanitize("com10.txt", Rules::Windows), "com10.txt");
        // FAT has no reserved names.
        assert_eq!(sanitize("con", Rules::Fat), "con");
    }

    #[test]
    fn test_placeholder() {
        assert_eq!(sanitize("", Rules::Posix), "untitled");
        assert_eq!(sanitize(".", Rules::Posix), "untitled");
        assert_eq!(sanitize("..", Rules::Posix), "untitled");
        assert_eq!(sanitize("///", Rules::Posix), "___");

        let options = Options {
            replacement: "",
            placeholder: "unnamed",
        };
        assert_eq!(sanitize_with("///", Rules::Posix, &options), "unnamed");
        assert_eq!(sanitize_with("a/b", Rules::Posix, &options), "ab");
    }

    #[test]
    fn test_truncates_on_char_boundary() {
        let long = "ä".repeat(200); // 400 bytes
        let sanitized = sanitize(&long, Rules::Posix);
        assert_eq!(sanitized.len(), MAX_LEN - 1); // 254: 127 × 2 bytes
        assert!(sanitized.chars().all(|c| c == 'ä'));
    }

    /// Truncation must not leave a trailing `.` or ` ` behind on Windows-like
    /// rules — the cut can land right after one.
    #[test]
    fn test_truncation_does_not_expose_trailing_run() {
        let dot = format!("{}.{}", "a".repeat(254), "b".repeat(10));
        let sanitized = sanitize(&dot, Rules::Windows);
        assert_eq!(sanitized, format!("{}_", "a".repeat(254)));
        assert!(is_valid(&sanitized, Rules::Windows));

        let space = format!("{} {}", "a".repeat(254), "b".repeat(10));
        assert_eq!(
            sanitize(&space, Rules::Windows),
            format!("{}_", "a".repeat(254))
        );

        // POSIX allows trailing dots, so the cut stays as-is there.
        assert_eq!(
            sanitize(&dot, Rules::Posix),
            format!("{}.", "a".repeat(254))
        );
    }

    #[test]
    fn test_sanitize_path_collapses_directories() {
        assert_eq!(sanitize_path("../../etc/passwd", Rules::Posix), "passwd");
        assert_eq!(sanitize_path("a/b/c.txt", Rules::Posix), "c.txt");
        assert_eq!(
            sanitize_path("C:\\Windows\\evil.exe", Rules::Windows),
            "evil.exe"
        );
        assert_eq!(sanitize_path("dir/", Rules::Posix), "dir");
        assert_eq!(sanitize_path("..", Rules::Posix), "untitled");
        assert_eq!(sanitize_path("/", Rules::Posix), "untitled");
    }

    #[test]
    fn test_is_valid() {
        assert!(is_valid("photo.jpg", Rules::Windows));
        assert!(!is_valid("", Rules::Windows));
        assert!(!is_valid("a:b", Rules::Windows));
        assert!(!is_valid("a:b", Rules::Hfs));
        assert!(is_valid("a:b", Rules::Posix));
        assert!(!is_valid("con.txt", Rules::Windows));
        assert!(is_valid("con.txt", Rules::Posix));
        assert!(!is_valid("trailing.", Rules::Windows));
        assert!(!is_valid("..", Rules::Posix));
        assert!(!is_valid(&"a".repeat(256), Rules::Posix));
        assert!(is_valid(&"a".repeat(255), Rules::Posix));
    }

    /// `is_valid` must agree with `sanitize` — otherwise a name the UI accepts
    /// still gets rewritten on save, or vice versa.
    #[test]
    fn test_is_valid_matches_sanitize() {
        let names = [
            "photo.jpg",
            "",
            ".",
            "..",
            "a:b",
            "a/b",
            "a\\b",
            "a\u{0}b",
            "a\u{1f}b",
            "con",
            "con.txt",
            "console",
            "lpt9.tar.gz",
            "trailing.",
            "trailing ",
            "trailing...",
            " leading",
            "Ünïcödé.txt",
            "文件.txt",
            &"a".repeat(255),
            &"a".repeat(256),
        ];

        for rules in [
            Rules::Windows,
            Rules::Hfs,
            Rules::Fat,
            Rules::Posix,
            Rules::Universal,
        ] {
            for name in names {
                assert_eq!(
                    is_valid(name, rules),
                    sanitize(name, rules) == name,
                    "mismatch for {name:?} under {rules:?}"
                );
            }
        }
    }
}
