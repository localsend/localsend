use crossterm::terminal::{Clear, ClearType};
use crossterm::{cursor, execute};
use localsend::util::filename;
use std::path::{Path, PathBuf};
use std::time::{Duration, Instant};

/// Enters the alternate screen for a modal widget (the file picker or the
/// device list). The caller must suspend the log UI first and resume it
/// after [leave_alternate_screen].
pub fn enter_alternate_screen() -> anyhow::Result<()> {
    execute!(
        std::io::stdout(),
        crossterm::terminal::EnterAlternateScreen,
        cursor::Hide
    )?;
    Ok(())
}

/// Leaves the alternate screen. Must be called exactly once per enter.
///
/// Clears via crossterm, not `Terminal::clear`: the latter queries the
/// cursor position, whose response is read from the event stream but
/// the keyboard reader thread is parked in `crossterm::event::read()`,
/// so the query only ever returns after crossterm's 2s timeout.
pub fn leave_alternate_screen() {
    let _ = execute!(
        std::io::stdout(),
        Clear(ClearType::All),
        cursor::MoveTo(0, 0),
        crossterm::terminal::LeaveAlternateScreen,
        cursor::Show
    );
}

/// Clears the alternate screen without leaving it, for handing it over from
/// one modal to the next — leaving and re-entering would flash the main
/// screen in between.
pub fn clear_alternate_screen() {
    let _ = execute!(
        std::io::stdout(),
        Clear(ClearType::All),
        cursor::MoveTo(0, 0)
    );
}

pub fn format_bytes(bytes: u64) -> String {
    const UNITS: [&str; 5] = ["B", "KB", "MB", "GB", "TB"];
    let mut value = bytes as f64;
    let mut unit = 0;
    while value >= 1000.0 && unit < UNITS.len() - 1 {
        value /= 1000.0;
        unit += 1;
    }
    match unit {
        0 => format!("{bytes} B"),
        _ => format!("{value:.1} {}", UNITS[unit]),
    }
}

pub fn format_speed(bytes_per_sec: f64) -> String {
    format!("{}/s", format_bytes(bytes_per_sec.max(0.0) as u64))
}

pub fn format_duration(duration: Duration) -> String {
    let secs = duration.as_secs();
    let (h, m, s) = (secs / 3600, (secs % 3600) / 60, secs % 60);
    if h > 0 {
        format!("{h}h {m}m")
    } else if m > 0 {
        format!("{m}m {s}s")
    } else {
        format!("{s}s")
    }
}

/// The width of the terminal in columns, falling back to 120 when it cannot be
/// determined (e.g. when the output is not a terminal).
pub fn terminal_width() -> usize {
    crossterm::terminal::size()
        .map(|(w, _)| w as usize)
        .unwrap_or(120)
}

pub fn progress_bar(fraction: f64, width: usize) -> String {
    let filled = (fraction.clamp(0.0, 1.0) * width as f64).round() as usize;
    format!("{}{}", "#".repeat(filled), "-".repeat(width - filled))
}

/// A path in `dir` for `file_name` that does not exist yet, appending
/// ` (1)`, ` (2)`, … before the extension on collisions.
///
/// `file_name` comes from the sender and is untrusted. A folder transfer
/// arrives as a relative path (`holiday/2024/IMG_1.jpg`), so the directory
/// structure is preserved: each segment is sanitized individually and joined
/// onto `dir`, and no segment can escape it.
///
/// Returns `None` when nothing usable is left after sanitizing, so the caller
/// can report the file as rejected instead of writing to a surprising path.
pub fn unique_path(dir: &Path, file_name: &str) -> Option<PathBuf> {
    let rules = filename::Rules::current();

    let segments: Vec<String> = file_name
        // `/` always separates. `\` separates only on Windows, where it is
        // illegal in a file name; on Unix it is a legal character and the
        // sender encodes folder paths with `/` only.
        .split(|c: char| c == '/' || (cfg!(windows) && c == '\\'))
        // Drop empty segments (`a//b`) and relative ones (`.` and `..`), which
        // is what keeps the result inside `dir`.
        .filter(|segment| !segment.is_empty() && *segment != "." && *segment != "..")
        .map(|segment| filename::sanitize(segment, rules))
        .filter(|segment| !segment.is_empty())
        .collect();

    let (last, parents) = segments.split_last()?;

    // A sender-supplied name may be deep enough to exceed the path length
    // limit once every directory exists; keep the trailing directories, which
    // are the ones that say where the file actually lives, and drop the
    // leading ones rather than fail the transfer. The budget counts only the
    // received path, not the destination's own depth.
    let kept = parents.len().min(MAX_PATH_COMPONENTS - 1);
    let parent = parents[parents.len() - kept..]
        .iter()
        .fold(dir.to_path_buf(), |path, segment| path.join(segment));

    // ponytail: NOTE residual risk — `create_dir_all` follows symlinks, so a
    // sender-named parent that already exists as a symlink in the destination
    // escapes it. Needs a local symlink (no receive path creates one); the fix
    // is dirfd-relative traversal in `save_req_to_target`, not canonicalize
    // (TOCTOU).
    let candidate = parent.join(unique_file_name(&parent, last));
    std::fs::create_dir_all(&parent).ok()?;
    Some(candidate)
}

