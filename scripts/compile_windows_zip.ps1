# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter build windows

Compress-Archive -Path build/windows/runner/Release/* -DestinationPath LocalSend-XXX-windows-x86-64.zip

Write-Output 'Generated Windows zip!'