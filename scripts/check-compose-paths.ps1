param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$rootPath = (Resolve-Path -LiteralPath $Root).Path
$problems = [System.Collections.Generic.List[object]]::new()
$pathPatterns = @(
    '^\s*build:\s*(?<path>[^#]+?)\s*(?:#.*)?$',
    '^\s*context:\s*(?<path>[^#]+?)\s*(?:#.*)?$',
    '^\s*-\s*(?<path>\.?\.?[/\\][^:]+):'
)

Get-ChildItem -LiteralPath $rootPath -Recurse -File |
    Where-Object { $_.Name -in @('compose.yaml', 'compose.yml', 'docker-compose.yaml', 'docker-compose.yml') } |
    ForEach-Object {
        $composeFile = $_
        $lineNumber = 0

        foreach ($line in Get-Content -LiteralPath $composeFile.FullName -Encoding UTF8) {
            $lineNumber++
            foreach ($pattern in $pathPatterns) {
                if ($line -notmatch $pattern) {
                    continue
                }

                $relativePath = $Matches['path'].Trim().Trim('"', "'")
                if ($relativePath -notmatch '^\.?\.?[/\\]' -and $relativePath -ne '.') {
                    continue
                }

                $resolvedPath = [System.IO.Path]::GetFullPath(
                    (Join-Path $composeFile.DirectoryName $relativePath)
                )
                $insideRoot = $resolvedPath -eq $rootPath -or
                    $resolvedPath.StartsWith(
                        $rootPath + [System.IO.Path]::DirectorySeparatorChar,
                        [System.StringComparison]::OrdinalIgnoreCase
                    )

                if (-not $insideRoot -or -not (Test-Path -LiteralPath $resolvedPath)) {
                    $problems.Add([PSCustomObject]@{
                            Compose = $composeFile.FullName.Substring($rootPath.Length + 1)
                            Line    = $lineNumber
                            Path    = $relativePath
                            Problem = if ($insideRoot) { 'path not found' } else { 'path leaves repository' }
                        })
                }
            }
        }
    }

if ($problems.Count -gt 0) {
    $problems | Format-Table -AutoSize
    Write-Error "Found $($problems.Count) invalid relative Compose path(s)."
    exit 1
}

Write-Output 'All relative Compose paths are valid.'
