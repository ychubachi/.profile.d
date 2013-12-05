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

## For livetex
export MANPATH=$MANPATH:/usr/local/texlive/2013/texmf/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2013/texmf/doc/info
export PATH=/usr/local/texlive/2013/bin/i386-linux/:$PATH

## For JDK1.7
export JAVA_HOME="$HOME/opt/jdk1.7.0_45"
export PATH="$JAVA_HOME/bin:$PATH"

## for rbenv
export RBENV_ROOT=~/.rbenv # Mac?
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Amazon EC2
export EC2_HOME=$HOME/opt/ec2-api-tools-1.6.9.0
export PATH=$PATH:$EC2_HOME/bin

if [ -f ~/bin/aws_env.sh ]; then
    source ~/bin/aws_env.sh
fi

## InteliJ IDEA
export IDEA_HOME=$HOME/opt/ida-IC-129.1359
export PATH=$PATH:$IDEA_HOME/bin

## Eclipse
export ECLIPSE_HOME=$HOME/opt/eclipse
export PATH=$PATH:$ECLIPSE_HOME

## Scala
export SCALA_HOME=$HOME/opt/scala-2.10.3
export PATH=$PATH:$SCALA_HOME/bin

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
        function emacs() { command emacsclient -c -a "" $* & }
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
if [ -d ~/.travis ]; then
    source ~/.travis/travis.sh
fi

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
