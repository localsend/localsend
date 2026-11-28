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

/// Returns a non-colliding relative path under `dir` for `file_name`, appending
/// ` (1)`, ` (2)`, … before the extension on collisions.
///
/// `file_name` comes from the sender and is untrusted: it is collapsed to its
/// final path component and sanitized for the local filesystem, so it can
/// neither escape the target directory nor carry illegal characters.
///
/// Occupancy is checked without following symlinks so dangling leaf symlinks are
/// treated as occupied rather than free, and intermediate symlink segments stop
/// traversal cleanly (leaving rejection to `packages/core`'s directory-relative
/// opener).
pub fn unique_relative_path(dir: &Path, file_name: &str) -> PathBuf {
    let name = filename::sanitize_path(file_name, filename::Rules::current());
    let candidate = PathBuf::from(&name);
    if !path_occupied_no_follow(dir, &candidate) {
        return candidate;
    }

    let parent = candidate.parent().unwrap_or_else(|| Path::new(""));
    let base_name = candidate
        .file_name()
        .and_then(|s| s.to_str())
        .unwrap_or(name.as_str());
    let (stem, extension) = match base_name.rsplit_once('.') {
        Some((stem, extension)) if !stem.is_empty() => (stem, format!(".{extension}")),
        _ => (base_name, String::new()),
    };

    (1..)
        .map(|i| parent.join(format!("{stem} ({i}){extension}")))
        .find(|candidate| !path_occupied_no_follow(dir, candidate))
        .unwrap()
}

fn path_occupied_no_follow(root: &Path, relative: &Path) -> bool {
    let mut current = root.to_path_buf();
    let mut components = relative.components().peekable();
    while let Some(component) = components.next() {
        current.push(component);
        let is_last = components.peek().is_none();
        match std::fs::symlink_metadata(&current) {
            Ok(meta) => {
                if is_last {
                    return true;
                }
                if meta.file_type().is_symlink() || !meta.is_dir() {
                    // Do not probe through symlinks or non-directory segments; let `save` reject them.
                    return false;
                }
            }
            Err(err) if err.kind() == std::io::ErrorKind::NotFound => return false,
            Err(_) => return false,
        }
    }
    false
}

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
    use std::path::PathBuf;

    struct TempDir(PathBuf);

    impl TempDir {
        fn new(name: &str) -> Self {
            let path = std::env::temp_dir().join(format!(
                "localsend-cli-util-{name}-{}",
                uuid::Uuid::new_v4()
            ));
            std::fs::create_dir_all(&path).unwrap();
            Self(path)
        }
    }

    impl Drop for TempDir {
        fn drop(&mut self) {
            let _ = std::fs::remove_dir_all(&self.0);
        }
    }

    #[test]
    fn unique_relative_path_handles_regular_file_collision() {
        let dir = TempDir::new("regular");
        std::fs::write(dir.0.join("photo.jpg"), b"existing").unwrap();
        assert_eq!(
            unique_relative_path(&dir.0, "photo.jpg"),
            PathBuf::from("photo (1).jpg")
        );

        std::fs::write(dir.0.join("photo (1).jpg"), b"existing").unwrap();
        assert_eq!(
            unique_relative_path(&dir.0, "photo.jpg"),
            PathBuf::from("photo (2).jpg")
        );
    }

    #[test]
    fn unique_relative_path_handles_hidden_and_path_traversal_inputs() {
        let dir = TempDir::new("hidden");
        std::fs::write(dir.0.join(".hidden"), b"1").unwrap();
        assert_eq!(
            unique_relative_path(&dir.0, ".hidden"),
            PathBuf::from(".hidden (1)")
        );

        std::fs::write(dir.0.join("passwd"), b"1").unwrap();
        assert_eq!(
            unique_relative_path(&dir.0, "../../etc/passwd"),
            PathBuf::from("passwd (1)")
        );
    }

    #[cfg(unix)]
    #[test]
    fn unique_relative_path_treats_dangling_and_valid_symlinks_as_occupied() {
        use std::os::unix::fs::symlink;

        let dir = TempDir::new("leaf-symlink");
        let outside = TempDir::new("leaf-outside");
        let outside_existing = outside.0.join("keep.txt");
        std::fs::write(&outside_existing, b"keep").unwrap();

        symlink(
            outside.0.join("nonexistent.txt"),
            dir.0.join("dangling.txt"),
        )
        .unwrap();
        symlink(&outside_existing, dir.0.join("existing.txt")).unwrap();

        assert_eq!(
            unique_relative_path(&dir.0, "dangling.txt"),
            PathBuf::from("dangling (1).txt")
        );
        assert_eq!(
            unique_relative_path(&dir.0, "existing.txt"),
            PathBuf::from("existing (1).txt")
        );
    }

    #[cfg(unix)]
    #[test]
    fn path_occupied_no_follow_stops_at_symlinked_parent_and_checks_nested_paths() {
        use std::os::unix::fs::symlink;

        let dir = TempDir::new("parent-symlink");
        let outside = TempDir::new("parent-outside");
        std::fs::write(outside.0.join("secret.txt"), b"secret").unwrap();
        symlink(&outside.0, dir.0.join("sub")).unwrap();

        // Must not follow `dir/sub` to notice `outside/secret.txt` exists.
        assert!(!path_occupied_no_follow(
            &dir.0,
            Path::new("sub/secret.txt")
        ));

        // Real nested directories ARE traversed safely.
        std::fs::create_dir_all(dir.0.join("v1.0")).unwrap();
        std::fs::write(dir.0.join("v1.0/readme"), b"1").unwrap();
        assert!(path_occupied_no_follow(&dir.0, Path::new("v1.0/readme")));
        assert!(!path_occupied_no_follow(&dir.0, Path::new("v1.0/other")));
    }
}
