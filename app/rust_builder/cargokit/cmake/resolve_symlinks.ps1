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
        if ([string]::IsNullOrEmpty($part)) {
            continue
        }

        if ($realPath -and !$realPath.EndsWith($separator)) {
            $realPath += $separator
        }

        $realPath += $part.Replace('\', '/')

        # The slash is important when using Get-Item on Drive letters in pwsh.
        if (-not($realPath.Contains($separator)) -and $realPath.EndsWith(':')) {
            $realPath += '/'
        }

        try {
            $item = Get-Item -LiteralPath $realPath -ErrorAction Stop
        } catch {
            # Some Windows special folders can be traversed but fail Get-Item.
            # Keep the current path and continue resolving the remaining segments.
            continue
        }

        if ($item.LinkTarget) {
            $realPath = $item.LinkTarget.Replace('\', '/')
        } elseif ($item.Target) {
            $realPath = $item.Target.Replace('\', '/')
        }
    }
    $realPath
}

$path=Resolve-Symlinks -Path $args[0]
Write-Host $path
