<powershell>

Import-Module -Name 'NetSecurity'
 
# Setup windows update service to manual
$wuauserv = Get-WmiObject Win32_Service -Filter "Name = 'wuauserv'"
$wuauserv_starttype = $wuauserv.StartMode
Set-Service wuauserv -StartupType Manual
 
# Install OenSSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
 
# Set service to automatic and start
Set-Service sshd -StartupType Automatic
Start-Service sshd
 
# Setup windows update service to original
Set-Service wuauserv -StartupType $wuauserv_starttype
 
# Configure PowerShell as the default shell
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "$Env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
 
# Restart the service
Restart-Service sshd
 
# Path to ssh public key file
#$ssh_key_file_path = "./certs/terraform-public/ansible-win.key.pub"

# Configure SSH public key
$content = "ssh-rsa AAAA....olfS52D0= administrator@windows2022"
#$content = Get-Content -Path $ssh_key_file_path -Raw
 
# Write public key to file
$content | Set-Content -Path "$Env:ProgramData\ssh\administrators_authorized_keys"
 
# set acl on administrators_authorized_keys
$admins = ([System.Security.Principal.SecurityIdentifier]'S-1-5-32-544').Translate( [System.Security.Principal.NTAccount]).Value
$acl = Get-Acl $Env:ProgramData\ssh\administrators_authorized_keys
$acl.SetAccessRuleProtection($true, $false)
$administratorsRule = New-Object system.security.accesscontrol.filesystemaccessrule($admins,"FullControl","Allow")
$systemRule = New-Object system.security.accesscontrol.filesystemaccessrule("SYSTEM","FullControl","Allow")
$acl.SetAccessRule($administratorsRule)
$acl.SetAccessRule($systemRule)
$acl | Set-Acl
 
# Open firewall port 22
$FirewallParams = @{ 
  "DisplayName"       = 'OpenSSH SSH Server (sshd)'
  "Direction"         = 'Inbound'
  "Action"            = 'Allow'
  "Protocol"          = 'TCP'
  "LocalPort"         = '22'
  "Program"           = '%SystemRoot%\system32\OpenSSH\sshd.exe'
}
New-NetFirewallRule @FirewallParams

</powershell>
