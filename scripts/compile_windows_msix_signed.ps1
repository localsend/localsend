# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

param(
    [Parameter(Mandatory=$true)]
    [string]$CERTIFICATE_PASSWORD
)

cd app
fvm flutter clean
fvm flutter pub get
fvm dart run msix:create --certificate-path ../secrets/windows-tienisto.pfx --certificate-password $CERTIFICATE_PASSWORD

Move-Item -Path build/windows/runner/Release/localsend_app.msix -Destination LocalSend-XXX-windows-x86-64.msix

cd ..

Write-Output 'Generated Signed Windows msix!'
