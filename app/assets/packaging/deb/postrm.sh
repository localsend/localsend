#!/bin/bash
set -e

echo "Sorry to see you go :("

# Remove UFW rules if they exist
if command -v ufw >/dev/null 2>&1; then
    ufw delete allow LocalSend 2>/dev/null || true
fi

UFW_FILENAME="ufw-localsend"
UFW_PROFILE_DIR="/usr/share/localsend_app/data/flutter_assets/assets/packaging"
UFW_SYSTEM_DIR="/etc/ufw/applications.d"

# Remove UFW profile
if [ -f "$UFW_PROFILE_DIR/ufw-localsend" ]; then
    rm -f "$UFW_PROFILE_DIR/ufw-localsend"
fi

exit 0