# Cross-Reference Checker - Phase 2B (v2)
$WIKI_ROOT = "D:\OneDrive - NOVA KORAT COMPANY LIMITED\Antigarvity\Ai_WiKi"

function Normalize-Name($name) {
    $target = $name.Split("|")[0].Split("#")[0].Trim()
    return $target.ToLower().Replace("-", " ").Replace("_", " ")
}

function Remove-CodeBlocks($content) {
    $withoutBlocks = [regex]::Replace($content, '(?s)```.*?```', "")
    return [regex]::Replace($withoutBlocks, '`[^`]*`', "")
}

function Get-AllWikiLinks {
    $links = @{}
    Get-ChildItem "$WIKI_ROOT\wiki" -Recurse -Filter "*.md" | Where-Object { $_.Name -notmatch "^\.template" } | ForEach-Object {
        $content = Remove-CodeBlocks (Get-Content $_.FullName -Raw)
        $matches = [regex]::Matches($content, '\[\[([^\]]+)\]\]')
        foreach ($match in $matches) {
            $linkName = $match.Groups[1].Value
            if (-not $links.ContainsKey($linkName)) {
                $links[$linkName] = @()
            }
            $links[$linkName] += $_.FullName
        }
    }
    return $links
}

function Get-AllPageNames {
    $pages = @{}
    Get-ChildItem "$WIKI_ROOT\wiki" -Recurse -Filter "*.md" | Where-Object { $_.Name -notmatch "^\.template" } | ForEach-Object {
        $name = $_.BaseName
        $normalized = Normalize-Name($name)
        $pages[$normalized] = [PSCustomObject]@{
            Name = $name
            FullName = $_.FullName
        }
    }
    return $pages
}

function Find-BrokenLinks {
    $links = Get-AllWikiLinks
    $pages = Get-AllPageNames
    $broken = @()
    foreach ($link in $links.Keys) {
        $normalizedLink = Normalize-Name($link)
        $found = $pages.ContainsKey($normalizedLink)
        if (-not $found) {
            $broken += [PSCustomObject]@{
                Link = $link
                FoundIn = $links[$link]
            }
        }
    }
    return $broken
}

function Find-OrphanPages {
    $links = Get-AllWikiLinks
    $pages = Get-AllPageNames
    $orphans = @()
    foreach ($normalizedName in $pages.Keys) {
        $page = $pages[$normalizedName]
        $actualName = $page.Name
        $filePath = $page.FullName
        $hasIncoming = $false
        foreach ($link in $links.Keys) {
            if ((Normalize-Name($link)) -eq $normalizedName -and ($links[$link] | Where-Object { $_ -ne $filePath }).Count -gt 0) {
                $hasIncoming = $true
                break
            }
        }
        if (-not $hasIncoming -and $actualName -ne "index" -and $actualName -ne "log") {
            $orphans += $actualName
        }
    }
    return $orphans
}

Write-Host "=== Cross-Reference Checker ===" -ForegroundColor Cyan
Write-Host ""

$broken = Find-BrokenLinks
$orphans = Find-OrphanPages

Write-Host "Broken Links: $($broken.Count)" -ForegroundColor Yellow
foreach ($b in $broken) {
    Write-Host "  - [[$($b.Link)]]" -ForegroundColor Red
}

Write-Host ""
Write-Host "Orphan Pages: $($orphans.Count)" -ForegroundColor Yellow
foreach ($o in $orphans) {
    Write-Host "  - [[$o]]" -ForegroundColor Magenta
}

if ($broken.Count -eq 0 -and $orphans.Count -eq 0) {
    Write-Host "No issues found!" -ForegroundColor Green
}
