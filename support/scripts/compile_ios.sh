# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

cd app
fvm flutter clean
fvm flutter pub get
fvm flutter precache --ios
(
	cd ios
	pod update
)
fvm flutter build ipa
cd ..