#!/bin/bash
set -euo pipefail

# On Gentoo with Mesa 26.1.8, Wayland startup loads the host's libEGL_mesa.so.0,
# which requires wl_fixes_interface. Ubuntu 22.04's Wayland 1.20 lacks this symbol;
# bundle a newer client that provides it (introduced in Wayland 1.24).
# TODO: Use apt instead when the repositories configured in AppImageBuilder_x86_64.yml
# provide Wayland >= 1.24, through a backport or an Ubuntu release upgrade.
appdir=$(realpath "${1:?Usage: download_wayland_client.sh AppDir}")
test -d "$appdir"
workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT
cd "$workdir"

curl -fsSL --retry 3 --max-time 120 -o wayland.conda \
  https://conda.anaconda.org/conda-forge/linux-64/wayland-1.26.0-hd6090a7_0.conda
echo '6b9e182021ef3a64ab3bf788ebdab6de6775035612237c639ccafc941639eb13  wayland.conda' | sha256sum -c -
unzip -q wayland.conda

target="$appdir/usr/lib/x86_64-linux-gnu"
mkdir -p "$target" "$appdir/usr/share/licenses/wayland-client"
tar --zstd -xf pkg-wayland-*.tar.zst -C "$target" --strip-components=1 lib/libwayland-client.so.0 lib/libwayland-client.so.0.26.0
tar --zstd -xf info-wayland-*.tar.zst -C "$appdir/usr/share/licenses/wayland-client" --strip-components=2 info/licenses/COPYING
