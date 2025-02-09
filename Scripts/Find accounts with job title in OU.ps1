#Params
$OUDN = Read-Host -Prompt "OU Distinguished Name"
$jobtitle = Read-Host -Prompt "Job Title"

$users = Get-ADUser -Filter {(Title -eq $jobtitle)} | Where-Object { $_.DistinguishedName -like "*,$OUDN" } | Select-Object name 

Export-Csv -Path filepath