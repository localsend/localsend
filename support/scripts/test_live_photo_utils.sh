#!/usr/bin/env bash
set -euo pipefail

# Native regression tests require macOS, Xcode, and ffmpeg.
repo_dir="$(cd "$(dirname "$0")/../.." && pwd)"
test_dir="$(mktemp -d "${TMPDIR:-/tmp}/localsend-live-photo.XXXXXX")"
trap 'rm -rf "$test_dir"' EXIT

ffmpeg -hide_banner -loglevel error -y \
  -f lavfi -i 'testsrc2=size=64x64:rate=10:duration=1' \
  -f lavfi -i 'sine=frequency=440:duration=1' \
  -c:v libx264 -c:a aac -movflags +faststart "$test_dir/audio.mp4"
ffmpeg -hide_banner -loglevel error -y -i "$test_dir/audio.mp4" \
  -an -c:v copy "$test_dir/silent.mp4"
ffmpeg -hide_banner -loglevel error -y -i "$test_dir/audio.mp4" \
  -an -c:v libx265 -tag:v hvc1 -x265-params log-level=error "$test_dir/hevc.mp4"
ffmpeg -hide_banner -loglevel error -y -i "$test_dir/audio.mp4" \
  -c copy -metadata:s:v:0 rotate=90 "$test_dir/rotated.mp4"

sources=(
  "$repo_dir/app/ios/Runner/Plugins/LivePhoto/LivePhotoUtils.swift"
  "$repo_dir/app/ios/Runner/Plugins/LivePhoto/LivePhotoHandler.swift"
  "$repo_dir/app/ios/Runner/Plugins/Utils/FileUtils.swift"
  "$repo_dir/app/ios/Runner/Plugins/Utils/Logger.swift"
  "$repo_dir/app/ios/Runner/Plugins/Utils/ErrorUtils.swift"
)
xcrun swiftc -swift-version 5 -typecheck -target "$(uname -m)-apple-ios13.0-simulator" \
  -sdk "$(xcrun --sdk iphonesimulator --show-sdk-path)" "${sources[@]}"
xcrun swiftc -swift-version 5 -target "$(uname -m)-apple-macos12.0" \
  "${sources[@]}" "$repo_dir/app/test/native/live_photo_utils_test.swift" -o "$test_dir/test"
"$test_dir/test" "$test_dir"
