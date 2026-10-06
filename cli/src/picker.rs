use crate::util;
use crossterm::event::{Event, KeyCode, KeyEvent, KeyModifiers};
use ratatui::Terminal;
use ratatui::backend::CrosstermBackend;
use ratatui::layout::{Constraint, Layout};
use ratatui::style::{Color, Modifier, Style};
use ratatui::text::{Line, Span};
use ratatui::widgets::{Block, Borders, HighlightSpacing, List, ListState, Paragraph};
use ratatui_explorer::{File, FileExplorer};
use std::io::Stdout;
use std::path::PathBuf;
use unicode_width::{UnicodeWidthChar, UnicodeWidthStr};

/// How far `PageUp` / `PageDown` jump, matching `ratatui_explorer`.
const SCROLL_COUNT: usize = 12;

/// A modal, terminal-native file picker rendered on the alternate screen
/// while the log UI is suspended.
///
/// Typing filters the listing, Space toggles files on and off, Enter confirms
/// (or descends into the highlighted directory), Esc clears the filter or
/// cancels. Confirming with an empty selection picks the highlighted file.
///
/// The explorer only supplies the directory listing; navigation and rendering
/// are done here so that the filter can hide entries.
pub struct Picker {
    /// What the picked files are for; decides the title and what confirming does.
    pub target: PickerTarget,

    explorer: FileExplorer,
    terminal: Terminal<CrosstermBackend<Stdout>>,

    /// The picked files with the byte size they had when they were picked, so
    /// that the summary line does not have to stat them again — they may well
    /// live in a directory that is no longer listed.
    selected: Vec<(PathBuf, u64)>,

    /// The search query, matched as a case-insensitive subsequence against the
    /// entry names. Empty means "show everything".
    query: String,

    /// Indices into `explorer.files()` that match `query`, in listing order.
    matches: Vec<usize>,

    /// Byte sizes of `explorer.files()`, same indices. `None` for directories
    /// and for entries whose metadata could not be read.
    sizes: Vec<Option<u64>>,

    list_state: ListState,
}

/// What the picked files are for.
#[derive(Clone)]
pub enum PickerTarget {
    /// Send the files to the device with this fingerprint.
    Device { fingerprint: String, alias: String },

    /// Offer the files for download via "share via link".
    WebShare,
}

/// What a key press did to the picker.
pub enum PickerOutcome {
    /// The picker stays open.
    Open,

    /// The user confirmed the selection.
    Picked(Vec<PathBuf>),

    /// The user cancelled.
    Cancelled,
}

impl Picker {
    /// Enters the alternate screen and shows the picker.
    /// The caller must suspend the log UI first and resume it after [Picker::close].
    pub fn open(target: PickerTarget) -> anyhow::Result<Self> {
        let explorer = FileExplorer::new()?;
        util::enter_alternate_screen()?;
        Self::show(target, explorer)
    }

    /// Shows the picker on the blank alternate screen a previous modal left
    /// behind (see [crate::device_list::DeviceList::close_keeping_screen]);
    /// [Picker::close] leaves it as usual. When this fails, the caller must
    /// leave the alternate screen itself.
    pub fn open_on_alternate_screen(target: PickerTarget) -> anyhow::Result<Self> {
        let explorer = FileExplorer::new()?;
        Self::show(target, explorer)
    }

    fn show(target: PickerTarget, explorer: FileExplorer) -> anyhow::Result<Self> {
        let terminal = Terminal::new(CrosstermBackend::new(std::io::stdout()))?;
        let mut picker = Self {
            target,
            explorer,
            terminal,
            selected: Vec::new(),
            query: String::new(),
            matches: Vec::new(),
            sizes: Vec::new(),
            list_state: ListState::default(),
        };
        picker.refresh_sizes();
        picker.refresh_matches();
        picker.select_first_entry();
        picker.draw();
        Ok(picker)
    }

    /// Leaves the alternate screen. Must be called exactly once.
    pub fn close(self) {
        util::leave_alternate_screen();
    }

