# This apk script is written in a way to conform with "Reproducible Builds" by F-Droid
# The Android SDK should be installed with sdkmanager (apt install sdkmanager)
# By default, it will install everything to "/opt/android-sdk". This path is important!
# Furthermore, the Flutter version from the submodule is used.

# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

git submodule update --init

cd ..
rm -rf /tmp/build
cp localsend /tmp/build -r
pushd /tmp/build

alias flutter='submodules/flutter/bin/flutter'
flutter config --no-analytics
flutter pub get
flutter pub run build_runner build -d
flutter build apk

popd
cd localsend
