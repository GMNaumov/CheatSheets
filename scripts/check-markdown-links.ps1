param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$rootPath = (Resolve-Path -LiteralPath $Root).Path
$brokenLinks = @()
$linkPattern = '!?' + '\[[^\]]*\]' + '\((?<target>[^)]+)\)'

Get-ChildItem -LiteralPath $rootPath -Recurse -File -Filter '*.md' |
    Where-Object { $_.FullName -notlike '*\.git\*' } |
    ForEach-Object {
        $source = $_
        $content = Get-Content -LiteralPath $source.FullName -Raw -Encoding UTF8

        if ($null -eq $content) {
            $content = ''
        }

        [regex]::Matches($content, $linkPattern) | ForEach-Object {
            $target = $_.Groups['target'].Value.Trim()

            if ($target -match '^(https?://|mailto:|#)') {
                return
            }

            $pathPart = ($target -split '#', 2)[0]
            $pathPart = [Uri]::UnescapeDataString($pathPart).Trim('<', '>')

            if ([string]::IsNullOrWhiteSpace($pathPart)) {
                return
            }

            $resolvedPath = Join-Path $source.DirectoryName $pathPart
            if (-not (Test-Path -LiteralPath $resolvedPath)) {
                $relativeSource = $source.FullName.Substring($rootPath.Length + 1)
                $brokenLinks += [PSCustomObject]@{
                    Source = $relativeSource
                    Target = $target
                }
            }
        }
    }

if ($brokenLinks.Count -gt 0) {
    $brokenLinks | Format-Table -AutoSize
    Write-Error "Found $($brokenLinks.Count) broken local Markdown link(s)."
    exit 1
}

Write-Output 'All local Markdown links are valid.'
