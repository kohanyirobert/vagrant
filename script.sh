sudo apt-get update
sudo apt-get install -y python-software-properties
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y default-jdk
sudo apt-get install -y docker-ce
sudo apt-get install -y vim-nox
sudo apt-get install -y git
sudo apt-get install -y tree
sudo apt-get install -y jq
sudo apt-get install -y ack-grep
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y python-dev
sudo apt-get install -y nodejs
sudo apt-get install -y mc
sudo apt-get install -y lubuntu-desktop
sudo apt-get remove -y --auto-remove python-pip
sudo apt-get remove -y --auto-remove python3-pip
wget https://bootstrap.pypa.io/get-pip.py
sudo -H -u vagrant python get-pip.py --user
sudo -H -u vagrant python3 get-pip.py --user
rm -vf get-pip.py
sudo snap install --classic vscode
sudo pip install pep8
sudo pip install autopep8
sudo pip install awscli
sudo pip install virtualenv
sudo pip3 install pep8
sudo pip3 install autopep8
sudo gem install asciidoctor
sudo gem install coderay
sudo gem install github_cli
# https://askubuntu.com/a/732999/10744
sudo easy_install -U pip
curl -s https://get.sdkman.io | bash
curl -sSL https://get.haskellstack.org/ | sh
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
ln -fsv /vagrant/.aws ~
ln -fsv /vagrant/.githubrc ~
cp -fv /vagrant/.ghci ~
chmod -v u=rw,g=,o= ~/.ghci
if [ ! -d ~/.vim ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
ln -fsv /vagrant/.{,g}vimrc ~
vim --not-a-term +BundleInstall +qall > /dev/null
if [ ! -L ~/.tmux.conf ]
then
  ln -fsv /vagrant/.tmux.conf ~
fi
if [ ! -L ~/.bash_profile ]
then
  ln -fsv /vagrant/.bash_profile ~
fi
if [ ! -L ~/.bash_profile.vagrant ]
then
  ln -fsv /vagrant/.bash_profile.vagrant ~
fi
