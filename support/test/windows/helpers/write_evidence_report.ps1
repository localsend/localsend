# Build a local image and video gallery inside a test's downloadable evidence artifact.
param([Parameter(Mandatory = $true)] [string] $EvidenceDirectory)

$ErrorActionPreference = 'Stop'
if (-not (Test-Path $EvidenceDirectory)) { return }
$directory = (Resolve-Path $EvidenceDirectory).Path.TrimEnd('\', '/')
$report = $null
$captions = @{}
$metadataPath = Join-Path $directory 'evidence.json'
if (Test-Path $metadataPath) {
    $report = Get-Content $metadataPath -Raw | ConvertFrom-Json
    foreach ($item in $report.Media) { $captions[$item.Path.Replace('\', '/')] = $item }
}
$title = if ($report.Title) { $report.Title } else { 'Windows E2E visual evidence' }
$description = if ($report.Description) { $report.Description } else { 'Images and videos captured by this test.' }
$title = [System.Net.WebUtility]::HtmlEncode($title)
$description = [System.Net.WebUtility]::HtmlEncode($description)
$imageExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.webp')
$videoExtensions = @('.mp4', '.webm')
$media = @(Get-ChildItem $directory -File -Recurse |
    Where-Object { $_.Extension.ToLowerInvariant() -in ($imageExtensions + $videoExtensions) } | Sort-Object LastWriteTimeUtc, FullName)
$cards = foreach ($file in $media) {
    $relative = $file.FullName.Substring($directory.Length + 1).Replace('\', '/')
    $caption = $captions[$relative]
    $label = [System.Net.WebUtility]::HtmlEncode($(if ($caption.Title) { $caption.Title } else { $relative }))
    $details = [System.Net.WebUtility]::HtmlEncode($caption.Description)
    $url = (($relative.Split('/') | ForEach-Object { [Uri]::EscapeDataString($_) }) -join '/')
    $preview = if ($file.Extension.ToLowerInvariant() -in $videoExtensions) {
        "<video controls preload=`"none`" src=`"$url`" aria-label=`"$label`"></video>"
    } else {
        "<a href=`"$url`"><img src=`"$url`" alt=`"$label`" loading=`"lazy`"></a>"
    }
    $extra = if ($details) { "<p>$details</p>" } else { '' }
    "<li><figure><h2>$label</h2>$extra$preview<figcaption><a href=`"$url`">Open original</a></figcaption></figure></li>"
}
@"
<!doctype html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$title</title>
<style>
body { font: 16px system-ui; margin: 24px auto; padding: 0 20px; max-width: 880px; }
ol { padding-left: 24px; } li { margin-bottom: 32px; }
figure { margin: 0; } h2 { font-size: 18px; }
img, video { display: block; max-width: 100%; max-height: 480px; height: auto; }
figcaption { margin-top: 12px; overflow-wrap: anywhere; }
</style>
<h1>$title</h1>
<p>$description</p>
<main><ol aria-label="Capture timeline">$($cards -join "`n")</ol></main>
</html>
"@ | Set-Content -Encoding UTF8 (Join-Path $directory 'index.html')
