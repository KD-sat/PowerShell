$OUDN = "OU Distinguished Name"
$30days = (Get-Date).AddDays(-30)
Get-ADUser -properties * -Filter {lastlogondate -le $30days} | Where-Object { $_.DistinguishedName -like "*,$OUDN" } | select name,lastlogondate | Export-Csv
