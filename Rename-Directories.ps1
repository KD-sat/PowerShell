
$changes = Import-Csv .\changes.csv
$dir = "change this to the directory path required"
cd $dir
$changes | ForEach-object {
write-host "renaming " $($_.origDirName) "to " $($_.NewDirName)

$oldname = $($_.origDirName)
$newname = $($_.NewDirName)

Get-ChildItem -Recurse -Directory -Path $dir -filter *$($_.origDirName)* | Rename-Item -NewName { $_.Name -replace $oldname , $newname } -verbose

}

