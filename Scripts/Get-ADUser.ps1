#list of all properties - https://social.technet.microsoft.com/wiki/contents/articles/12037.active-directory-get-aduser-default-and-extended-properties.aspx
$oudn = #OU Distinguished Name
Get-ADUser -filter * -Properties * | Where-Object { $_.DistinguishedName -like "*,$oudn" } | Select-Object 