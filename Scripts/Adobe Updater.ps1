CD hklm:\
Set-Itemproperty -path 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Adobe\Adobe ARM\Legacy\Acrobat\{AC76BA86-1033-1033-7760-BC15014EA700}' -Name 'Mode' -value '0'
Set-ItemProperty -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Adobe\Adobe Acrobat\DC\FeatureLockdown' -Name 'bUpdater' -Value '0'
New-Item -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown' -Name 'bUpdater' -ItemType 'REG_DWORD'
Set-ItemProperty -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown' -Name 'bUpdater'-Value '0'
Disable-ScheduledTask -TaskName 'Adobe Acrobat Update Task'