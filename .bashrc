# .bashrc

if [ -f /bin/zsh ]; then
    exec /bin/zsh
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G -w"
  # tmux
  if [ `which tmuxx` ]; then
    alias tmux='tmuxx'
    alias tm='tmuxx'
    alias tma='tmux attach'
    alias tml='tmux list-window'
  fi
  if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
      export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
      alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
      alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
      alias rm='rm -i $@'
  fi
  ;;
linux*)
  alias ls="ls --color"
  ;;
freebsd*)
  alias ls="ls -G -w"
  ;;
esac

alias ll='ls -la'
alias l='ls -1'
alias grep='grep --color'
alias rm='rm -i $@'

stty -ixon -ixoff

