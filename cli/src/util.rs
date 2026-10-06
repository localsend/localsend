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
/// `file_name` comes from the sender and is untrusted: it is collapsed to its
/// final path component and sanitized for the local filesystem, so it can
/// neither escape the target directory nor carry illegal characters.
pub fn unique_path(dir: &Path, file_name: &str) -> PathBuf {
    let name = filename::sanitize_path(file_name, filename::Rules::current());

    let candidate = dir.join(&name);
    if !candidate.exists() {
        return candidate;
    }

    let (stem, extension) = match name.rsplit_once('.') {
        Some((stem, extension)) if !stem.is_empty() => (stem, format!(".{extension}")),
        _ => (name.as_str(), String::new()),
    };
    (1..)
        .map(|i| dir.join(format!("{stem} ({i}){extension}")))
        .find(|candidate| !candidate.exists())
        .unwrap()
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
