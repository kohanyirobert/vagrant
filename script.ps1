Get-ChildItem .ssh\id_rsa* | ForEach-Object {
  New-Item -ItemType SymbolicLink -Value $_.FullName -Path (Join-Path $env:USERPROFILE ".ssh" | Join-Path -ChildPath $_.Name) -Force
}
New-Item -ItemType SymbolicLink -Value .gitconfig -Path (Join-Path $env:USERPROFILE ".gitconfig") -Force
New-Item -ItemType SymbolicLink -Value .minttyrc -Path (Join-Path $env:USERPROFILE ".minttyrc") -Force
New-Item -ItemType SymbolicLink -Value .mintty -Path (Join-Path $env:USERPROFILE ".mintty") -Force
New-Item -ItemType SymbolicLink -Value .aws -Path (Join-Path $env:USERPROFILE ".aws") -Force