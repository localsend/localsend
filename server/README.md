# LocalSend Signaling Server

A signaling server for LocalSend. Using Rust and WebSockets.

## Endpoint

This service is only a WebSocket signaling server. It does not provide TURN.

- Direct HTTP endpoint: `http://your-server:3000/v1/ws`
- TLS reverse proxy endpoint: `wss://localsend.tely/v1/ws`

## Local Run

The lock file uses Cargo lockfile v4. Install or update Rust with rustup before building:

```bash
rustup toolchain install 1.93.1
rustup component add rustfmt clippy --toolchain 1.93.1
```

```bash
cd /home/cat/localsend_remote/server
SERVER_IP=0.0.0.0 SERVER_PORT=3000 cargo run --release
```

## Systemd Service

Create `/etc/systemd/system/localsend-signaling.service`:

```ini
[Unit]
Description=LocalSend WebSocket signaling server
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=/home/cat/localsend_remote/server
Environment=SERVER_IP=127.0.0.1
Environment=SERVER_PORT=3000
ExecStart=/home/cat/.cargo/bin/cargo run --release
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

Enable and start it:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now localsend-signaling
sudo systemctl status localsend-signaling
```

## Nginx Reverse Proxy

Use Nginx to expose the signaling endpoint as `wss://localsend.tely/v1/ws`:

```nginx
server {
  listen 443 ssl http2;
  server_name localsend.tely;

  ssl_certificate /path/fullchain.pem;
  ssl_certificate_key /path/privkey.pem;

  location /v1/ws {
    proxy_pass http://127.0.0.1:3000/v1/ws;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    proxy_read_timeout 3600s;
  }
}
```

## TURN Relay

The signaling server only coordinates peers. Cross-network WebRTC file transfer may require a TURN relay when direct peer-to-peer connectivity through STUN is not enough.

Example coturn settings:

```text
listening-port=3478
min-port=49152
max-port=65535
fingerprint
lt-cred-mech
realm=localsend.telyra.top
user=localsend:CHANGE_ME_STRONG_PASSWORD
no-multicast-peers
no-cli
```

If coturn runs behind NAT, also configure `external-ip=<public-ip>/<private-ip>` so relayed candidates advertise the reachable public address.

TURN credentials authorize use of your relay. Use a strong unique password, do not commit real credentials, and rotate the password if it is exposed. For shared or public deployments, prefer short-lived or managed TURN credentials.

Open firewall ports:

```bash
sudo ufw allow 3478/tcp
sudo ufw allow 3478/udp
sudo ufw allow 49152:65535/udp
```

Client settings:

```text
ICE servers:
stun:stun.localsend.org:5349
turn:localsend.telyra.top:3478?transport=udp
turn:localsend.telyra.top:3478?transport=tcp

TURN username:
localsend

TURN password:
CHANGE_ME_STRONG_PASSWORD
```

## Verification

The TURN support implementation was verified with:

```bash
cd app
dart run build_runner build --delete-conflicting-outputs
flutter test
flutter analyze --no-fatal-warnings --no-fatal-infos lib test
```

Results:

- `build_runner`: passed
- `flutter test`: passed, 63 tests
- focused Flutter analyzer: passed with existing non-fatal warnings/infos

Rust checks:

```bash
cd core
cargo check --all-features

cd ../app/rust
cargo check
```

Results:

- `core` full-feature check: passed with warnings
- `app/rust` check: passed with warnings

Manual cross-network device testing still requires a deployed TURN server and two clients configured with the same signaling room and TURN credentials.
