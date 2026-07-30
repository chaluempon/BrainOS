# Ingest Watcher - Phase 2A
param([switch]$AutoRun)
$WIKI_ROOT = "D:\OneDrive - NOVA KORAT COMPANY LIMITED\Antigarvity\Ai_WiKi"
$RAW_DIR = "$WIKI_ROOT\raw"
$ARCHIVE_DIR = "$WIKI_ROOT\.archive"
function Get-RawFiles {
    $files = @()
    if (Test-Path $RAW_DIR) {
        Get-ChildItem $RAW_DIR -File | ForEach-Object {
            $files += [PSCustomObject]@{
                Name = $_.Name
                Extension = $_.Extension.ToLower()
                Size = $_.Length
                Modified = $_.LastWriteTime
                FullPath = $_.FullName
            }
        }
    }
    return $files
}
function Show-PendingFiles {
    $files = Get-RawFiles
    if ($files.Count -eq 0) {
        Write-Host "No files in raw/" -ForegroundColor Yellow
        return $null
    }
    Write-Host "Files pending ingest:" -ForegroundColor Cyan
    $files | ForEach-Object -Begin { $i = 1 } {
        Write-Host "[$i] $($_.Name)"
        $i++
    }
    return $files
}
$files = Show-PendingFiles
if ($files.Count -eq 0) { exit 0 }
if ($AutoRun) {
    foreach ($file in $files) {
        $archivePath = "$ARCHIVE_DIR\$($file.Name)"
        Move-Item $file.FullPath $archivePath -Force -ErrorAction SilentlyContinue
    }
    Write-Host "Ingest complete" -ForegroundColor Green
}
