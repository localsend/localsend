git reset --hard origin/main
git pull

alias ff='fvm flutter'
ff clean
ff pub get
ff pub run build_runner build -d
ff precache --ios
(cd ios;pod update)
ff build ipa
