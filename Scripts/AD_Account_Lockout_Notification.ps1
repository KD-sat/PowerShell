﻿#Declare variables to be used for the Email
$MailSubject= “Notice: User Account locked out”
$MailFrom=”from address”
$MailTo=”to address”

#Gets the Event Log that contains the most recent lockout event
$Event = Get-EventLog -LogName Security -InstanceId 4740 -Newest 1

#Creates a variable which contains the contents of the lockout event log. This is used for the actual message in the email
$MailBody= $Event.Message + “`r`n`t” + $Event.TimeGenerated

#Creates an SMTP Object and assigns an SMTP Address
$SmtpClient = New-Object system.net.mail.smtpClient
$SmtpClient.host = “SMTP Server”

#Creates a new Mail Message Object. This is the object needed for the addressing email, subject, body, etc
$MailMessage = New-Object system.net.mail.mailmessage
$MailMessage.from = $MailFrom
$MailMessage.To.add($MailTo)
$MailMessage.IsBodyHtml = 0
$MailMessage.Subject = $MailSubject
$MailMessage.Body = $MailBody

#Actually Sends the Message
$SmtpClient.Send($MailMessage)