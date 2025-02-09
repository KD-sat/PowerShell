$users=Get-ADUser -Filter { EmailAddress -like "*@contoso.com" -AND extensionattribute10 -notlike "*" } -Properties extensionattribute10 -SearchBase "OU"
foreach ($user in $users){
set-aduser -Identity $user -Add @{extensionAttribute10="value"}
}