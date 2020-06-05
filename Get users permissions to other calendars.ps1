ForEach ($mailbox in (Get-Mailbox)){
    Get-Mailboxfolderpermission (($mailbox.PrimarySmtpAddress)+":\calendar") `
        -User <target email address> -ErrorAction SilentlyContinue | ForEach-Object {
        [PSCustomObject]@{
            Identity     = $mailbox.Identity
            User         = $_.User
            AccessRights = $_.Accessrights
            SharingPermissionFlags =$_.SharingPermissionFlags
        }
    }
}