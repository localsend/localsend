# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter pub run msix:create --store

Move-Item -Path build/windows/runner/Release/localsend_app.msix -Destination LocalSend-XXX-windows-x86-64-store.msix

Write-Output 'Generated Windows msix!'
