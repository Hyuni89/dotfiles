# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# vim colorscheme
mkdir -p ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim && mv jellybeans.vim ~/.vim/colors

sudo chown -R ${USER} ${HOME}/.vim
