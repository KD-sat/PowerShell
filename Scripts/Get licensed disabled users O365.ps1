Connect-MsolService
Get-MsolUser -All -EnabledFilter DisabledOnly | Where-Object {$_.isLicensed -eq $true} | Select-Object DisplayName,UserPrincipalName,BlockCredential,Islicensed