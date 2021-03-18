#!/bin/sh

echo "Install dotfile START!!"

export OS=`uname`

if [ $OS = "Linux" ]; then
	echo "Only work in Debian Linux"
	sudo sh install/linux.sh
elif [ $OS = "Darwin" ]; then
	echo "Mac"
	sh install/mac.sh
else
	exit
fi

sh install/common.sh

ln -sF `pwd`/vimrc ~/.vimrc
ln -sF `pwd`/tmux.conf ~/.tmux.conf

echo "Install dotfile DONE!!"
