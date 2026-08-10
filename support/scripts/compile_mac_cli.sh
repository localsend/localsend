VERSION=$(sed -n 's/^version: \([0-9]*\.[0-9]*\.[0-9]*\).*/\1/p' app/pubspec.yaml)
ARM_BIN="LocalSend-CLI-$VERSION-macos-arm-64"
X64_BIN="LocalSend-CLI-$VERSION-macos-x86-64"

rustup target add aarch64-apple-darwin x86_64-apple-darwin

echo
echo "Compiling the CLI..."
echo
cargo build --release --package localsend-cli --target aarch64-apple-darwin
cargo build --release --package localsend-cli --target x86_64-apple-darwin

rm -f "$ARM_BIN" "$X64_BIN" "$ARM_BIN.zip" "$X64_BIN.zip"
cp target/aarch64-apple-darwin/release/localsend-cli "$ARM_BIN"
cp target/x86_64-apple-darwin/release/localsend-cli "$X64_BIN"

# sign the binaries
echo
echo "Signing the CLI..."
echo
SIGN_ID="Developer ID Application: Tien Do Nam (3W7H4PYMCV)"
codesign --force --verbose --options runtime --sign "$SIGN_ID" "$ARM_BIN"
codesign --force --verbose --options runtime --sign "$SIGN_ID" "$X64_BIN"

# send to apple for notarization
DEV_EMAIL=example@example.com
APP_PASSWORD=abcd-efgh-ijkl-mnop
TEAM_ID=3W7H4PYMCV

echo
echo "Sending to apple for notarization..."
echo
zip "$ARM_BIN.zip" "$ARM_BIN"
zip "$X64_BIN.zip" "$X64_BIN"
xcrun notarytool submit "$ARM_BIN.zip" --wait --apple-id $DEV_EMAIL --password "$APP_PASSWORD" --team-id "$TEAM_ID"
xcrun notarytool submit "$X64_BIN.zip" --wait --apple-id $DEV_EMAIL --password "$APP_PASSWORD" --team-id "$TEAM_ID"

# bare binaries cannot be stapled; Gatekeeper fetches the ticket online
rm -f "$ARM_BIN.zip" "$X64_BIN.zip"
