# Install-Module posh-sshell
# Install-Module posh-git
Out-File -FilePath $profile -InputObject @'
function Enable-Docker-Toolbox {
  docker-machine env | Invoke-Expression
}
function Disable-Docker-Toolbox {
  docker-machine env | Invoke-Expression
  del -ErrorAction Ignore env:\DOCKER_TLS_VERIFY
  del -ErrorAction Ignore env:\DOCKER_CERT_PATH
  del -ErrorAction Ignore env:\DOCKER_HOST
  del -ErrorAction Ignore env:\DOCKER_TOOLBOX_INSTALL_PATH
}
function Ssh-List-Keys {
  (ls ~\.ssh\id_rsa_*.pub).Name -replace '^id_rsa_(.*)\.pub$','$1'
}
function Ssh-Switch-Key {
  param ([string]$selector)
  ssh-add -D
  ssh-add -t 28800 ((ls ~\.ssh\id_rsa_*) `
    | where {$_.Name -NotMatch '^id_rsa_.*\.pub$' -And $_.Name -Like "*${selector}*"})
}
Import-Module posh-sshell
Import-Module posh-git
Start-SshAgent
Enable-Docker-Toolbox

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
'@
