#bin/sh
printf "Installing i3wm\n"
sudo dnf -y install i3 i3status i3lock dmenu dunst

printf "\nMaking Git Folder"
mkdir $HOME/git
mkdir $HOME/.vim
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/tmp

printf "\nCloning Settings and Vundle"
git clone https://github.com/OrigamiBurger/DotFiles.git ~/git/DotFiles
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

printf "\nCopying Settings Files"
cp -R $HOME/DotFiles/linux/.i3 $HOME
cp -n $HOME/DotFiles/linux/.zshrc $HOME
cp -n $HOME/DotFiles/linux/.vimrc $HOME
cp -n $HOME/DotFiles/linux/.gitconfig $HOME
printf "\nInstalling vim Plugins"
vim +BundleInstall +qall

printf "\nInstalling Gnome-Tweak-Tool, Repositories, VLC, Flash, VirtualBox, Cowsay and 7zip"
sudo dnf -y update
sudo dnf -y install vim
sudo dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-22.noarch.rpm
sudo dnf -y install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-22.noarch.rpm
sudo dnf -y update
sudo dnf -y install vlc
sudo dnf -y install yum-plugin-fastestmirror
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo dnf -y install flash-plugin
sudo dnf -y install VirtualBox
sudo dnf -y install cowsay
sudo dnf -y install p7zip
sudo dnf -y install steam
sudo dnf -y install network-manager-applet
sudo dnf -y install xbacklight
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
printf "\nDon't forget to set the custom profile for using zsh in gnome-terminal\n"
