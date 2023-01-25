git reset --hard origin/main
git pull
git submodule update --remote

cd ..
cp localsend /tmp/build -r
pushd /tmp/build

alias flutter='submodules/flutter/bin/flutter'
flutter config --no-analytics
flutter config --android-sdk /opt/android-sdk
flutter pub get
flutter pub run build_runner build -d
flutter build apk

popd
cd localsend
