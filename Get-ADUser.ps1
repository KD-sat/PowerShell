﻿$oudn = "OU=Users,OU=CDC,DC=cdcgroup,DC=com"
Get-ADUser -filter * -Properties * | Where-Object { $_.DistinguishedName -like "*,$oudn" } | select name, emailaddress, office, city, country, postalcode, officephone, mobilephone, title, department | Export-Csv .\Desktop\CDCADExport22092020v2.csv