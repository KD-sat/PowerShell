$users = Get-ADGroupMember -Identity #security group name
$(foreach ($user in $users){
Get-ADUser $user -Properties msDS-UserPasswordExpiryTimeComputed, PasswordLastSet, CannotChangePassword | Select-Object Name, @{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, PasswordLastSet})