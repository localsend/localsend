# LocalSend MCP

`localsend-mcp` is an experimental, headless LocalSend peer that exposes file and message transfer as [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) tools. Run it through an MCP client on each computer so agents can exchange data directly, without a cloud relay.

## What it supports

- LocalSend v2.1 discovery over LAN multicast
- direct probing by IP for routed networks and VPNs
- HTTPS with a persistent per-device certificate
- explicit, certificate-bound peer pairing
- text messages and files
- a durable inbox that agents can poll
- interoperability with LocalSend GUI peers

The initial implementation uses MCP over stdio. The LocalSend listener stays available while the MCP client is running. One instance should own the configured LocalSend port on each computer.

## Build

Install Rust 1.93.1 or newer, then build the binary:

```shell
cargo build --release --manifest-path cli/Cargo.toml
```

The binary is created at `cli/target/release/localsend-mcp` (`localsend-mcp.exe` on Windows).

## MCP client configuration

Add the binary to the MCP client on both computers. The exact settings location depends on the client; the server definition has this shape:

```json
{
  "mcpServers": {
    "localsend": {
      "command": "/absolute/path/to/localsend-mcp",
      "args": [
        "--alias",
        "Office Mac Agent",
        "--allowed-root",
        "/absolute/path/the-agent-may-send"
      ]
    }
  }
}
```

The MCP server writes protocol messages only to stdout. Runtime logs go to stderr.

## Pair two computers

1. Start the MCP client on both computers.
2. Call `get_identity` on each computer.
3. Call `discover_devices` on each side. If multicast is unavailable, call `probe_device` with the other computer's reachable IP and port.
4. Compare the full fingerprints through a separate trusted channel.
5. Call `pair_device` with the verified fingerprint on both computers.
6. Use `send_message` or `send_files`, then poll `list_inbox` on the receiver.

Pairing is directional: a peer only accepts automatic transfers from identities in its own trust store. Pair both directions for two-way communication.

## Tools

| Tool | Purpose |
|---|---|
| `get_identity` | Return the local alias, fingerprint, port, and protocol |
| `discover_devices` | Announce over LAN multicast and list known peers |
| `probe_device` | Connect directly to a reachable IP and port |
| `pair_device` | Trust a verified peer identity |
| `unpair_device` | Remove a peer from the trust store |
| `list_trusted_devices` | List paired identities |
| `send_message` | Send UTF-8 text to a paired peer |
| `send_files` | Send files from configured allowed roots |
| `list_inbox` | List durable incoming messages and files |
| `read_inbox` | Read one item and mark it as read |

## Network behavior

The sidecar defaults to TCP and UDP port `53318`, so it can run beside the LocalSend app on its default port `53317`. Allow inbound TCP and UDP traffic to the selected sidecar port.

LAN discovery sends to ports `53317` and `53318`. For computers on different networks, connect them with a routed private network or VPN, allow the sidecar port, and use `probe_device`. This version does not provide a public internet relay or NAT traversal.

## Security and storage

- HTTPS is the default and unencrypted peers are rejected unless `--allow-unencrypted` is explicitly set.
- The fingerprint declared by an HTTPS sender must match its presented client certificate.
- Pairing stores the certificate public key. A changed certificate blocks sending and automatic receiving until the peer is verified and paired again.
- `send_files` canonicalizes every path and limits it to `--allowed-root` directories. When omitted, the process working directory is the only allowed root.
- A transfer is limited to 32 files and 1 GiB by default. Change the byte limit with `--max-transfer-bytes`.
- Identity, trust, inbox metadata, and received files are persisted in the platform application data directory. Override it with `--data-dir`.

Run `localsend-mcp --help` for all configuration flags and environment-variable names.
