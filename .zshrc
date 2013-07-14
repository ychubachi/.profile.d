echo '.zshrc'
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

# For livetex
export MANPATH=$MANPATH:/usr/local/texlive/2013/texmf/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2013/texmf/doc/info
export PATH=/usr/local/texlive/2013/bin/i386-linux/:$PATH

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# nocorrects
alias git='nocorrect git'
alias knife='nocorrect knife'

# alias
alias mew="emacs -e mew &"
alias todo="emacs ~/Dropbox/Todo/todo.txt &"
alias note="emacs ~/Dropbox/Note/index.org &"
alias memo="emacs ~/Dropbox/Note/index.org &"

alias td="todo.sh"
alias tdls="todo.sh ls"
alias tdlsa="todo.sh ls '(A)'"
alias tda="todo.sh add"
alias tddo="todo.sh do"

alias firefox="firefox >& /dev/null"

alias pdfviewer='evince'
alias imageviewer='eog'

# # Aliases for Ruby
# # see: http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/
alias b="bundle"
alias bi="b install --path=vendor/bundle --binstubs=vendor/bin"
alias binit="bi && b package --all && echo 'vendor/bundle' >> .gitignore"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias bb="b binstubs"


alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ga='git add'
alias gap='git add -p'
alias gau='git add -u'
alias gbr='git branch'
alias gps='git push --set-upstream origin $(current_branch)'
alias gci='git commit'
alias gcim='git commit -m'

alias zshrc='. ~/.zshrc'
alias vizshrc='vi ~/.zshrc'
alias vizsh=vizshrc

alias -g L="| $PAGER"
alias -g M="| $PAGER"
alias -g G='| grep'
alias -g C='| xclip'
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'

function google() {
  local str opt 
  if [ $# != 0 ]; then # 引数が存在すれば
    for i in $*; do
      str="$str+$i"
    done    
    str=`echo $str | sed 's/^\+//'` #先頭の「+」を削除
    opt='search?num=50&hl=en&ie=utf-8&oe=utf-8&lr=lang_en'
    opt="${opt}&q=${str}"
  fi
  firefox http://www.google.co.jp/$opt #引数がなければ $opt は空になる
  # mozilla -remote openURL\(http::/www.google.co.jp/$opt\) # 未テスト
}
alias ggl=google

function emacs() {command emacs $* &}
alias em=emacs

function dotpng() {command dot -Tpng $1.dot -o $1.png}

function rm() {
  if [ -d ~/.trash ]; then
    local DATE=`date "+%y%m%d-%H%M%S"`
    mkdir ~/.trash/$DATE
    for i in $@; do
      # 対象が ~/.trash/ 以下なファイルならば /bin/rm を呼び出したいな
      if [ -e $i ]; then
        mv $i ~/.trash/$DATE/
      else 
        echo "$i : not found"
      fi
    done
  else
    /bin/rm $@
  fi
}

#### time
REPORTTIME=8                    # CPUを8秒以上使った時は time を表示
TIMEFMT="\
    The name of this job.             :%J
    CPU seconds spent in user mode.   :%U
    CPU seconds spent in kernel mode. :%S
    Elapsed time in seconds.          :%E
    The  CPU percentage.              :%P"
