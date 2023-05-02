# This apk script is written in a way to conform with "Reproducible Builds" by F-Droid
# The Android SDK should be installed with sdkmanager (apt install sdkmanager)
# By default, it will install everything to "/opt/android-sdk". This path is important!
# Furthermore, the Flutter version from the submodule is used.

# Check Build ID via "readelf --wide --notes libapp.so"

# REQUIREMENTS
# (1) sudo apt install openjdk-11-jdk sdkmanager
# (2) sudo chown -R <user> /opt/android-sdk
# (3) sdkmanager "platform-tools" "platforms;android-33"
# (4) sdkmanager --licenses

# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

cd ..
rm -rf /tmp/build
cp localsend /tmp/build -r
pushd /tmp/build

git submodule update --init
alias flutter='submodules/flutter/bin/flutter'
flutter config --no-analytics
flutter pub get
flutter pub run build_runner build -d
flutter build apk

popd
cd localsend
