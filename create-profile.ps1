# Install-Module posh-sshell
# Install-Module posh-git
Out-File -FilePath $profile -InputObject @'
Import-Module posh-sshell
Import-Module posh-git
Start-SshAgent
docker-machine env | Invoke-Expression
'@