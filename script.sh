sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:git-core/ppa
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y vim-nox 
sudo apt-get install -y git
sudo apt-get install -y git-lfs
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip
sudo apt-get install -y openjdk-8-jdk-headless
sudo apt-get install -y tree
sudo pip install pep8 autopep8
sudo pip3 install pep8 autopep8
sudo gem install asciidoctor
sudo gem install coderay
curl -s https://get.sdkman.io | bash
for f in ~/.ssh/*
do
  n=$(basename $f)
  if [ "authorized_keys" != "$n" ]
  then
    rm -rfv ~/.ssh/$n
  fi
done
for f in /vagrant/.ssh/*
do
  n=$(basename $f)
  cp -fv $f ~/.ssh/$n
  chmod -v u=rw,g=,o= ~/.ssh/$n
done
ln -fsv /vagrant/.gitconfig ~
if [ ! -d ~/.vim ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
ln -fsv /vagrant/.vimrc ~
vim --not-a-term +BundleInstall +qall > /dev/null
if [ ! -L ~/.tmux.conf ]
then
  ln -fsv /vagrant/.tmux.conf ~
fi
cat << 'EOF' > ~/.bash_profile
MY_SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
if [ ! -S $MY_SSH_AUTH_SOCK ]
then
  eval $(ssh-agent -s)
  ln -fsv $SSH_AUTH_SOCK $MY_SSH_AUTH_SOCK
fi
export SSH_AUTH_SOCK=$MY_SSH_AUTH_SOCK
ssh-add -l | grep "The agent has no identities" && ssh-add $(find $HOME/.ssh/ -name id_rsa* -not -name id_rsa*.pub)
export SDKMAN_DIR=/home/ubuntu/.sdkman
[[ -s $SDKMAN_DIR/bin/sdkman-init.sh ]] && source $SDKMAN_DIR/bin/sdkman-init.sh
EOF