    pub fn handle_key(&mut self, key: KeyEvent) -> PickerOutcome {
        match key.code {
            KeyCode::Esc => {
                if self.query.is_empty() {
                    return PickerOutcome::Cancelled;
                }
                self.query.clear();
                self.refresh_matches();
            }
            KeyCode::Up => self.move_cursor(-1, true),
            KeyCode::Down => self.move_cursor(1, true),
            KeyCode::PageUp => self.move_cursor(-(SCROLL_COUNT as isize), false),
            KeyCode::PageDown => self.move_cursor(SCROLL_COUNT as isize, false),
            KeyCode::Home => self.select_match(0),
            KeyCode::End => self.select_match(self.matches.len().saturating_sub(1)),
            KeyCode::Left => self.navigate(key),
            KeyCode::Right => {
                // Never act on a hidden entry: with no matches the explorer's
                // index still points at whatever was highlighted before.
                if self.current().is_some_and(|file| file.is_dir) {
                    self.navigate(key);
                }
            }
            KeyCode::Backspace => {
                // Purely an editing key: erasing one character too many must not
                // leave the directory. Left does that, and so does the `../` entry.
                if self.query.pop().is_some() {
                    self.refresh_matches();
                }
            }
            KeyCode::Char(' ') => {
                if let Some(current) = self.current()
                    && !current.is_dir
                {
                    let path = current.path.clone();
                    match self.selected.iter().position(|(p, _)| *p == path) {
                        Some(index) => {
                            self.selected.remove(index);
                        }
                        None => {
                            let size = self.current_size().unwrap_or(0);
                            self.selected.push((path, size));
                        }
                    }
                }
            }
            KeyCode::Enter => match self
                .current()
                .map(|current| (current.is_dir, current.path.clone()))
            {
                Some((true, _)) => self.navigate(key),
                Some((false, path)) => {
                    let mut files = self.take_selected();
                    if files.is_empty() {
                        files.push(path);
                    }
                    return PickerOutcome::Picked(files);
                }
                None => {
                    let files = self.take_selected();
                    if !files.is_empty() {
                        return PickerOutcome::Picked(files);
                    }
                }
            },
            KeyCode::Char(c)
                if !key
                    .modifiers
                    .intersects(KeyModifiers::CONTROL | KeyModifiers::ALT) =>
            {
                self.query.push(c);
                self.refresh_matches();
            }
            _ => {}
        }
        self.draw();
        PickerOutcome::Open
    }

    /// The highlighted entry, or `None` while nothing matches the query.
    fn current(&self) -> Option<&File> {
        self.cursor().map(|_| self.explorer.current())
    }

    /// Size of the highlighted entry, `None` for directories and for entries
    /// whose metadata could not be read.
    fn current_size(&self) -> Option<u64> {
        self.sizes
            .get(self.explorer.selected_idx())
            .copied()
            .flatten()
    }

    fn take_selected(&mut self) -> Vec<PathBuf> {
        std::mem::take(&mut self.selected)
            .into_iter()
            .map(|(path, _)| path)
            .collect()
    }

    /// Position of the highlighted entry within [Picker::matches].
    fn cursor(&self) -> Option<usize> {
        self.matches
            .iter()
            .position(|&index| index == self.explorer.selected_idx())
    }

    /// Changes the directory via the explorer and drops the query, since it was
    /// only ever meant for the listing that is now gone.
    fn navigate(&mut self, key: KeyEvent) {
        let previous = self.explorer.cwd().clone();
        let _ = self.explorer.handle(&Event::Key(key));
        if *self.explorer.cwd() == previous {
            // Nothing to navigate into — keep the query and the highlight.
            return;
        }
        self.query.clear();
        self.refresh_sizes();
        self.refresh_matches();
        self.select_first_entry();
    }

    /// Stats the current listing. Only ever called when the directory changes:
    /// `explorer.files()` is stable otherwise, and doing this per draw would
    /// mean one syscall per entry on every key press.
    fn refresh_sizes(&mut self) {
        self.sizes = self
            .explorer
            .files()
            .iter()
            .map(|file| match file.is_dir {
                true => None,
                false => file.path.metadata().ok().map(|metadata| metadata.len()),
            })
            .collect();
    }

    /// Highlights the first real entry, skipping the `../` link the explorer
    /// lands on after every directory change — otherwise Right, pressed twice,
    /// descends and then bounces straight back up.
    fn select_first_entry(&mut self) {
        let skip_parent = self.explorer.cwd().parent().is_some() && self.matches.len() > 1;
        self.select_match(usize::from(skip_parent));
    }

    fn move_cursor(&mut self, delta: isize, wrap: bool) {
        if self.matches.is_empty() {
            return;
        }
        let len = self.matches.len() as isize;
        let cursor = self.cursor().unwrap_or_default() as isize + delta;
        let cursor = match wrap {
            true => cursor.rem_euclid(len),
            false => cursor.clamp(0, len - 1),
        };
        self.select_match(cursor as usize);
    }

    fn select_match(&mut self, cursor: usize) {
        match self.matches.get(cursor) {
            Some(&index) => {
                self.explorer.set_selected_idx(index);
                self.list_state.select(Some(cursor));
            }
            None => self.list_state.select(None),
        }
    }

    /// Recomputes the visible entries. Keeps the highlighted entry if it still
    /// matches, otherwise falls back to the first match.
    fn refresh_matches(&mut self) {
        self.matches = self
            .explorer
            .files()
            .iter()
            .enumerate()
            .filter(|(_, file)| matches_query(&self.query, &file.name))
            .map(|(index, _)| index)
            .collect();
        let cursor = self.cursor().unwrap_or_default();
        self.select_match(cursor);
    }

