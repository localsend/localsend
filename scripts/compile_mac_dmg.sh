# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter build macos

# sign the app
codesign --deep --force --verbose --options runtime --sign "36F60C6744929E06BA64EB7463B7AFFCEFF49DD0" build/macos/Build/Products/Release/LocalSend.app

# create dmg
# if appdmg is not installed yet: npm install -g appdmg
appdmg scripts/dmg/config.json LocalSend.dmg

# send to apple for notarization
DEV_EMAIL=developer@example.com
APP_PASSWORD=abcd-efgh-ijkl-mnop
NOTARIZE_OUTPUT=$(xcrun altool --notarize-app --primary-bundle-id "org.localsend.localsendApp" --username $DEV_EMAIL --password $APP_PASSWORD --file LocalSend.dmg)
echo "$NOTARIZE_OUTPUT"

# extract request UUID from the output
REQUEST_UUID=$(echo "$NOTARIZE_OUTPUT" | awk -F ' = ' '/RequestUUID/ {print $2}')

# print command to check notarization status
echo ""
echo "Check notarization status with:"
echo "xcrun altool --notarization-info $REQUEST_UUID --username $DEV_EMAIL --password $APP_PASSWORD"

# print command to add staple to the app
echo ""
echo "Add staple to the app with:"
echo "xcrun stapler staple LocalSend.dmg"
