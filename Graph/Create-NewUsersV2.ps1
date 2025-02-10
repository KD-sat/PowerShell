#########################################################################
#########################################################################
########## Creating new users using MS Graph Powershell Module ##########
#########################################################################
#########################################################################

# Connect to Graph
Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

# Import user details from CSV
$path = "C:\Users\kamil\Desktop\Users.csv"
$users = Import-CSV -Path $path

# Character set for password generation
$allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"

# Import Microsoft Graph Users Module
Import-Module Microsoft.Graph.Users

# Loop through each user in CSV
foreach ($user in $users) {
    $displayName = $user.displayName
    $mailNickname = $displayName -replace " ","."
    $upn = "$mailNickname@notideal.co.uk"

    # Generate a random password
    $password = -join ((1..16) | ForEach-Object { $allChars[(Get-Random -Maximum $allChars.Length)] })

    # Create user parameters
    $params = @{
        accountEnabled     = $true
        displayName        = $displayName
        mailNickname       = $mailNickname
        userPrincipalName  = $upn
        passwordProfile    = @{
            forceChangePasswordNextSignIn = $true
            password = $password
        }	
    }

    # Create new user
    New-MgUser -BodyParameter $params
}
