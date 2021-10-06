## This script requires the NTFSSecurity PS Module available from PSGallery ##

$paths = get-childitem -Path '#filepath - can be pointed to a drive' -Directory | ForEach-Object {$_.FullName}
Get-NTFSAccess -Path $paths | Export-Csv -Path '#path'