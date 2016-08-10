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
if [ -d /usr/local/texlive/2016 ]; then
    export INFOPATH=$INFOPATH:/usr/local/texlive/2016/texmf-dist/doc/info
    export MANPATH=$MANPATH:/usr/local/texlive/2016/texmf-dist/doc/man
    export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-linux
fi

# # for JAVA
# export JAVA_HOME=/home/yc/opt/jdk1.7
# export PATH=$JAVA_HOME/bin:$PATH
# export ANDROID_HOME=/home/yc/opt/android-sdk-linux

# # PATH
# export PATH=/home/yc/opt/Titanium_Studio:$PATH
# export PATH=/home/yc/opt/apache-maven-3.0.5/bin:$PATH

# for Travis CI
if [ -d ~/.travis ]; then
    source ~/.travis/travis.sh
fi

# export NVM_DIR="/home/yc/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if command -v hub > /dev/null; then
  eval "$(hub alias -s)"
fi