/// ` (1)`, ` (2)`, … before the extension until the name is free in `dir`.
fn unique_file_name(dir: &Path, name: &str) -> String {
    if !dir.join(name).exists() {
        return name.to_string();
    }

    let (stem, extension) = match name.rsplit_once('.') {
        Some((stem, extension)) if !stem.is_empty() => (stem, format!(".{extension}")),
        _ => (name, String::new()),
    };
    (1..)
        .map(|i| format!("{stem} ({i}){extension}"))
        .find(|candidate| !dir.join(candidate).exists())
        .unwrap()
}

/// How many path components a received file may add below the destination.
const MAX_PATH_COMPONENTS: usize = 32;

/// Estimates the transfer speed from cumulative byte counts, smoothed with an
/// exponential moving average.
pub struct SpeedMeter {
    last_bytes: u64,
    last_time: Instant,
    ema: f64,
}

impl SpeedMeter {
    pub fn new() -> Self {
        Self {
            last_bytes: 0,
            last_time: Instant::now(),
            ema: 0.0,
        }
    }

    pub fn update(&mut self, bytes_now: u64) -> f64 {
        let now = Instant::now();
        let dt = now.duration_since(self.last_time).as_secs_f64();
        if dt < 0.1 {
            return self.ema;
        }
        let instantaneous = bytes_now.saturating_sub(self.last_bytes) as f64 / dt;
        self.ema = match self.ema {
            0.0 => instantaneous,
            ema => ema * 0.7 + instantaneous * 0.3,
        };
        self.last_bytes = bytes_now;
        self.last_time = now;
        self.ema
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A fresh directory per test (`name` disambiguates tests, the process id
    /// keeps parallel `cargo test` processes apart).
    fn temp_dir(name: &str) -> PathBuf {
        let dir =
            std::env::temp_dir().join(format!("localsend-cli-util-{name}-{}", std::process::id()));
        let _ = std::fs::remove_dir_all(&dir);
        std::fs::create_dir_all(&dir).unwrap();
        dir
    }

    #[test]
    fn test_preserves_folder_structure() {
        let dir = temp_dir("structure");

        let path = unique_path(&dir, "holiday/2024/IMG_1.jpg").unwrap();

        assert_eq!(path, dir.join("holiday").join("2024").join("IMG_1.jpg"));
        assert!(
            path.parent().unwrap().is_dir(),
            "parent directories must be created"
        );
    }

    #[test]
    fn test_single_file_name_is_unchanged() {
        let dir = temp_dir("single");

        assert_eq!(
            unique_path(&dir, "IMG_1.jpg").unwrap(),
            dir.join("IMG_1.jpg")
        );
    }

    #[test]
    fn test_rejects_traversal_out_of_destination() {
        let dir = temp_dir("traversal");

        // A relative segment must never survive into the path. `filename::sanitize`
        // would also rewrite ".." to a placeholder name, so asserting on the
        // placeholder would pass even if this filter were removed; assert instead
        // that no relative component and no directory outside `dir` is produced.
        // Each name carries a marker file name so the assertion below can see
        // whether the directory part survived verbatim.
        #[allow(unused_mut)] // extended below on Windows only
        let mut names = vec![
            "../../etc/passwd",
            "..",
            "../escape.txt",
            "a/../../escape.txt",
            "a/b/../../../escape.txt",
            "/etc/passwd",
            "legit/keep.txt",
            "legit//double.txt",
            "./legit.txt",
        ];
        // `\` is a separator only on Windows; on Unix it is an ordinary name
        // character, so there these are just oddly named files, not traversal.
        #[cfg(windows)]
        names.extend([r"..\..\windows\system32\config", r"a\..\..\escape.txt"]);

        for name in names {
            let Some(path) = unique_path(&dir, name) else {
                continue;
            };

            assert!(
                !path
                    .components()
                    .any(|c| matches!(c, std::path::Component::ParentDir)),
                "{name} kept a parent-dir component: {}",
                path.display()
            );

            let relative = path
                .strip_prefix(&dir)
                .unwrap_or_else(|_| panic!("{name} escaped the destination: {}", path.display()));
            assert!(
                relative
                    .components()
                    .all(|c| matches!(c, std::path::Component::Normal(_))),
                "{name} produced a non-plain component: {}",
                path.display()
            );
            assert!(
                !relative.to_string_lossy().contains(".."),
                "{name} produced a '..' segment: {}",
                path.display()
            );
        }
    }

    /// A relative segment is dropped, so it must not leave a placeholder-named
    /// directory behind. `filename::sanitize` maps ".." to "untitled", which
    /// would keep the path inside `dir` but litter it with bogus directories, so
    /// this asserts on the directory structure rather than only on containment.
    #[test]
    fn test_relative_segments_do_not_create_directories() {
        let dir = temp_dir("relative");

        for (name, expected) in [
            ("../escape.txt", "escape.txt"),
            ("a/../../escape.txt", "a/escape.txt"),
            ("../../etc/passwd", "etc/passwd"),
            ("legit/keep.txt", "legit/keep.txt"),
            ("./legit.txt", "legit.txt"),
            ("legit//double.txt", "legit/double.txt"),
        ] {
            let path = unique_path(&dir, name).unwrap();
            let relative = path.strip_prefix(&dir).unwrap();
            assert_eq!(
                relative.to_string_lossy().replace('\\', "/"),
                expected,
                "unexpected structure for {name:?}"
            );
        }
    }

    #[test]
    fn test_rejects_names_without_usable_segments() {
        let dir = temp_dir("unusable");

        assert!(unique_path(&dir, "..").is_none());
        assert!(unique_path(&dir, ".").is_none());
        assert!(unique_path(&dir, "/").is_none());
        assert!(unique_path(&dir, "").is_none());
    }

    #[test]
    fn test_collisions_are_numbered_per_directory() {
        let dir = temp_dir("collisions");
        std::fs::create_dir_all(dir.join("a")).unwrap();
        std::fs::create_dir_all(dir.join("b")).unwrap();
        std::fs::write(dir.join("a").join("f.txt"), "x").unwrap();
        std::fs::write(dir.join("b").join("f.txt"), "x").unwrap();

        // Same name in two folders: both collide with their own directory, and
        // neither may steal the other's slot.
        assert_eq!(
            unique_path(&dir, "a/f.txt").unwrap(),
            dir.join("a").join("f (1).txt")
        );
        assert_eq!(
            unique_path(&dir, "b/f.txt").unwrap(),
            dir.join("b").join("f (1).txt")
        );
    }

    #[test]
    fn test_sanitizes_illegal_characters_in_each_segment() {
        let dir = temp_dir("illegal");

        // `:` is illegal on HFS+/APFS and FAT/Windows alike, so it is sanitized
        // on every platform the CLI runs on. The separators must survive.
        let path = unique_path(&dir, "a:b/c:d.txt").unwrap();

        assert_eq!(path.parent().unwrap().file_name().unwrap(), "a_b");
        assert_eq!(path.file_name().unwrap(), "c_d.txt");
    }

    /// `\` is a legal file name character on Unix, so a name containing one must
    /// stay a single file instead of becoming a directory plus a file.
    #[cfg(unix)]
    #[test]
    fn test_keeps_backslash_in_unix_file_name() {
        let dir = temp_dir("backslash");

        assert_eq!(
            unique_path(&dir, r"weird\name").unwrap(),
            dir.join(r"weird\name")
        );
    }

    #[test]
    fn test_bounds_deeply_nested_paths() {
        let dir = temp_dir("deep");

        // Distinct directory names, otherwise the assertion below cannot tell
        // a kept directory from a dropped one.
        let subs: Vec<String> = (0..200).map(|i| format!("sub-{i}")).collect();
        let deep = format!("{}/IMG_1.jpg", subs.join("/"));
        let path = unique_path(&dir, &deep).unwrap();

        // The trailing directories survive, as many as fit alongside the file
        // name: they are the ones that say where the file actually lives.
        let expected = subs[subs.len() - (MAX_PATH_COMPONENTS - 1)..]
            .iter()
            .fold(PathBuf::new(), |path, sub| path.join(sub))
            .join("IMG_1.jpg");

        assert_eq!(path, dir.join(expected));
        assert_eq!(
            path.strip_prefix(&dir).unwrap().components().count(),
            MAX_PATH_COMPONENTS,
            "path depth must stay bounded"
        );
        // The file itself is what matters; the name must survive.
        assert_eq!(path.file_name().unwrap(), "IMG_1.jpg");
    }
}
