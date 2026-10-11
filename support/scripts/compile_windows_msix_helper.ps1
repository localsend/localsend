# Using Visual Studio 2022 Developer PowerShell
# or using e.g. "C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\makeappx.exe" / makepri.exe

# The resource map name inside resources.pri must match the Identity Name in AppxManifest.xml,
# otherwise the shell cannot resolve the logos (e.g. blank icon in the Share dialog).
MakePri.exe new /pr .\support\build\msix\content /cf .\support\build\msix\priconfig.xml /mn .\support\build\msix\content\AppxManifest.xml /of .\support\build\msix\content\resources.pri /o

MakeAppx.exe pack /o /d .\support\build\msix\content /nv /p .\app\windows\localsend_msix_helper.msix
