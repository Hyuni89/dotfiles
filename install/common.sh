# Zsh Install
if [ $OS = "Linux" ]; then
    sudo apt install zsh
elif [ $OS = "Dawin" ]; then
    brew install zsh zsh-completions
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s `which zsh`

# zsh theme
ZSH_THEME="refined"
# TODO change theme

# zsh plugin
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
PARAM="
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
"
echo $PARAM >> ~/.zshrc

# alias
ALIAS='
alias py="python3"
alias l="ls -F"
alias ll="ls -alF"
alias sw="swift"
stty -ixon
'
echo $ALIAS >> ~/.zshrc

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# tig (git visualize tool)
if [ $OS = "Linux" ]; then
    sudo apt install tig
elif [ $OS = "Dawin" ]; then
    brew install tig
fi

source install/vim.sh
