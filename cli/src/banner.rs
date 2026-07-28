use crate::storage::Repository;
use crate::util;
use crossterm::style::Stylize;

#[rustfmt::skip]
const LOGO: [&str; 4] = [
    " ▄▀ ▀ ▀▄ ",
    "▄ ▄███▄ ▄",
    "▀ ▀███▀ ▀",
    " ▀▄ ▄ ▄▀ ",
];

pub fn render(storage: &Repository) -> String {
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

    let listening = match util::local_ipv4_addresses() {
        addresses if addresses.is_empty() => " - (no network interface found)".to_string(),
        addresses => addresses
            .iter()
            .map(|address| format!(" - https://{address}:{}", storage.identity.port))
            .collect::<Vec<_>>()
            .join("\n"),
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
