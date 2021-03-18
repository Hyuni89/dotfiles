# Zsh Install
if [ $OS = "Linux" ]; then
    sudo apt install zsh
elif [ $OS = "Darwin" ]; then
    brew install zsh zsh-completions
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s `which zsh`
sudo chown -R ${USER} ${HOME}/.oh-my-zsh

# zsh theme
ZSH_THEME="refined"
# TODO change theme

# zsh plugin
# zsh-syntax-highlighting
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
PARAM='
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
'
echo "$PARAM" >> ~/.zshrc

# alias
ALIAS='
alias py="python3"
alias l="ls -F"
alias ll="ls -alF"
alias sw="swift"
alias tmux="tmux -2"
stty -ixon
'
echo "$ALIAS" >> ~/.zshrc

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# tig (git visualize tool)
# tmux
if [ $OS = "Linux" ]; then
    sudo apt install tig
    sudo apt install tmux
elif [ $OS = "Darwin" ]; then
    brew install tig
    brew install tmux
fi

sudo sh install/vim.sh
