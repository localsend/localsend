# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

cd app

fvm flutter clean
fvm flutter pub get
fvm flutter build windows

Compress-Archive -Path build/windows/runner/Release/* -DestinationPath LocalSend-XXX-windows-x86-64.zip

cd ..

Write-Output 'Generated Windows zip!'