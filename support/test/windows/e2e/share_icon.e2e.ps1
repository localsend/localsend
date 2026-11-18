# Windows Share with must render the LocalSend logo in the picker and recent menu.
# Issue: https://github.com/localsend/localsend/issues/3495
# Given a signed LocalSend install and a file in Explorer, when the file is
# shared, then both rendered icons match the LocalSend logo.
param(
    [string] $InstallerPath,
    [string] $EvidenceDirectory = (Join-Path $PWD 'windows-e2e-evidence/share_icon')
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$EvidenceDirectory = [System.IO.Path]::GetFullPath($EvidenceDirectory)
New-Item -ItemType Directory -Force -Path $EvidenceDirectory | Out-Null

function Invoke-ShareIconLifecycle {
    $repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..\..')).Path
    $runnerTemp = if ($env:RUNNER_TEMP) { $env:RUNNER_TEMP } else { $env:TEMP }
    $work = Join-Path $runnerTemp ("localsend-share-icon-" + [Guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Force -Path $work | Out-Null
    $pri = Join-Path $repoRoot 'support/build/msix/content/resources.pri'
    $hadPri = Test-Path $pri
    $priBackup = Join-Path $work 'original-resources.pri'
    if ($hadPri) { Copy-Item $pri $priBackup }
    $summary = [ordered]@{
        Test = 'share_icon'
        Issue = 'https://github.com/localsend/localsend/issues/3495'
        Passed = $false
        Phases = @()
        Error = $null
    }
    try {
        Set-Location $repoRoot
        Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture |
            ConvertTo-Json | Set-Content (Join-Path $EvidenceDirectory 'environment.json')

        # Prepare the hosted interactive desktop before touching Explorer.
        Add-Type -AssemblyName System.Windows.Forms, UIAutomationClient, UIAutomationTypes
        Add-Type @'
using System;
using System.Runtime.InteropServices;
public static class ShareIconDesktopInput {
    [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);
    [DllImport("user32.dll")] public static extern void mouse_event(uint flags, uint x, uint y, uint data, UIntPtr extra);
}
'@
        $root = [System.Windows.Automation.AutomationElement]::RootElement
        $oobeCondition = [System.Windows.Automation.PropertyCondition]::new(
            [System.Windows.Automation.AutomationElement]::ClassNameProperty, 'Shell_OOBEProxy')
        for ($i = 0; $i -lt 4; $i++) {
            if (-not $root.FindFirst([System.Windows.Automation.TreeScope]::Children, $oobeCondition)) { break }
            $screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
            if ($screen.Width -ne 1024 -or $screen.Height -ne 768) { throw 'Unexpected first-login wizard desktop size' }
            [ShareIconDesktopInput]::SetCursorPos(867, 657) | Out-Null
            [ShareIconDesktopInput]::mouse_event(2, 0, 0, 0, [UIntPtr]::Zero)
            [ShareIconDesktopInput]::mouse_event(4, 0, 0, 0, [UIntPtr]::Zero)
            Start-Sleep -Seconds 3
        }
        if ($root.FindFirst([System.Windows.Automation.TreeScope]::Children, $oobeCondition)) {
            throw 'First-login wizard still covers the desktop'
        }
        $wslSetup = Join-Path $work 'wsl.arm64.msi'
        Invoke-WebRequest 'https://github.com/microsoft/WSL/releases/download/3.0.1/wsl.3.0.1.0.arm64.msi' -OutFile $wslSetup
        if ((Get-FileHash $wslSetup).Hash -ne '857DDBB335EC7D05FFA71D0FD2203750C0E8FC29BB164F8A95DB92BD7BBA4263') {
            throw 'Unexpected WSL installer hash'
        }
        $wslInstall = Start-Process msiexec.exe -ArgumentList @('/i', $wslSetup, '/qn', '/norestart') -Wait -PassThru
        if ($wslInstall.ExitCode -ne 0 -and $wslInstall.ExitCode -ne 3010) { throw 'Runner WSL setup failed' }
        Get-Process wsl -ErrorAction SilentlyContinue | Stop-Process -Force
        (New-Object -ComObject Shell.Application).MinimizeAll()

        # UIA3 gives the Windows Share picker a native COM automation client.
        $tlbimp = Get-ChildItem "${env:ProgramFiles(x86)}\Microsoft SDKs\Windows" -Filter TlbImp.exe -Recurse | Select-Object -First 1
        if (-not $tlbimp) { throw 'Windows SDK type-library importer missing' }
        $env:UIA3_INTEROP_PATH = Join-Path $work 'LocalSend.UIA3.dll'
        & $tlbimp.FullName "$env:WINDIR\System32\UIAutomationCore.dll" /namespace:LocalSend.UIA3 "/out:$env:UIA3_INTEROP_PATH" /silent
        if ($LASTEXITCODE -ne 0) { throw 'UI Automation interop import failed' }

        $compilerSetup = Join-Path $work 'innosetup.exe'
        Invoke-WebRequest 'https://github.com/jrsoftware/issrc/releases/download/is-7_1_0/innosetup-7.1.0-x64.exe' -OutFile $compilerSetup
        if ((Get-FileHash $compilerSetup).Hash -ne '0362A383ED217D4C4239B5933866DD96D3EB2102737DA92F80F6057A4B40DF2F') {
            throw 'Unexpected Inno Setup hash'
        }
        $compilerDir = Join-Path $work 'InnoShareIcon'
        $process = Start-Process $compilerSetup -ArgumentList @('/VERYSILENT', '/SUPPRESSMSGBOXES', '/NORESTART', "/DIR=`"$compilerDir`"") -Wait -PassThru
        if ($process.ExitCode -ne 0) { throw 'Inno Setup installation failed' }
        $release = Join-Path $work 'localsend-release.exe'
        Invoke-WebRequest 'https://github.com/localsend/localsend/releases/download/v1.18.2/LocalSend-1.18.2-windows-x86-64.exe' -OutFile $release
        if ((Get-FileHash $release).Hash -ne '122783E6ABB4B0A1F1603D896F46A03AEDA3004479EBD3175CAB4DDAC6B60919') {
            throw 'Unexpected LocalSend release hash'
        }
        $payload = Join-Path $work 'payload'
        $process = Start-Process $release -ArgumentList @('/VERYSILENT', '/SUPPRESSMSGBOXES', '/NORESTART', '/CURRENTUSER', "/DIR=`"$payload`"") -Wait -PassThru
        if ($process.ExitCode -ne 0) { throw 'Payload installation failed' }
        $packageDeadline = [DateTime]::UtcNow.AddSeconds(30)
        do {
            if (Get-AppxPackage LocalSend.App) { break }
            Start-Sleep -Milliseconds 500
        } while ([DateTime]::UtcNow -lt $packageDeadline)
        if (-not (Get-AppxPackage LocalSend.App)) { throw 'Release helper package was not registered' }
        Get-AppxPackage LocalSend.App | Remove-AppxPackage
        Copy-Item (Join-Path $repoRoot 'app/assets/packaging/logo.ico') $payload
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $unpack = Join-Path $work 'unpacked-helper'
        [System.IO.Compression.ZipFile]::ExtractToDirectory((Join-Path $payload 'localsend_msix_helper.msix'), $unpack)
        Copy-Item (Join-Path $unpack 'resources.pri') $pri
        Get-ChildItem $payload -File | Get-FileHash | Select-Object Path, Hash | ConvertTo-Json |
            Set-Content (Join-Path $EvidenceDirectory 'payload-hashes.json')

        $candidate = Join-Path $work 'candidate'
        New-Item -ItemType Directory -Force $candidate | Out-Null
        $innoSource = Join-Path $repoRoot 'support/scripts/compile_windows_exe-inno.iss'
        & "$compilerDir\ISCC.exe" /DSkipSignTool "/DPayloadDir=$payload" "/DResultDir=$candidate" $innoSource
        if ($LASTEXITCODE -ne 0) { throw 'Candidate installer build failed' }

        Write-Host 'GWT: test the candidate installer in Explorer.'
        $phaseEvidence = Join-Path $EvidenceDirectory 'fixed'
        & powershell.exe -NoProfile -MTA -ExecutionPolicy Bypass -File $PSCommandPath -InstallerPath (Join-Path $candidate 'localsend.exe') -EvidenceDirectory $phaseEvidence
        $phaseExit = $LASTEXITCODE
        $resultPath = Join-Path $phaseEvidence 'result.json'
        if (-not (Test-Path $resultPath)) { throw 'The GUI scenario did not write result.json' }
        $phaseResult = Get-Content $resultPath -Raw | ConvertFrom-Json
        $summary.Phases += [ordered]@{ Name = 'fixed'; ExitCode = $phaseExit; Result = $phaseResult }
        if ($phaseExit -ne 0 -or -not $phaseResult.Passed -or $phaseResult.Error -or $phaseResult.Assertions.Count -ne 2) {
            throw 'The candidate installer did not render both LocalSend icons'
        }
        $surfaces = @($phaseResult.Assertions | ForEach-Object { $_.Surface } | Sort-Object)
        if (($surfaces -join ',') -ne 'Dialog,Menu' -or @($phaseResult.Assertions | Where-Object { -not $_.Passed }).Count -ne 0) {
            throw 'The GUI scenario did not pass both rendered-icon assertions'
        }
        $summary.Passed = $true
    } catch {
        $summary.Error = $_.Exception.Message
        Write-Error $summary.Error -ErrorAction Continue
    } finally {
        try {
            Stop-Process -Name localsend_app -Force -ErrorAction SilentlyContinue
            Get-AppxPackage LocalSend.App | Remove-AppxPackage -ErrorAction SilentlyContinue
            Remove-Item (Join-Path $env:LOCALAPPDATA 'LocalSendShareIconE2E') -Recurse -Force -ErrorAction SilentlyContinue
            Remove-Item (Join-Path $env:TEMP 'ShareIconFixture') -Recurse -Force -ErrorAction SilentlyContinue
            if ($hadPri) { Copy-Item $priBackup $pri -Force } else { Remove-Item $pri -Force -ErrorAction SilentlyContinue }
            Remove-Item $work -Recurse -Force -ErrorAction SilentlyContinue
        } catch { Write-Warning "Cleanup failed: $($_.Exception.Message)" }
        $summary | ConvertTo-Json -Depth 8 | Set-Content -Encoding UTF8 (Join-Path $EvidenceDirectory 'summary.json')
        $mediaCaptions = foreach ($image in (Get-ChildItem $EvidenceDirectory -Filter '*.png' -Recurse -File)) {
            $surface, $details = switch -Regex ($image.Name) {
                '^dialog\.png$' { 'Share picker'; 'LocalSend appears in the Windows Share picker.' }
                '^dialog-icon\.png$' { 'Picker icon'; 'Close-up of the LocalSend icon checked by the pixel assertion.' }
                '^menu\.png$' { 'Share with menu'; 'LocalSend appears in the Explorer Share with menu.' }
                '^menu-icon\.png$' { 'Menu icon'; 'Close-up of the LocalSend menu icon checked by the pixel assertion.' }
                '^context-attempt-' { 'Select file'; 'The selected file and context menu before sharing.' }
                default { 'Failure'; 'Desktop state when the test could not finish.' }
            }
            [ordered]@{
                Path = "$($image.Directory.Name)/$($image.Name)"
                Title = $surface
                Description = $details
            }
        }
        [ordered]@{
            Title = 'LocalSend Windows share icons'
            Description = 'Explorer Share picker and menu captures for issue #3495.'
            Media = @($mediaCaptions)
        } | ConvertTo-Json -Depth 4 | Set-Content -Encoding UTF8 (Join-Path $EvidenceDirectory 'evidence.json')
    }
    if (-not $summary.Passed) { exit 1 }
}

if (-not $InstallerPath) { Invoke-ShareIconLifecycle; exit 0 }

Add-Type -AssemblyName System.Windows.Forms, System.Drawing, UIAutomationClient, UIAutomationTypes
. (Join-Path $PSScriptRoot '..\helpers\share_icon_assertions.ps1')

Add-Type @'
using System;
using System.Runtime.InteropServices;
public static class LocalSendShareInput {
    [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);
    [DllImport("user32.dll")] public static extern void mouse_event(uint flags, uint x, uint y, uint data, UIntPtr extra);
    [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hwnd);
    [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hwnd, int command);
}
'@

$result = [ordered]@{
    Given = 'LocalSend installed and registered as a Windows share target; a real text file is selected in File Explorer'
    When = 'Open Share with, inspect More options, select LocalSend once, then reopen Share with'
    Then = 'The LocalSend logo is rendered in the picker and the recent-target submenu'
    Passed = $false
    Assertions = @()
    Error = $null
}

function Find-VisibleElement {
    param(
        [Parameter(Mandatory = $true)] [System.Windows.Automation.AutomationElement] $Root,
        [Parameter(Mandatory = $true)] [string[]] $Names,
        [Parameter(Mandatory = $true)] [System.Windows.Automation.ControlType[]] $Types,
        [string] $ClassName
    )
    $searchRoots = @($Root)
    if ($Root.Current.ClassName -eq '#32769') {
        # Menus and the Share picker are separate top-level UIA windows. Search
        # each window rather than asking the desktop provider for all descendants.
        $searchRoots = @()
        $topLevels = $Root.FindAll([System.Windows.Automation.TreeScope]::Children, [System.Windows.Automation.Condition]::TrueCondition)
        foreach ($topLevel in $topLevels) {
            try {
                $current = $topLevel.Current
                if ($current.BoundingRectangle.Width -gt 0 -and $current.BoundingRectangle.Height -gt 0 -and
                    $current.ClassName -ne 'Progman' -and $current.ClassName -ne 'Shell_TrayWnd') {
                    $searchRoots += $topLevel
                }
            } catch { }
        }
    }
    foreach ($name in $Names) {
        foreach ($type in $Types) {
            $conditions = @(
                [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::NameProperty, $name),
                [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::ControlTypeProperty, $type)
            )
            if ($ClassName) {
                $conditions += [System.Windows.Automation.PropertyCondition]::new([System.Windows.Automation.AutomationElement]::ClassNameProperty, $ClassName)
            }
            $condition = [System.Windows.Automation.AndCondition]::new([System.Windows.Automation.Condition[]] $conditions)
            foreach ($searchRoot in $searchRoots) {
                try {
                    $element = $searchRoot.FindFirst([System.Windows.Automation.TreeScope]::Subtree, $condition)
                    if ($element) {
                        $bounds = $element.Current.BoundingRectangle
                        if ($bounds.Width -gt 0 -and $bounds.Height -gt 0) { return $element }
                    }
                } catch [System.TimeoutException], [System.Runtime.InteropServices.COMException] { }
            }
        }
    }
    return $null
}

function Wait-VisibleElement {
    param(
        [System.Windows.Automation.AutomationElement] $Root,
        [string[]] $Names,
        [System.Windows.Automation.ControlType[]] $Types,
        [string] $ClassName,
        [int] $TimeoutSeconds = 20
    )
    $deadline = [DateTime]::UtcNow.AddSeconds($TimeoutSeconds)
    do {
        try {
            # Shell UIA providers can time out while a XAML menu is opening.
            # Retry within the deadline and refresh the desktop root.
            $searchRoot = if ($Root -eq [System.Windows.Automation.AutomationElement]::RootElement) {
                [System.Windows.Automation.AutomationElement]::RootElement
            } else { $Root }
            $element = Find-VisibleElement -Root $searchRoot -Names $Names -Types $Types -ClassName $ClassName
        } catch [System.TimeoutException], [System.Runtime.InteropServices.COMException] {
            $element = $null
        }
        if ($element) { return $element }
        Start-Sleep -Milliseconds 250
    } while ([DateTime]::UtcNow -lt $deadline)
    throw "Visible UI element not found: $($Names -join ' / ') [$($Types.ProgrammaticName -join ', ')]"
}

function Click-Element {
    param($Element)
    $bounds = $Element.Current.BoundingRectangle
    $x = [int][Math]::Round($bounds.X + $bounds.Width / 2)
    $y = [int][Math]::Round($bounds.Y + $bounds.Height / 2)
    if (-not [LocalSendShareInput]::SetCursorPos($x, $y)) { throw "Cannot move pointer to $x,$y" }
    [LocalSendShareInput]::mouse_event(2, 0, 0, 0, [UIntPtr]::Zero)
    [LocalSendShareInput]::mouse_event(4, 0, 0, 0, [UIntPtr]::Zero)
    Start-Sleep -Milliseconds 500
}

function Save-Screenshot {
    param([string] $Path)
    $screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
    $bitmap = [System.Drawing.Bitmap]::new($screen.Width, $screen.Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    try {
        $graphics.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
        $bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    } finally { $graphics.Dispose() }
    return $bitmap
}

function Get-CaptureBounds {
    param($Element)
    $screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
    $bounds = $Element.Current.BoundingRectangle
    return [System.Windows.Rect]::new($bounds.X - $screen.X, $bounds.Y - $screen.Y, $bounds.Width, $bounds.Height)
}

function Save-RelevantUiTree {
    param([string] $Name, [System.Windows.Automation.AutomationElement] $Root)
    Save-ShallowUiTree (Join-Path $EvidenceDirectory "$Name-uia.txt")
}

function Save-ShallowUiTree {
    param([string] $Path)
    # A shallow desktop snapshot remains useful when a deep UIA query hangs.
    # Limit traversal to top-level shell windows and their immediate children.
    $lines = New-Object 'System.Collections.Generic.List[string]'
    $root = [System.Windows.Automation.AutomationElement]::RootElement
    $topLevels = $root.FindAll([System.Windows.Automation.TreeScope]::Children, [System.Windows.Automation.Condition]::TrueCondition)
    foreach ($topLevel in $topLevels) {
        try {
            $current = $topLevel.Current
            if ($current.BoundingRectangle.Width -le 0) { continue }
            $lines.Add(('{0} | {1} | {2} | {3}' -f $current.Name, $current.ControlType.ProgrammaticName, $current.ClassName, $current.BoundingRectangle))
            if ($current.Name -notlike '*ShareIconFixture*' -and $current.ControlType -ne [System.Windows.Automation.ControlType]::Menu -and
                $current.ClassName -notlike '*Popup*' -and $current.ClassName -ne '#32768') { continue }
            $children = $topLevel.FindAll([System.Windows.Automation.TreeScope]::Children, [System.Windows.Automation.Condition]::TrueCondition)
            foreach ($child in $children) {
                $c = $child.Current
                $lines.Add(('  {0} | {1} | {2} | {3}' -f $c.Name, $c.ControlType.ProgrammaticName, $c.ClassName, $c.BoundingRectangle))
            }
        } catch { $lines.Add("UIA snapshot error: $($_.Exception.Message)") }
    }
    $lines | Set-Content $Path
}

function Save-FailureEvidence {
    $path = Join-Path $EvidenceDirectory 'failure.png'
    $bitmap = Save-Screenshot $path
    $bitmap.Dispose()
    try { Save-ShallowUiTree (Join-Path $EvidenceDirectory 'failure-uia.txt') }
    catch { Write-Warning "Shallow UIA snapshot failed: $($_.Exception.Message)" }
}

function Find-SharePickerTarget {
    if (-not $env:UIA3_INTEROP_PATH -or -not (Test-Path $env:UIA3_INTEROP_PATH)) {
        throw 'UIA3_INTEROP_PATH must point to the generated UIAutomationCore interop assembly'
    }
    if (-not ('LocalSendSharePickerLocator' -as [type])) {
        [Reflection.Assembly]::LoadFrom($env:UIA3_INTEROP_PATH) | Out-Null
        Add-Type -ReferencedAssemblies $env:UIA3_INTEROP_PATH -TypeDefinition @'
using LocalSend.UIA3;

public sealed class LocalSendSharePickerResult {
    public string Name, ClassName;
    public int ControlType, Left, Top, Right, Bottom;
}

public static class LocalSendSharePickerLocator {
    public static LocalSendSharePickerResult Find() {
        var instance = new CUIAutomation8Class();
        var newer = (IUIAutomation2)instance;
        newer.ConnectionTimeout = 5000;
        newer.TransactionTimeout = 5000;
        var uia = (IUIAutomation)instance;
        var frame = uia.GetRootElement().FindFirst((TreeScope)2,
            uia.CreatePropertyCondition(30012, "ApplicationFrameWindow"));
        if (frame == null) return null;
        var target = frame.FindFirst((TreeScope)4, uia.CreateAndCondition(
            uia.CreatePropertyCondition(30005, "LocalSend"),
            uia.CreatePropertyCondition(30003, 50007)));
        if (target == null) return null;
        var r = target.CurrentBoundingRectangle;
        return new LocalSendSharePickerResult {
            Name = target.CurrentName, ClassName = target.CurrentClassName,
            ControlType = target.CurrentControlType,
            Left = r.left, Top = r.top, Right = r.right, Bottom = r.bottom
        };
    }
}
'@
    }
    $target = [LocalSendSharePickerLocator]::Find()
    if (-not $target) { return $null }
    $bounds = [System.Windows.Rect]::new($target.Left, $target.Top, $target.Right - $target.Left, $target.Bottom - $target.Top)
    if ($bounds.Width -le 0 -or $bounds.Height -le 0) { return $null }
    ('Name={0}; ControlType={1}; ClassName={2}; Bounds={3}' -f $target.Name,
        $target.ControlType, $target.ClassName, $bounds) |
        Set-Content (Join-Path $EvidenceDirectory 'picker-target-uia3.txt')
    return [pscustomobject]@{ Current = [pscustomobject]@{ BoundingRectangle = $bounds } }
}

function Wait-SharePickerTarget {
    $deadline = [DateTime]::UtcNow.AddSeconds(20)
    do {
        try {
            $target = Find-SharePickerTarget
            if ($target) { return $target }
        } catch [System.TimeoutException], [System.Runtime.InteropServices.COMException] { }
        Start-Sleep -Milliseconds 250
    } while ([DateTime]::UtcNow -lt $deadline)
    throw 'LocalSend share picker tile not found in ApplicationFrameWindow'
}

function Assert-Surface {
    param([string] $Surface, $Element)
    $base = $Surface.ToLowerInvariant()
    $screenshotPath = Join-Path $EvidenceDirectory "$base.png"
    $cropPath = Join-Path $EvidenceDirectory "$base-icon.png"
    $deadline = [DateTime]::UtcNow.AddSeconds(4)
    do {
        $bitmap = Save-Screenshot $screenshotPath
        try {
            $score = Assert-LocalSendShareIcon -Screenshot $bitmap -TargetBounds (Get-CaptureBounds $Element) -Surface $Surface -CropPath $cropPath
            return [pscustomobject]@{ Surface = $Surface; Passed = $true; Score = $score.Score; Error = $null; Screenshot = $screenshotPath; CropPath = $cropPath }
        } catch {
            $message = $_.Exception.Message
            if ($message -notmatch 'icon not rendered \(score ([0-9.]+) <') { throw }
            $lastScore = [double]::Parse($Matches[1], [Globalization.CultureInfo]::InvariantCulture)
        } finally { $bitmap.Dispose() }
        Start-Sleep -Milliseconds 400
    } while ([DateTime]::UtcNow -lt $deadline)
    return [pscustomobject]@{ Surface = $Surface; Passed = $false; Score = $lastScore; Error = 'icon not rendered'; Screenshot = $screenshotPath; CropPath = $cropPath }
}

function Open-ExplorerShareMenu {
    param([string] $FolderPath)
    $desktop = [System.Windows.Automation.AutomationElement]::RootElement
    $window = Wait-VisibleElement -Root $desktop -Names @('ShareIconFixture - File Explorer') -Types @([System.Windows.Automation.ControlType]::Window)
    $handle = [IntPtr] $window.Current.NativeWindowHandle
    $file = Wait-VisibleElement -Root $window -Names @('share-me', 'share-me.txt') -Types @(
        [System.Windows.Automation.ControlType]::ListItem,
        [System.Windows.Automation.ControlType]::DataItem
    )
    for ($attempt = 1; $attempt -le 3; $attempt++) {
        # Verify foreground before sending keyboard input to Explorer.
        [LocalSendShareInput]::ShowWindow($handle, 9) | Out-Null
        if (-not [LocalSendShareInput]::SetForegroundWindow($handle)) { throw 'Could not foreground File Explorer' }
        Click-Element $file
        Start-Sleep -Milliseconds 500
        [LocalSendShareInput]::SetForegroundWindow($handle) | Out-Null
        if ([LocalSendShareInput]::GetForegroundWindow() -ne $handle) {
            Write-Host "Explorer lost foreground before context menu (attempt $attempt)."
            continue
        }
        [System.Windows.Forms.SendKeys]::SendWait('+{F10}')
        Start-Sleep -Seconds 1
        $contextBitmap = Save-Screenshot (Join-Path $EvidenceDirectory "context-attempt-$attempt.png")
        $contextBitmap.Dispose()
        try {
            $share = Wait-VisibleElement -Root $desktop -Names @('Share with', 'Share') -Types @([System.Windows.Automation.ControlType]::MenuItem) -TimeoutSeconds 5
            Click-Element $share
            return $desktop
        } catch {
            if ($_.Exception.Message -notlike 'Visible UI element not found:*') { throw }
            Write-Host "Explorer context menu was interrupted (attempt $attempt): $($_.Exception.Message)"
            [System.Windows.Forms.SendKeys]::SendWait('{ESC}')
        }
    }
    throw 'Explorer Share with context menu did not open after three foreground retries'
}

try {
    Write-Host 'GIVEN: install LocalSend with its signed helper and register its real Windows share target.'
    $installer = (Resolve-Path $InstallerPath).Path
    $installDir = Join-Path $env:LOCALAPPDATA 'LocalSendShareIconE2E'
    Stop-Process -Name localsend_app -Force -ErrorAction SilentlyContinue
    Get-AppxPackage -Name LocalSend.App | Remove-AppxPackage -ErrorAction Stop
    if (Test-Path $installDir) { Remove-Item $installDir -Recurse -Force }
    $installLog = Join-Path $EvidenceDirectory 'install.log'
    $arguments = @('/VERYSILENT', '/SUPPRESSMSGBOXES', '/NORESTART', '/CURRENTUSER', "/DIR=`"$installDir`"", "/LOG=`"$installLog`"")
    $process = Start-Process -FilePath $installer -ArgumentList $arguments -PassThru -Wait
    if ($process.ExitCode -ne 0) { throw "Installer failed with exit code $($process.ExitCode)" }
    if (-not (Test-Path (Join-Path $installDir 'localsend_app.exe'))) { throw 'Installed LocalSend executable missing' }
    $deadline = [DateTime]::UtcNow.AddSeconds(30)
    do {
        $package = Get-AppxPackage -Name LocalSend.App
        if ($package) { break }
        Start-Sleep -Milliseconds 500
    } while ([DateTime]::UtcNow -lt $deadline)
    if (-not $package) { throw 'Installer did not register the LocalSend share-target package' }

    # Force Explorer to reload shell extension/icon state after installation.
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Start-Process explorer.exe
    Start-Sleep -Seconds 3
    $fixtureDir = Join-Path $env:TEMP 'ShareIconFixture'
    New-Item -ItemType Directory -Force -Path $fixtureDir | Out-Null
    Set-Content -Path (Join-Path $fixtureDir 'share-me.txt') -Value 'LocalSend share icon regression fixture'
    Start-Process explorer.exe -ArgumentList $fixtureDir
    Write-Host 'WHEN: select the fixture in Explorer and open Share with > More options.'
    $desktop = Open-ExplorerShareMenu $fixtureDir
    $more = Wait-VisibleElement -Root $desktop -Names @('More options') -Types @([System.Windows.Automation.ControlType]::MenuItem)
    Click-Element $more
    $pickerTarget = Wait-SharePickerTarget
    Save-RelevantUiTree 'dialog' $desktop
    Write-Host 'THEN: inspect the rendered LocalSend picker icon.'
    $result.Assertions += (Assert-Surface Dialog $pickerTarget)

    # Selecting the target once puts it in Explorer's recent Share with submenu.
    Click-Element $pickerTarget
    $appDeadline = [DateTime]::UtcNow.AddSeconds(15)
    do {
        $app = Get-Process -Name localsend_app -ErrorAction SilentlyContinue
        if ($app) { break }
        Start-Sleep -Milliseconds 250
    } while ([DateTime]::UtcNow -lt $appDeadline)
    Stop-Process -Name localsend_app -Force -ErrorAction SilentlyContinue
    [System.Windows.Forms.SendKeys]::SendWait('{ESC}{ESC}')
    $desktop = Open-ExplorerShareMenu $fixtureDir
    $recentTarget = Wait-VisibleElement -Root $desktop -Names @('LocalSend') -Types @([System.Windows.Automation.ControlType]::MenuItem)
    Save-RelevantUiTree 'menu' $desktop
    Write-Host 'THEN: inspect the rendered LocalSend recent-target menu icon.'
    $result.Assertions += (Assert-Surface Menu $recentTarget)
    [System.Windows.Forms.SendKeys]::SendWait('{ESC}{ESC}')
    $result.Passed = @($result.Assertions | Where-Object { -not $_.Passed }).Count -eq 0
} catch {
    $result.Error = $_.Exception.Message
    try { Save-FailureEvidence } catch { Write-Warning "Failure evidence capture also failed: $($_.Exception.Message)" }
    Write-Error $result.Error -ErrorAction Continue
} finally {
    $result | ConvertTo-Json -Depth 6 | Set-Content -Encoding UTF8 (Join-Path $EvidenceDirectory 'result.json')
}

if (-not $result.Passed) { exit 1 }
