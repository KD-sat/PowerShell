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
$passwords = @()

# Generating passwords to use with the accounts
$uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
$lowercase = "abcdefghijklmnopqrstuvwxyz"
$numbers = "0123456789"
$symbols = "!@#$%^&*()"
$allChars = $uppercase + $lowercase + $numbers + $symbols

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
	password = $passwords
	
}

Import-Module Microsoft.Graph.Users



Connect-MgGraph