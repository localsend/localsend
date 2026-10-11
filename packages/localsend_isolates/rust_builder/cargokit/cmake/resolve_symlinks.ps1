function Resolve-Symlinks {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Position = 0, Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Path
    )

    [string] $separator = '/'
    [string[]] $parts = $Path.Split($separator)

    [string] $realPath = ''
    foreach ($part in $parts) {
        if ($realPath -and !$realPath.EndsWith($separator)) {
            $realPath += $separator
        }
        $realPath += $part
        $item = Get-Item $realPath
        if ($item.Target) {
            $realPath = $item.Target.Replace('\', '/')
        }
    }
    $realPath
}

$path=Resolve-Symlinks -Path $args[0]
Write-Host $path
