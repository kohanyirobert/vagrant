# Install-Module posh-sshell
# Install-Module posh-git
Out-File -FilePath $profile -InputObject @'
Import-Module posh-sshell
Import-Module posh-git
Start-SshAgent
Get-ChildItem ~/.ssh | Where-Object Name -Match ^id_rsa\d+$ | ForEach-Object {
  Add-SshKey $_.FullName
}
'@