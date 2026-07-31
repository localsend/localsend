use crate::storage::Repository;
use crossterm::style::Stylize;
use localsend::http::server::ServerHandle;
use std::net::SocketAddr;

#[rustfmt::skip]
const LOGO: [&str; 4] = [
    " ▄▀ ▀ ▀▄ ",
    "▄ ▄███▄ ▄",
    "▀ ▀███▀ ▀",
    " ▀▄ ▄ ▄▀ ",
];

pub fn render(storage: &Repository, server: &ServerHandle) -> String {
    let logo = LOGO
        .iter()
        .enumerate()
        .map(|(i, line)| {
            let right = match i {
                1 => "  LocalSend CLI",
                2 => concat!("  v", env!("CARGO_PKG_VERSION")),
                _ => "",
            };
            format!("{}{right}", line.green())
        })
        .collect::<Vec<_>>()
        .join("\n");

    let listening = match listening_lines(&server.local_addresses()) {
        lines if lines.is_empty() => " - (no network interface found)".to_string(),
        lines => lines.join("\n"),
    };

    format!(
        "{logo}\n\n{} {}\n{} {}\n{} {}\n{} {}\n{}\n{listening}\n\nReady to accept requests.\n\n",
        "Alias:".green(),
        storage.identity.alias,
        "Port:".green(),
        storage.identity.port,
        "Destination:".green(),
        storage.destination.display(),
        "Config:".green(),
        storage.dir.display(),
        "Listening on:".green(),
    )
}

/// One line per IPv4 address, but only one per IPv6 scope (global,
/// unique-local) with a `(+N more)` suffix for the rest: interfaces usually carry
/// several equivalent IPv6 addresses (e.g. temporary privacy addresses),
/// which would flood the banner.
///
/// IPv6 addresses render bracketed ("[::1]:53317"), as a URL needs them.
/// Relies on the addresses being sorted, so that each scope is contiguous.
fn listening_lines(addresses: &[SocketAddr]) -> Vec<String> {
    let mut lines: Vec<(String, usize)> = Vec::new();
    let mut current_scope: Option<bool> = None;
    for address in addresses {
        match address {
            SocketAddr::V4(_) => lines.push((format!(" - https://{address}"), 0)),
            SocketAddr::V6(v6) => {
                let scope = v6.ip().is_unique_local();
                match current_scope == Some(scope) {
                    true => lines.last_mut().unwrap().1 += 1,
                    false => {
                        current_scope = Some(scope);
                        lines.push((format!(" - https://{address}"), 0));
                    }
                }
            }
        }
    }

    lines
        .into_iter()
        .map(|(line, hidden)| match hidden {
            0 => line,
            hidden => format!("{line} (+{hidden} more)"),
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn address(s: &str) -> SocketAddr {
        SocketAddr::new(s.parse().unwrap(), 53317)
    }

    #[test]
    fn test_every_ipv4_gets_a_line() {
        let lines = listening_lines(&[address("10.0.0.1"), address("192.168.0.1")]);
        assert_eq!(
            lines,
            [" - https://10.0.0.1:53317", " - https://192.168.0.1:53317"]
        );
    }

    #[test]
    fn test_ipv6_collapses_per_scope() {
        let lines = listening_lines(&[
            address("192.168.0.1"),
            address("2a02::1"),
            address("2a02::2"),
            address("2a02::3"),
            address("fd44::1"),
            address("fd44::2"),
        ]);
        assert_eq!(
            lines,
            [
                " - https://192.168.0.1:53317",
                " - https://[2a02::1]:53317 (+2 more)",
                " - https://[fd44::1]:53317 (+1 more)",
            ]
        );
    }

    #[test]
    fn test_single_ipv6_has_no_suffix() {
        let lines = listening_lines(&[address("2a02::1")]);
        assert_eq!(lines, [" - https://[2a02::1]:53317"]);
    }
}
