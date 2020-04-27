Connect-MsolService
Get-MsolUser -All -EnabledFilter DisabledOnly | where {$_.isLicensed -eq $true} | select DisplayName,UserPrincipalName,BlockCredential,Islicensed