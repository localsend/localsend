git reset --hard origin/main
git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter build macos

# if appdmg is not installed yet: npm install -g appdmg
appdmg scripts/dmg/config.json LocalSend.dmg
