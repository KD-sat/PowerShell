Import-Csv -Path filepath | ForEach-Object {Add-DistributionGroupMember -Identity "DL Name" -Member $_.name}