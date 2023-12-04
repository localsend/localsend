# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

cd app
fvm flutter clean
fvm flutter pub get
fvm flutter build macos

# sign the app
echo
echo "Signing the app..."
echo
SIGN_ID="Developer ID Application: Tien Do Nam (3W7H4PYMCV)"
codesign --deep --force --verbose --options runtime --sign "$SIGN_ID" build/macos/Build/Products/Release/LocalSend.app

# create dmg
# brew install create-dmg
echo
echo "Creating dmg..."
echo
create-dmg \
  --volname "LocalSend" \
  --window-size 500 300 \
  --background "../scripts/dmg/background.png" \
  --icon LocalSend.app 130 110 \
  --app-drop-link 360 110 \
  LocalSend.dmg \
  build/macos/Build/Products/Release/LocalSend.app

# sign the dmg
echo
echo "Signing the dmg..."
echo
codesign --force --verbose --sign "$SIGN_ID" LocalSend.dmg

# send to apple for notarization
DEV_EMAIL=example@example.com
APP_PASSWORD=abcd-efgh-ijkl-mnop
TEAM_ID=3W7H4PYMCV

echo
echo "Sending to apple for notarization..."
echo
xcrun notarytool submit LocalSend.dmg --wait --apple-id $DEV_EMAIL --password "$APP_PASSWORD" --team-id "$TEAM_ID"

# download notarization result and apply to the dmg
echo
echo "Run stapler..."
echo
xcrun stapler staple LocalSend.dmg
cd ..