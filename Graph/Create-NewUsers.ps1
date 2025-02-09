#########################################################################
#########################################################################
########## Creating new users using MS Graph Powershell Module ##########
#########################################################################
#########################################################################

$path = "C:\Users\kamil\Desktop\Users.csv"
$users = Import-CSV -Path $path
$mailNickname = $users.displayName -replace " ","."
$upn = @()
foreach ($mail in $mailnickname) {
    $upn += "$mail@notideal.co.uk"
}


$params = @{
	accountEnabled = $users.accountEnabled
	displayName = $users.displayName
	mailNickname = $mailNickname
	userPrincipalName = $upn
	passwordProfile = @{
		forceChangePasswordNextSignIn = $true
		password = 
	}
}

Import-Module Microsoft.Graph.Users



Connect-MgGraph