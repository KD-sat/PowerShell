$csvpath = Read-Host -Prompt "Path to your CSV"
$dlname = Read-Host -Prompt "Name of the distribution list"


Import-Csv -Path $csvpath | ForEach-Object {Add-DistributionGroupMember -Identity $dlname -Member $_.name}