# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter precache --ios
(
	cd ios
	pod update
)
fvm flutter build ipa
