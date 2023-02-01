# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter build linux

rm -rf AppDir
rm -rf appimage-build

mkdir AppDir
cp -r build/linux/x64/release/bundle/* AppDir
appimage-builder
sudo chmod +x LocalSend-latest-x86_64.AppImage

rm -rf AppDir
rm -rf appimage-build
