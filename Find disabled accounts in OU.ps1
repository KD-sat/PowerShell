$OUDN = "OU Distinguished Name"
Get-ADUser -Filter {Enabled -eq $false} | Where-Object { $_.DistinguishedName -like "*,$OUDN" } | Select-Object name | Export-Csv -Path filepath