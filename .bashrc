echo '~/.bashrc'

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/local/bin/lesspipe.sh ]; then
    LESSOPEN="|/usr/local/bin/lesspipe.sh %s"; export LESSOPEN
fi
export LESS='-R'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

q# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

########################################################################
# Written by Y.Chubachi
########################################################################

# Set my prompt. These codes are from cygwin.
function custom_prompt_command {
    typeset _Retv=$?
    typeset _PromptColor=""
    if [[ ${_Retv} -eq 0 ]] ; then
        _PromptColor="\[\033[1;33m\]"
    else
        _PromptColor="\[\033[1;31m\]"
    fi
  export PS1="${_PromptColor}
[ Host: \H | Time: $(/bin/date '+%Y-%m-%d %H:%M:%S') | User: \u | Retv: \$? ]
[ Path: \w$(__git_ps1) ]
$ \[\033[0m\]"
}

PROMPT_COMMAND="custom_prompt_command"

# for rbenv
if [ -d $HOME/.rbenv/bin ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# For livetex
export MANPATH=$MANPATH:/usr/local/texlive/2012/texmf/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2012/texmf/doc/info
export PATH=/usr/local/texlive/2013/bin/i386-linux/:$PATH

# for JAVA
export JAVA_HOME=/home/yc/opt/jdk1.7
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=/home/yc/opt/android-sdk-linux

# PATH
export PATH=/home/yc/opt/Titanium_Studio:$PATH
export PATH=/home/yc/opt/apache-maven-3.0.5/bin:$PATH

# added by travis gem
source /home/yc/.travis/travis.sh

export NVM_DIR="/home/yc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
