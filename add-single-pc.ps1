$domain = "bcc.ad.mymanatee.org" 
$user = "admigrate"
#Don't edit below this point 
$password = Read-Host -Prompt "Enter password for $user" -AsSecureString 
$username = "$domain\$user" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password) 
Add-Computer -DomainName $domain -Credential $credential