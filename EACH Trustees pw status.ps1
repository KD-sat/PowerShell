﻿$users = Get-ADGroupMember -Identity "each trustees"
$(foreach ($user in $users){
Get-ADUser $user -Properties msDS-UserPasswordExpiryTimeComputed, PasswordLastSet, CannotChangePassword | select Name, @{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, PasswordLastSet})