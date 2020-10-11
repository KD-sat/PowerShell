$OUDN = "OU Distinguished Name"
Get-ADUser -Filter {Enabled -eq $false} | Where-Object { $_.DistinguishedName -like "*,$OUDN" } | select name | Export-Csv -Path filepath