    pub fn draw(&mut self) {
        let Self {
            target,
            explorer,
            terminal,
            selected,
            query,
            matches,
            sizes,
            list_state,
            ..
        } = self;

        let help =
            " Type: filter  ←/→: folder  Space: select  Enter: confirm  Esc: cancel".to_string();
        let _ = terminal.draw(|frame| {
            let [main_area, selected_area, help_area] = Layout::vertical([
                Constraint::Fill(1),
                Constraint::Length(1),
                Constraint::Length(1),
            ])
            .areas(frame.area());

            let title = match target {
                PickerTarget::Device { alias, .. } => format!(" To: {alias} "),
                PickerTarget::WebShare => " Share via link ".to_string(),
            };
            let mut block = Block::default()
                .borders(Borders::ALL)
                .title_top(format!(" {} ", explorer.cwd().display()))
                .title_top(Line::from(title).right_aligned());
            if !query.is_empty() {
                let hits = match matches.is_empty() {
                    true => " no matches".to_string(),
                    false => format!(" {} of {}", matches.len(), explorer.files().len()),
                };
                block = block.title_bottom(format!(" Filter: {query} ({hits}) "));
            }

            // No highlight symbol is set, so `HighlightSpacing::Always` reserves
            // nothing and only the borders eat into the width.
            let inner_width = main_area.width.saturating_sub(2) as usize;

            let items = matches
                .iter()
                .filter_map(|&index| {
                    let file = explorer.files().get(index)?;
                    Some((file, sizes.get(index).copied().flatten()))
                })
                .map(|(file, size)| {
                    // Files stay unstyled so they inherit the terminal's default
                    // foreground, which is readable on light and dark profiles alike.
                    let mut style = match file.is_dir {
                        true => Style::default().fg(Color::Cyan),
                        false => Style::default(),
                    };
                    if selected.iter().any(|(path, _)| *path == file.path) {
                        style = style.add_modifier(Modifier::BOLD);
                    }
                    entry_line(&file.name, size, style, inner_width)
                });
            let list = List::new(items)
                .block(block)
                .highlight_spacing(HighlightSpacing::Always)
                .highlight_style(Style::default().bg(Color::DarkGray).fg(Color::White));
            frame.render_stateful_widget(list, main_area, list_state);

            let selected_line = match selected.is_empty() {
                true => " No files selected".to_string(),
                false => format!(
                    " Selected: {} file{}, {}",
                    selected.len(),
                    match selected.len() {
                        1 => "",
                        _ => "s",
                    },
                    util::format_bytes(selected.iter().map(|(_, size)| size).sum())
                ),
            };
            frame.render_widget(Paragraph::new(selected_line), selected_area);
            frame.render_widget(Paragraph::new(help), help_area);
        });
    }
}

/// One listing row: the name, and the size right-aligned within `width`
/// display columns. Directories pass `None` and render as the bare name.
fn entry_line(name: &str, size: Option<u64>, style: Style, width: usize) -> Line<'static> {
    let Some(size) = size else {
        return Line::from(Span::styled(name.to_string(), style));
    };
    let size = util::format_bytes(size);

    // The size wins when the row is too narrow for both: a name can be
    // truncated and still be recognisable, half a size reads as a wrong number.
    let (name, name_width) = truncate(name, width.saturating_sub(size.width() + 1));
    let gap = width.saturating_sub(name_width + size.width());

    Line::from(vec![
        Span::styled(name, style),
        Span::raw(" ".repeat(gap)),
        Span::styled(size, Style::default().fg(Color::DarkGray)),
    ])
}

/// Shortens `name` to at most `width` display columns, marking the cut with an
/// ellipsis. Returns the result and its width, which is not `name.len()`:
/// CJK and emoji occupy two columns per character.
fn truncate(name: &str, width: usize) -> (String, usize) {
    if name.width() <= width {
        return (name.to_string(), name.width());
    }
    if width == 0 {
        return (String::new(), 0);
    }

    // Reserve the last column for the ellipsis.
    let budget = width - 1;
    let mut truncated = String::new();
    let mut truncated_width = 0;
    for c in name.chars() {
        let char_width = c.width().unwrap_or(0);
        if truncated_width + char_width > budget {
            break;
        }
        truncated.push(c);
        truncated_width += char_width;
    }
    truncated.push('…');
    (truncated, truncated_width + 1)
}

/// Case-insensitive subsequence match, so `myrep` finds `My Report.pdf`
/// even though Space cannot be typed into the query.
fn matches_query(query: &str, name: &str) -> bool {
    let name = name.to_lowercase();
    let mut name = name.chars();
    query
        .to_lowercase()
        .chars()
        .all(|needle| name.any(|c| c == needle))
}
