Get-ChildItem .ssh\id_rsa* | ForEach-Object {
  New-Item -ItemType SymbolicLink -Value $_.FullName -Path (Join-Path $env:USERPROFILE ".ssh" | Join-Path -ChildPath $_.Name) -Force
}
New-Item -ItemType SymbolicLink -Value .gitconfig -Path (Join-Path $env:USERPROFILE ".gitconfig") -Force
New-Item -ItemType SymbolicLink -Value .minttyrc -Path (Join-Path $env:USERPROFILE ".minttyrc") -Force
New-Item -ItemType SymbolicLink -Value .mintty -Path (Join-Path $env:USERPROFILE ".mintty") -Force
New-Item -ItemType SymbolicLink -Value .aws -Path (Join-Path $env:USERPROFILE ".aws") -Force
[IO.File]::WriteAllLines((Join-Path $env:USERPROFILE ".bash_profile"), @'
MY_SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
if [ ! -S $MY_SSH_AUTH_SOCK ]
then
  eval $(ssh-agent -s)
  ln -fsv $SSH_AUTH_SOCK $MY_SSH_AUTH_SOCK
fi
export SSH_AUTH_SOCK=$MY_SSH_AUTH_SOCK
ssh-add -l | grep "The agent has no identities" && ssh-add $(find $HOME/.ssh/ -name id_rsa* -not -name id_rsa*.pub)
export HISTCONTROL=ignoreboth:erasedups
'@) 