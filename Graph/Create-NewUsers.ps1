#########################################################################
#########################################################################
########## Creating new users using MS Graph Powershell Module ##########
#########################################################################
#########################################################################

#Parameters with new user details
$path = "C:\Users\kamil\Desktop\Users.csv"
$users = Import-CSV -Path $path
$mailNickname = $users.displayName -replace " ","."
$upn = @()
foreach ($mail in $mailnickname) {
    $upn += "$mail@notideal.co.uk"
}

# Generating passwords to use with the accounts
$passwords = @()

$allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"

for ($i = 0; $i -lt 50; $i++) {
    $password = -join ((1..16) | ForEach-Object { $allChars[(Get-Random -Maximum $allChars.Length)] })
    $passwords += $password
}

#Mapping the params to the cmdlet parameters
$params = @{
	accountEnabled = $users.accountEnabled
	displayName = $users.displayName
	mailNickname = $mailNickname
	userPrincipalName = $upn
	forceChangePasswordNextSignIn = $true
	passwordProfile = @{
		forceChangePasswordNextSignIn = $true
		password = $passwords
	}	
}

Import-Module Microsoft.Graph.Users

#Connect-MgGraph

for ($i = 0; $i++) {
	New-MgUser -AccountEnabled $params.accountEnabled -DisplayName $params.displayName -MailNickname $params.mailNickname -UserPrincipalName $params.userPrincipalNam -PasswordProfile $params.passwordProfile
}