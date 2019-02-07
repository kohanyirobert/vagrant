git clone git@github.com:VundleVim/Vundle.vim.git (Join-Path $env:USERPROFILE ".vim\bundle\Vundle.vim")
Get-ChildItem .ssh\id_rsa* | ForEach-Object {
  New-Item -ItemType SymbolicLink -Value $_.FullName -Path (Join-Path $env:USERPROFILE ".ssh" | Join-Path -ChildPath $_.Name) -Force
}
New-Item -ItemType SymbolicLink -Value .gitconfig -Path (Join-Path $env:USERPROFILE ".gitconfig") -Force
New-Item -ItemType SymbolicLink -Value .minttyrc -Path (Join-Path $env:USERPROFILE ".minttyrc") -Force
New-Item -ItemType SymbolicLink -Value .mintty -Path (Join-Path $env:USERPROFILE ".mintty") -Force
New-Item -ItemType SymbolicLink -Value .aws -Path (Join-Path $env:USERPROFILE ".aws") -Force
New-Item -ItemType SymbolicLink -Value .vimrc -Path (Join-Path $env:USERPROFILE ".vimrc") -Force
New-Item -ItemType SymbolicLink -Value .gvimrc -Path (Join-Path $env:USERPROFILE ".gvimrc") -Force
New-Item -ItemType SymbolicLink -Value .bash_profile -Path (Join-Path $env:USERPROFILE ".bash_profile") -Force
New-Item -ItemType SymbolicLink -Value .bash_profile.windows -Path (Join-Path $env:USERPROFILE ".bash_profile.windows") -Force