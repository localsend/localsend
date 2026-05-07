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
