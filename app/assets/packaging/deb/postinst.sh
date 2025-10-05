#!/bin/bash
set -e

echo "Installed Localsend successfully"
    
UFW_FILENAME="ufw-localsend"
UFW_PROFILE_DIR="/usr/share/localsend_app/data/flutter_assets/assets/packaging"
UFW_SYSTEM_DIR="/etc/ufw/applications.d"

# Install UFW profile
if [ -d /etc/ufw/applications.d ]; then
    # Copy to system UFW directory
    cp "$UFW_PROFILE_DIR/$UFW_FILENAME" "$UFW_SYSTEM_DIR/"
    chmod 644 "$UFW_SYSTEM_DIR/$UFW_FILENAME"
    chown root:root "$UFW_SYSTEM_DIR/$UFW_FILENAME"
    echo "Added ufw app profile LocalSend"
fi

exit 0