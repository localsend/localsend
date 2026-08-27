<#

Update 2020-02-18
Thanks @BruceDawson0xB for pointing out the flaw in the regex pattern. if %tmp% began with a lowercase char the script would fail.

Update 2020-02-14
Thanks @jarwidmark for letting me know that this had Office as a dependency and for testing the workaround.
	-The script now works even if you don't have Office installed.

Downloads any free app and its dependencies from the Microsoft store.

Drivers are starting to implement store apps to be fully functional.
The analogue 3.5mm headphone connector not working on some models without the app.
The driver package from the manufacturer only contains a batch file which opens the store in your web browser.
And I can't find the app in the business store...

Also heard of a similar case with the thunderbolt app.

If the manufacturers would include these in their driver packages I wouldn't have to do this.
But I can see why they don't..

There's this "small" issue with deploying .Appx and AppxBundles during an OSD.
But that script will be done and uploaded in a couple of days or so. :)


The real heroes here are the ppl behind this site:
https://store.rg-adguard.net

I'm just poking their API.

-StoreURL Examples:

-StoreURL https://www.microsoft.com/store/apps/9n6f0jv38ph1
-StoreURL https://www.microsoft.com/en-us/p/thunderbolt-control-center/9n6f0jv38ph1
#>

Param (
    [Parameter(Mandatory = $True)]
    [string] $StoreURL,
    [Parameter(Mandatory = $False)]
    $SavePathRoot = "%tmp%"
)

#

if ($StoreURL.EndsWith("/")) {
    #write-host "Ends with '/'"
    $StoreURL = $StoreURL.Remove($StoreUrl.Length - 1, 1)
}

$wchttp = [System.Net.WebClient]::new()
$URI = "https://store.rg-adguard.net/api/GetFiles"
$myParameters = "type=url&url=$($StoreURL)"
#&ring=Retail&lang=sv-SE"

$wchttp.Headers[[System.Net.HttpRequestHeader]::ContentType] = "application/x-www-form-urlencoded"
$HtmlResult = $wchttp.UploadString($URI, $myParameters)

$Start = $HtmlResult.IndexOf("<p>The links were successfully received from the Microsoft Store server.</p>")
#write-host $start

if ($Start -eq -1) {
    write-host "Could not get the links, please check the StoreURL."
    exit
}

$TableEnd = ($HtmlResult.LastIndexOf("</table>") + 8)


$SemiCleaned = $HtmlResult.Substring($start, $TableEnd - $start)

#https://stackoverflow.com/questions/46307976/unable-to-use-ihtmldocument2
$newHtml = New-Object -ComObject "HTMLFile"
try {
    # This works in PowerShell with Office installed
    $newHtml.IHTMLDocument2_write($SemiCleaned)
}
catch {
    # This works when Office is not installed    
    $src = [System.Text.Encoding]::Unicode.GetBytes($SemiCleaned)
    $newHtml.write($src)
}

$ToDownload = $newHtml.getElementsByTagName("a") | Select-Object textContent, href

$SavePathRoot = $([System.Environment]::ExpandEnvironmentVariables("$SavePathRoot"))

$LastFrontSlash = $StoreURL.LastIndexOf("/")
$ProductID = $StoreURL.Substring($LastFrontSlash + 1, $StoreURL.Length - $LastFrontSlash - 1)

# OldRegEx   Failed when the %tmp% started with a lowercase char
#if ([regex]::IsMatch("$SavePathRoot\$ProductID","([,!@?#$%^&*()\[\]]+|\\\.\.|\\\\\.|\.\.\\\|\.\\\|\.\.\/|\.\/|\/\.\.|\/\.|;|(?<![A-Z]):)|^\w+:(\w|.*:)"))

if ([regex]::IsMatch("$SavePathRoot\$ProductID", "([,!@?#$%^&*()\[\]]+|\\\.\.|\\\\\.|\.\.\\\|\.\\\|\.\.\/|\.\/|\/\.\.|\/\.|;|(?<![A-Za-z]):)|^\w+:(\w|.*:)")) {
    write-host "Invalid characters in path"$SavePathRoot\$ProductID""
    exit
}


if (!(test-path "$SavePathRoot\$ProductID")) {
    write-host "Creating Directory"$SavePathRoot\$ProductID""

    try {
        New-Item -ItemType Directory "$SavePathRoot\$ProductID" -ErrorAction Stop | Out-Null
    }
    catch {
        write-host "Failed to create directory.$([System.environment]::NewLine)$_"
        write-host "Exiting..."
        exit
    }
}

Foreach ($Download in $ToDownload) {
    Write-host "Downloading $($Download.textContent)..."
    $wchttp.DownloadFile($Download.href, "$SavePathRoot\$ProductID\$($Download.textContent)")
    
}
write-host "---------------------------------------"
write-host ""
Write-host "Download is complete..." 
write-host "Opening Folder"
(Start-Sleep -s 3)
(Start "$SavePathRoot\$ProductID\")