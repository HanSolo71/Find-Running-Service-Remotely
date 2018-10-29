#Gets all workstations that need to have software installed, if you don't want to uninstall all of the software from you will need to use a text document and Get-Content
$Machines = Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=Contoso,DC=COM" | Select DNSHostName -ExpandProperty DNSHostname

#Name of service to determine if it is running
$ServiceName = "Service"

foreach ($Machine in $Machines) {
Write-Output "`r`n The Machine being evaluated is $Machine"
tasklist /S $Machine /FI "SERVICES eq $ServiceName"
}
