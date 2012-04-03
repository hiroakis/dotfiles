# .bashrc

#if [ -f /bin/zsh ]; then
#    exec /bin/zsh
#fi

alias ll='ls -la'
alias l='ls -1'
alias grep='grep --color'

stty -ixon -ixoff

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
    alias rm='rm -i $@'
fi

