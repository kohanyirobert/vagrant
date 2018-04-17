git clone git@github.com:VundleVim/Vundle.vim.git (Join-Path $env:USERPROFILE ".vim\bundle\Vundle.vim")
Get-ChildItem .ssh\id_rsa* | ForEach-Object {
  New-Item -ItemType SymbolicLink -Value $_.FullName -Path (Join-Path $env:USERPROFILE ".ssh" | Join-Path -ChildPath $_.Name) -Force
}
New-Item -ItemType SymbolicLink -Value .gitconfig -Path (Join-Path $env:USERPROFILE ".gitconfig") -Force
New-Item -ItemType SymbolicLink -Value .minttyrc -Path (Join-Path $env:USERPROFILE ".minttyrc") -Force
New-Item -ItemType SymbolicLink -Value .mintty -Path (Join-Path $env:USERPROFILE ".mintty") -Force
New-Item -ItemType SymbolicLink -Value .aws -Path (Join-Path $env:USERPROFILE ".aws") -Force
New-Item -ItemType SymbolicLink -Value .vimrc -Path (Join-Path $env:USERPROFILE ".vimrc") -Force
[IO.File]::WriteAllLines((Join-Path $env:USERPROFILE ".bash_profile"), @'
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add &> /dev/null
if [ $? -ne 0 ]
then
    rm $SSH_AUTH_SOCK
fi
if [ ! -S $SSH_AUTH_SOCK ]
then
  eval $(ssh-agent -s -a $SSH_AUTH_SOCK)
fi
ssh-add -l | grep "The agent has no identities" && ssh-add $(find $HOME/.ssh/ -name id_rsa* -not -name id_rsa*.pub)
export HISTCONTROL=ignoreboth:erasedups
'@)
