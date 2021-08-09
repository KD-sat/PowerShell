$filename = "D:\File Audit Reports\File Audit Report " + (Get-Date -Format dd-mm-yy-hhmm) + ".htm"
get-winevent @{logname='security';providername='Microsoft-Windows-Security-Auditing';
  data='S-1-5-21-963261125-249002985-2650991461-1138';starttime=(Get-Date).AddDays(-7);
  id=4663,4660,4656,4658}` | ConvertTo-Html | Out-File -FilePath $filename