$domain = "bcc.ad.mymanatee.org" #sets domain
$password = "thepassword" | ConvertTo-SecureString -asPlainText -Force #sets password string
$username = "administrator" #sets username string in this case were using it for local admin
$credential = New-Object System.Management.Automation.PSCredential ( $username, $password ) #combines the strings username and password to one string this is for the local admin
$dompass = "domainpassword" | ConvertTo-SecureString -asPlainText -Force #another password string
$domuser = "domain\administrator" #setting a domain username string
$domcred = New-Object System.Management.Automation.PSCredential ( $domuser, $dompass )#another combine string puts together both domain username and pass, this is for the domain admin
#remove a single pc by specifying however this can also be IP address as well
Remove-Computer -ComputerName \\computername.domain -UnjoinDomainCredential $domcred -LocalCredential$credential -Workgroup workgroup -PassThru >>\\fileshare\logs\removedomain.txt -Force -restart
