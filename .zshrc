echo '~/.zshrc'
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
# ZSH_THEME="crunch"

case "$TERM" in
eterm*)
     ZSH_THEME="robbyrussell"
    ;;
*)
    ZSH_THEME="wedisagree" # かわいいけどterminal-modeで使えない・・・
#    ZSH_THEME="crunch"
    ;;
esac

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-exstras ruby rails git-flow gem capistrano command-not-found vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# For livetex
export MANPATH=$MANPATH:/usr/local/texlive/2013/texmf/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2013/texmf/doc/info
export PATH=/usr/local/texlive/2013/bin/i386-linux/:$PATH

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#### time
REPORTTIME=8                    # CPUを8秒以上使った時は time を表示
TIMEFMT="\
    The name of this job.             :%J
    CPU seconds spent in user mode.   :%U
    CPU seconds spent in kernel mode. :%S
    Elapsed time in seconds.          :%E
    The  CPU percentage.              :%P"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# global aliases
alias -g L="| $PAGER"
alias -g M="| $PAGER"
alias -g G='| grep'
alias -g C='| xclip'
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'

function emacs() {command emacs $* &}
alias em=emacs

function dotpng() {command dot -Tpng $1.dot -o $1.png}
