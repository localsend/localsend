<#
.SYNOPSIS
Downloads any free app and its dependencies from the Microsoft Store.

.DESCRIPTION
This script downloads any free app and its dependencies from the Microsoft Store, given a valid Store URL. The downloaded files are saved to the specified directory.

.PARAMETER StoreURL
The URL of the Microsoft Store page for the app to download.

.PARAMETER SavePathRoot
The root directory where the downloaded files should be saved. The default value is "%tmp%".

.EXAMPLE
pwsh .\msix_downloader.ps1 -StoreURL https://www.microsoft.com/store/productId/9NCB4Z0TZ6RR

Downloads the Microsoft Solitaire Collection app and its dependencies from the Microsoft Store, and saves the files to the default directory.

.NOTES
Author: beholdenkey
Date: 2023-02-16
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 0, HelpMessage = "The URL of the Microsoft Store page for the app to download.")]
    [ValidateNotNullOrEmpty()]
    [string] $StoreURL,

    [Parameter(Mandatory = $false, Position = 1, HelpMessage = "The root directory where the downloaded files should be saved. The default value is the system temporary directory.")]
    [ValidateNotNullOrEmpty()]
    [string] $SavePathRoot = [System.IO.Path]::GetTempPath()
)


# Set up error handling
$ErrorActionPreference = "Stop"
$ErrorMessage = ""

try {
    # Remove trailing slash from Store URL, if any
    if ($StoreURL.EndsWith("/")) {
        $StoreURL = $StoreURL.Remove($StoreUrl.Length - 1, 1)
    }

    # Query the API to get the download links for the app
    $wc = [System.Net.WebClient]::new()
    $URI = "https://store.rg-adguard.net/api/GetFiles"
    $myParameters = "type=url&url=$($StoreURL)"
    $wc.Headers[[System.Net.HttpRequestHeader]::ContentType] = "application/x-www-form-urlencoded"
    $HtmlResult = $wc.UploadString($URI, $myParameters)

    # Parse the HTML response to get the download links
    $start = $HtmlResult.IndexOf("<p>The links were successfully received from the Microsoft Store server.</p>")
    if ($start -eq -1) {
        throw "Could not get the links, please check the StoreURL."
    }

    $tableEnd = ($HtmlResult.LastIndexOf("</table>") + 8)
    $semiCleaned = $HtmlResult.Substring($start, $tableEnd - $start)

    $newHtml = New-Object -ComObject "HTMLFile"
    try {
        # This works in PowerShell with Office installed
        $newHtml.IHTMLDocument2_write($semiCleaned)
    }
    catch {
        # This works when Office is not installed
        $src = [System.Text.Encoding]::Unicode.GetBytes($semiCleaned)
        $newHtml.write($src)
    }

    $toDownload = $newHtml.getElementsByTagName("a") | Select-Object textContent, href

    # Create the directory to save the downloaded files
    $SavePathRoot = $([System.Environment]::ExpandEnvironmentVariables("$SavePathRoot"))
    $lastFrontSlash = $StoreURL.LastIndexOf("/")
    $productID = $StoreURL.Substring($lastFrontSlash + 1, $StoreURL.Length - $lastFrontSlash - 1)
    $path = Join-Path $SavePathRoot $productID

    if (!(Test-Path $path)) {
        New-Item -ItemType Directory $path -ErrorAction Stop | Out-Null
        Write-Verbose "Created directory $path."
    }
    
    # Download the files
    $totalSize = $toDownload | Measure-Object -Property href -Sum | Select-Object -ExpandProperty Sum
    $currentSize = 0
    
    foreach ($download in $toDownload) {
        $downloadPath = Join-Path $path $download.textContent
        $progressLabel = "Downloading $($download.textContent)..."
        $progressPercentage = [math]::Round(($currentSize / $totalSize) * 100, 0)
    
        Write-Progress -Activity "Downloading files" -Status $progressLabel -PercentComplete $progressPercentage
    
        try {
            $wc.DownloadFile($download.href, $downloadPath)
            Write-Verbose "Downloaded $($download.textContent) to $downloadPath."
        }
        catch {
            $ErrorMessage = "Failed to download $($download.textContent): $_"
            Write-Error $ErrorMessage
        }
    
        $currentSize += $wc.ResponseHeaders["Content-Length"]
    }
    
    # Open the directory where the files were saved
    Write-Verbose "Download complete. Opening directory $path."
    Start-Sleep -Seconds 3
    Start $path
}
catch {
    $ErrorMessage = "An error occurred while downloading the app: $_"
    Write-Error $ErrorMessage
}
finally {
    # Clean up
    $wc.Dispose()
}

if ($ErrorMessage -ne "") {
    throw $ErrorMessage
}
    