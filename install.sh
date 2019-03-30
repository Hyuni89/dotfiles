#!/bin/sh

echo "Install dotfile START!!"

OS=`uname`

if [ $OS = "Linux" ]; then
	echo "Only work in Debian Linux"
    source install/linux.sh
elif [ $OS = "Dawin" ]; then
	echo "Mac"
	source install/mac.sh
else
	exit
fi

source install/common.sh

ln -sF vimrc ~/.vimrc
ln -sF tmux.conf ~/.tmux.conf

source ~/.zshrc

echo "Install dotfile DONE!!"
