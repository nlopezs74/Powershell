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

Set-ExecutionPolicy Unrestricted
# Add VMware Online depot
Add-EsxSoftwareDepot https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml

# Clone the ESXi 5.5 GA profile into a custom profile
$CloneIP = Get-EsxImageProfile ESXi-5.5.0-1331820-standard
$MyProfile = New-EsxImageProfile -CloneProfile $CloneIP -Vendor $CloneIP.Vendor -Name (($CloneIP.Name) + "-customized") -Description $CloneIP.Description

# Add latest versions of missing driver packages to the custom profile
Add-EsxSoftwarePackage -SoftwarePackage net-r8168 -ImageProfile $MyProfile
Add-EsxSoftwarePackage -SoftwarePackage net-r8169 -ImageProfile $MyProfile
Add-EsxSoftwarePackage -SoftwarePackage net-sky2 -ImageProfile $MyProfile

# Export the custom profile into ISO file
Export-EsxImageProfile -ImageProfile $MyProfile -ExportToISO -FilePath c:\temp\ESXi-5.5.0-1331820-standard-customized.iso
