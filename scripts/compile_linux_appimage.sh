# REQUIREMENTS
# (1) sudo apt install clang cmake libgtk-3-dev ninja-build
# (2) Download from https://github.com/AppImageCrafters/appimage-builder/releases
#     then sudo chmod +x appimage-builder-1.1.0-x86_64.AppImage && sudo mv appimage-builder-1.1.0-x86_64.AppImage /usr/local/bin/appimage-builder

# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

git submodule update --init

cd ..
rm -rf /tmp/build
cp localsend /tmp/build -r
pushd /tmp/build

alias flutter='submodules/flutter/bin/flutter'

flutter clean
flutter pub get
flutter pub run build_runner build -d
flutter build linux

rm -rf AppDir
rm -rf appimage-build

mkdir AppDir
cp -r build/linux/x64/release/bundle/* AppDir
appimage-builder
sudo chmod +x LocalSend-latest-x86_64.AppImage

rm -rf AppDir
rm -rf appimage-build

popd
cd localsend