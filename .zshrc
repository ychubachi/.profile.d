
# 注意：このスクリプトはdot-zshrc.orgが自動生成したものです。

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
        # ZSH_THEME="wedisagree" # かわいいけどterminal-modeで使えない・・・
        # ZSH_THEME="amuse" # rubyのバージョンが出る
        # ZSH_THEME="bureau" # 白基調のシンプル．アイコンがわかりづらい？
        # ZSH_THEME="peepcode" # NG: rvmがないと言われる
        # ZSH_THEME="pure" # NG: とてもシンプル
        ZSH_THEME="sonicradish" #ホスト名あり 
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
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-exstras ruby rails rbenv bundler git-flow git-hubflow gem capistrano command-not-found vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

## ================================================================
## Application settings including PATHs and other environment vers.
## ================================================================

## set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

## For texlive
if [ -d /usr/local/texlive/2014/ ]; then
    export INFOPATH=$INFOPATH:/usr/local/texlive/2014/texmf-dist/doc/info
    export MANPATH=$MANPATH:/usr/local/texlive/2014/texmf-dist/doc/man
    export PATH=/usr/local/texlive/2014/bin/i386-linux:$PATH
    export PATH=/usr/local/texlive/2014/bin/x86_64-linux:$PATH # Workaround
fi

## For JDK1.7
if [ -d "$HOME/opt/jdk1.7.0_45" ]; then
  export JAVA_HOME="$HOME/opt/jdk1.7.0_45"
  export PATH="$JAVA_HOME/bin:$PATH"
fi

## Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

## Amazon EC2
if [ -d "$HOME/opt/ec2-api-tools-1.6.9.0" ]; then
    export EC2_HOME=$HOME/opt/ec2-api-tools-1.6.9.0
    export PATH=$PATH:$EC2_HOME/bin
fi

## InteliJ IDEA
if [ -d $HOME/opt/ida-IC-129.1359 ]; then
    export IDEA_HOME=$HOME/opt/ida-IC-129.1359
    export PATH=$PATH:$IDEA_HOME/bin
fi

## Eclipse
if [ -d $HOME/opt/eclipse ]; then
    export ECLIPSE_HOME=$HOME/opt/eclipse
    export PATH=$PATH:$ECLIPSE_HOME
fi

## Scala
if [ -d $HOME/opt/scala-2.10.3 ]; then
    export SCALA_HOME=$HOME/opt/scala-2.10.3
    export PATH=$PATH:$SCALA_HOME/bin
fi

## for rbenv
export RBENV_ROOT=~/.rbenv # Mac?
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/bin/aws_env.sh ]; then
    source ~/bin/aws_env.sh
fi

## ================================================================
## Alias definitions.
## ================================================================

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

## ================================================================
## Shell functions.
## ================================================================

case "$(uname -s)" in
    Linux*)
        # Do something under Linux platform
        echo "Linux"
        function emacs() { command emacsclient -c -a "" $* }
        function vim()   { command emacsclient -t -a "" $* }
        function killemacs() { command emacsclient -e "(kill-emacs)"}
        # Eclipse menu workaround
        alias eclipse='UBUNTU_MENUPROXY=0 eclipse'
        ;;
    Darwin*)
        # Do something under Mac OS X platform        
        echo "Darwin"
        function emacs() {
            /Applications/Emacs.app/Contents/MacOS/Emacs -r $* &
        }
        ;;
    MINGW32_NT*)
        # Do something under Windows NT platform
        echo "MinGW"
        ;;
    CYGWIN*)
        # Do something under Cygwin shell
        echo "Cygwin"
        ;;
    *)
        echo "Other"
        ;;
esac


alias em=emacs
alias vi=vim

function dotpng() {command dot -Tpng $1.dot -o $1.png}

# added by travis gem

## ================================================================
## Time
## ================================================================

REPORTTIME=8                    # CPUを8秒以上使った時は time を表示
TIMEFMT="\
    The name of this job.             :%J
    CPU seconds spent in user mode.   :%U
    CPU seconds spent in kernel mode. :%S
    Elapsed time in seconds.          :%E
    The  CPU percentage.              :%P"

if [ -f $HOME/.xmodmap ]; then
    xmodmap $HOME/.xmodmap
fi

# Chef
export PATH=/opt/chefdk/bin:$PATH

# Hub
eval "$(hub alias -s)"

export NVM_DIR="/home/yc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Cask
export PATH="/home/yc/.cask/bin:$PATH"
