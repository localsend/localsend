# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

flutter clean
flutter pub get
flutter pub run build_runner build -d
flutter pub run msix:create --store

Write-Output 'Generated Windows msix!'
