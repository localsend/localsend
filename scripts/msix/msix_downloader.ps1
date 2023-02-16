Param (
    [Parameter(Mandatory = $True)]
    [ValidatePattern('^https?://')]
    [string] $StoreURL,
    [Parameter(Mandatory = $False)]
    [ValidateScript({ Test-Path $_ -PathType Container })]
    $SavePathRoot = "$env:TEMP\$($StoreURL.Substring($StoreURL.LastIndexOf('/') + 1))"
)

try {
    $wchttp = [System.Net.WebClient]::new()
    $URI = "https://store.rg-adguard.net/api/GetFiles"
    $myParameters = "type=url&url=$($StoreURL)"

    $wchttp.Headers[[System.Net.HttpRequestHeader]::ContentType] = "application/x-www-form-urlencoded"
    $HtmlResult = $wchttp.UploadString($URI, $myParameters)

    $Start = $HtmlResult.IndexOf("<p>The links were successfully received from the Microsoft Store server.</p>")

    if ($Start -eq -1) {
        throw "Could not get the links, please check the StoreURL."
    }

    $TableEnd = ($HtmlResult.LastIndexOf("</table>") + 8)
    $SemiCleaned = $HtmlResult.Substring($start, $TableEnd - $start)

    $newHtml = New-Object -ComObject "HTMLFile"
    try {
        $newHtml.IHTMLDocument2_write($SemiCleaned)
    }
    catch {
        $src = [System.Text.Encoding]::Unicode.GetBytes($SemiCleaned)
        $newHtml.write($src)
    }

    $ToDownload = $newHtml.getElementsByTagName("a") | Select-Object textContent, href

    $SavePathRoot = $([System.Environment]::ExpandEnvironmentVariables("$SavePathRoot"))
    
    if (!(Test-Path -Path $SavePathRoot)) {
        New-Item -ItemType Directory -Path $SavePathRoot -ErrorAction Stop | Out-Null
    }

    Foreach ($Download in $ToDownload) {
        Write-Progress -Activity "Downloading $($Download.textContent)..." -Status "Working"
        $wchttp.DownloadFile($Download.href, "$SavePathRoot\$($Download.textContent)")
    }

    Write-Host "---------------------------------------"
    Write-Host ""
    Write-Host "Download is complete." 
    Write-Host "Opening Folder"

    Start-Sleep -Seconds 3
    Start "$SavePathRoot"

}
catch {
    Write-Error $_.Exception.Message
}
