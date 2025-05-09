Connect-MgaGraph

$groupInfo = Get-Mggroup -Filter "DisplayName eq 'All Users'"
$groupMembers = Get-MgGroupMember -GroupId $($groupInfo.ID) -All | Select-Object Id

$groupMemberInfo = foreach ($member in $groupMembers) {
    Get-MgUser -UserId $member.Id -select displayName, id, userPrincipalName, createddatetime | Select-Object displayName, id, userPrincipalName, createddatetime
}

$date = (Get-Date).AddDays(-90)

$oldUsers = @()

foreach ($user in $groupMemberInfo) {
    if ($user.CreatedDateTime -lt $date) {
        $oldUsers += ForEach-Object {[PSCustomObject]@{
            DisplayName = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            CreatedDate = $user.CreatedDateTime
        }}
    }
}