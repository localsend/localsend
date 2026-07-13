& 'C:\Program Files (x86)\Windows Kits\10\App Certification Kit\makeappx.exe' pack /o /d support\build\msix /nv /p app\windows\localsend_msix_helper.msix 

cd app

fvm flutter clean
fvm flutter pub get
fvm flutter build windows

Remove-Item "D:\inno" -Force  -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path "D:\inno"
Copy-Item -Path "build\windows\x64\runner\Release\*" -Destination "D:\inno" -Recurse
Copy-Item -Path "assets\packaging\logo.ico" -Destination "D:\inno"

cd ..

Copy-Item -Path "support\build\windows\x64\*" -Destination "D:\inno" -Recurse
Remove-Item "D:\inno-result" -Force  -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path "D:\inno-result"
iscc .\support\scripts\compile_windows_exe-inno.iss

Write-Output 'Generated Windows exe installer!'
