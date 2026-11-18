# Assert the icon rendered by the Windows Share UI, using a screenshot and the
# target's UI Automation bounding rectangle. The package manifest is not read.
Add-Type -AssemblyName System.Drawing
Add-Type -ReferencedAssemblies System.Drawing -TypeDefinition @'
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace LocalSendShareIconTest {
    public sealed class MatchResult {
        public string Surface { get; set; }
        public double Score { get; set; }
        public int MatchedSize { get; set; }
        public int OffsetX { get; set; }
        public int OffsetY { get; set; }
    }

    public static class LogoMatcher {
        public static MatchResult FindBest(Bitmap crop, Bitmap reference, string surface) {
            int width = crop.Width;
            int height = crop.Height;
            bool[,] teal = new bool[width, height];
            for (int y = 0; y < height; y++) {
                for (int x = 0; x < width; x++) {
                    Color p = crop.GetPixel(x, y);
                    teal[x, y] = p.R <= 85 && p.G >= 65 && p.G <= 215 &&
                        p.B >= 65 && p.B <= 225 && Math.Abs(p.G - p.B) <= 70;
                }
            }

            MatchResult best = new MatchResult { Surface = surface };
            int[] sizes = surface == "Menu"
                ? new int[] { 16, 18, 20, 22, 24, 26 }
                : new int[] { 32, 36, 40, 44, 48, 52, 56, 60 };
            foreach (int size in sizes) {
                if (size > width || size > height) continue;
                using (Bitmap scaled = new Bitmap(size, size, PixelFormat.Format32bppArgb)) {
                    using (Graphics graphics = Graphics.FromImage(scaled)) {
                        graphics.Clear(Color.Transparent);
                        graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphics.DrawImage(reference, 0, 0, size, size);
                    }

                    bool[,] mask = new bool[size, size];
                    int expectedCount = 0;
                    for (int py = 0; py < size; py++) {
                        for (int px = 0; px < size; px++) {
                            mask[px, py] = scaled.GetPixel(px, py).A >= 96;
                            if (mask[px, py]) expectedCount++;
                        }
                    }
                    if (expectedCount == 0) continue;

                    int centerX = (int)Math.Round((width - size) / 2.0);
                    int minX = surface == "Dialog" ? Math.Max(0, centerX - 10) : 0;
                    int maxX = surface == "Dialog"
                        ? Math.Min(width - size, centerX + 10) : width - size;
                    int maxY = Math.Min(height - size, surface == "Menu" ? 10 : 20);
                    for (int oy = 0; oy <= maxY; oy++) {
                        for (int ox = minX; ox <= maxX; ox++) {
                            int hits = 0;
                            int observedCount = 0;
                            for (int py = 0; py < size; py++) {
                                for (int px = 0; px < size; px++) {
                                    if (teal[ox + px, oy + py]) {
                                        observedCount++;
                                        if (mask[px, py]) hits++;
                                    }
                                }
                            }
                            // Dice similarity penalizes missing segments and unrelated teal pixels.
                            double score = 2.0 * hits / (expectedCount + observedCount);
                            if (score > best.Score) {
                                best.Score = score;
                                best.MatchedSize = size;
                                best.OffsetX = ox;
                                best.OffsetY = oy;
                            }
                        }
                    }
                }
            }
            best.Score = Math.Round(best.Score, 3);
            return best;
        }
    }
}
'@

function Assert-LocalSendShareIcon {
    param(
        [Parameter(Mandatory = $true)] [System.Drawing.Bitmap] $Screenshot,
        [Parameter(Mandatory = $true)] $TargetBounds,
        [Parameter(Mandatory = $true)] [ValidateSet('Menu', 'Dialog')] [string] $Surface,
        [Parameter(Mandatory = $true)] [string] $CropPath,
        [ValidateRange(0.1, 1.0)] [double] $MinimumScore = 0.75
    )

    $referencePath = Join-Path $PSScriptRoot '..\..\..\build\msix\content\Images\Square44x44Logo.targetsize-48.png'
    $reference = [System.Drawing.Bitmap]::new($referencePath)
    $crop = $null
    try {
        $left = [int][Math]::Floor($TargetBounds.X)
        $top = [int][Math]::Floor($TargetBounds.Y)
        $width = [int][Math]::Ceiling($TargetBounds.Width)
        $height = [int][Math]::Ceiling($TargetBounds.Height)
        if ($width -le 0 -or $height -le 0 -or $left -lt 0 -or $top -lt 0 -or
            $left + $width -gt $Screenshot.Width -or $top + $height -gt $Screenshot.Height) {
            throw "Invalid $Surface target bounds ($left,$top,$width,$height) for $($Screenshot.Width)x$($Screenshot.Height) screenshot"
        }

        # The menu label follows a narrow icon gutter. In the share dialog the
        # icon sits above the label, near the horizontal center of the tile.
        if ($Surface -eq 'Menu') {
            $width = [Math]::Min($width, 36)
        } else {
            $height = [Math]::Min($height, 70)
        }

        $crop = $Screenshot.Clone(
            [System.Drawing.Rectangle]::new($left, $top, $width, $height),
            [System.Drawing.Imaging.PixelFormat]::Format32bppArgb
        )
        $cropDirectory = Split-Path -Parent $CropPath
        if ($cropDirectory -and -not (Test-Path $cropDirectory)) {
            New-Item -ItemType Directory -Path $cropDirectory -Force | Out-Null
        }
        $crop.Save($CropPath, [System.Drawing.Imaging.ImageFormat]::Png)

        $match = [LocalSendShareIconTest.LogoMatcher]::FindBest($crop, $reference, $Surface)
        $best = [pscustomobject]@{
            Surface = $match.Surface
            Score = $match.Score
            MatchedSize = $match.MatchedSize
            OffsetX = $match.OffsetX
            OffsetY = $match.OffsetY
            CropPath = $CropPath
        }

        if ($best.Score -lt $MinimumScore) {
            throw "LocalSend $Surface icon not rendered (score $($best.Score) < $MinimumScore); crop: $CropPath"
        }
        return $best
    } finally {
        if ($crop) { $crop.Dispose() }
        $reference.Dispose()
    }
}
