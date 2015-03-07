<#
.SYNOPSIS
   <A brief description of the script>
.DESCRIPTION
   <A detailed description of the script>
.PARAMETER <paramName>
   <Description of script parameter>
.EXAMPLE
   <An example of using the script>
#>

$domain = "fqdn" #sets domain
$remove = Import-Csv "C:\PC.csv" #imports a list of PC's
$password = "thepassword" | ConvertTo-SecureString -asPlainText -Force #sets password string
$username = "administrator" #sets username string in this case were using it for local admin
$credential = New-Object System.Management.Automation.PSCredential ( $username, $password ) #combines the strings username and password to one string this is for the local admin
$dompass = "domainpassword" | ConvertTo-SecureString -asPlainText -Force #another password string
$domuser = "domain\administrator" #setting a domain username string
$domcred = New-Object System.Management.Automation.PSCredential ( $domuser, $dompass )#another combine string puts together both domain username and pass, this is for the domain admin

#for every item under the colum name "fqdn_name" in the csv it will run the below command - this removes from the domain and puts the pc into a workgroup
foreach ($pc in $remove ) {
  Remove-Computer -ComputerName $pc .fqdn_name -UnjoinDomainCredential $domcred -LocalCredential$credential -Workgroup workgroup -PassThru >>\\fileshare\logs\removedomain.txt -Force -restart
}
