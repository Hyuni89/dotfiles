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

# install java
# JAVA_HOME set (/usr/libexec/java_home -v version) on mac

# terminal color theme
# https://github.com/Gogh-Co/Gogh
# https://github.com/lysyi3m/macos-terminal-themes

echo "Install dotfile DONE!!"
