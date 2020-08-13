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
export HISTCONTROL=ignoreboth:erasedups
alias ssh-copy-id-password-only='ssh-copy-id -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias ssh-password-only='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias ssh-list-keys='for f in ~/.ssh/*.pub; do echo -e "$f \t $(ssh-keygen -l -E md5 -f $f)"; done'
alias mc='mc -b'
if [ -f "$HOME/.bash_profile.windows" ]
then
  source "$HOME/.bash_profile.windows"
fi
if [ -f "$HOME/.bash_profile.vagrant" ]
then
  source "$HOME/.bash_profile.vagrant"
fi
source ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u:\w" "\n\\\$ "'
export GIT_PS1_SHOWCOLORHINTS=1
