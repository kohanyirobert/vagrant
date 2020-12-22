Out-File -FilePath $profile -InputObject @'
function Enable-Docker-Toolbox {
  docker-machine env --shell powershell | Invoke-Expression
}
function Try-Enable-Docker-Toolbox {
  If ($(& docker-machine status) -eq 'Running') {
    Enable-Docker-Toolbox
  }
}
function Disable-Docker-Toolbox {
  docker-machine env --shell powershell | Invoke-Expression
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
  ssh-add ((ls ~\.ssh\id_rsa_*) `
    | where {$_.Name -NotMatch '^id_rsa_.*\.pub$' -And $_.Name -Like "*${selector}*"}).FullName
}
Import-Module posh-ssh
Import-Module posh-git
Try-Enable-Docker-Toolbox
Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key Ctrl+LeftArrow -Function BackwardWord
Set-PSReadlineKeyHandler -Key Ctrl+RightArrow -Function NextWord
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
'@
