#!/bin/bash
set -e

echo "Installed Localsend successfully"
    
UFW_PROFILE_DIR="/usr/share/localsend_app/data/flutter_assets/assets/packaging"
UFW_SYSTEM_DIR="/etc/ufw/applications.d"

# Install UFW profile
if [ -d /etc/ufw/applications.d ]; then
    # Create directory if it doesn't exist
    mkdir -p "$UFW_PROFILE_DIR"
    
    # Copy to system UFW directory
    cp "$UFW_PROFILE_DIR/ufw-localsend" "$UFW_SYSTEM_DIR/"
    chmod 644 "$UFW_SYSTEM_DIR/ufw-localsend"
    chown root:root "$UFW_SYSTEM_DIR/ufw-localsend"
    
    # Reload UFW if active
    if command -v ufw >/dev/null 2>&1; then
        if ufw status 2>/dev/null | grep -q "Status: active"; then
            ufw app update LocalSend 2>/dev/null || true
            echo ""
            echo "      ╔════════════════════════════════════════════════════════════╗"
            echo "      ║  UFW Firewall Profile Installed                            ║"
            echo "      ╠════════════════════════════════════════════════════════════╣"
            echo "      ║  LocalSend needs network access to function properly.      ║"
            echo "      ║  To allow LocalSend through your firewall, run:            ║"
            echo "      ║                                                            ║"
            echo "      ║    sudo ufw allow LocalSend                                ║"
            echo "      ║                                                            ║"
            echo "      ║  Or with multicast discovery:                              ║"
            echo "      ║    sudo ufw allow 'LocalSend Multicast'                    ║"
            echo "      ╚════════════════════════════════════════════════════════════╝"
            echo ""
        fi
    fi
fi

exit 0