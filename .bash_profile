#Alias List by permissions
alias code='coderay'
alias emacs='emacs -nw'
alias ls='ls --color'
alias emacs_start='emacs --daemon --eval "(server-start)"'
alias zepon='sudo docker start -a zeppelin'
alias zepoff='sudo docker stop zeppelin'
alias qtzon="grunt serve --scheme=http --hostname=localhost --verbose"

export CLICOLOR=1
#export LSCOLORS='BxFxCxDxBxegedabagacad'
export LSCOLORS='Gxfxcxdxdxegedabagacad'

#PROMPT_COMMAND=header_clock

#Custom Scipts Folder
export OH_MY_BASH=$HOME/.oh_my_bash/

#Set Xterm to use 256 color
export TERM=xterm-256color

#Setup Default Editor
export EDITOR='emacsclient -nw'

#Bash Enable Color prompt
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

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4000
HISTFILESIZE=8000

#LESSPIPE -- less file processing
eval "$(lesspipe)"

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s";
export LESS=" -R ";

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#Node Webkit
if [ -d "$HOME/opt/node-webkit" ]; then
    PATH="$PATH:$HOME/opt/node-webkit"
fi

#Bash Scripts Includer
source $OH_MY_BASH/includer.sh

#GVM Go version manager.
[[ -s "/home/pd/.gvm/scripts/gvm" ]] && source "/home/pd/.gvm/scripts/gvm"

#ADD Locla lib to LD LIBRARY PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

#Google Android SDK
if [ -d ${HOME}/Android/Sdk ]; then
    PATH="$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools"
fi

###-tns-completion-start-###
if [ -f /home/pd/.tnsrc ]; then
    source /home/pd/.tnsrc
fi
###-tns-completion-end-###

# The next line updates PATH for the Google Cloud SDK.
#source '/home/pd/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
#source '/home/pd/google-cloud-sdk/completion.bash.inc'

#Google App Engine SDK path.
export PATH=$PATH:$HOME/Development/go_appengine/

#HUGO Blog
export PATH=$PATH:$HOME/Development/hugo/

#Scala Home
export SCALA_HOME=/usr/local/src/scala/
export PATH=$SCALA_HOME/bin:$PATH

#Apache Spark
export SPARK_HOME=/usr/local/spark
export PATH=$SPARK_HOME/bin:$PATH

#Linux Brew Home
export PATH=~/.linuxbrew/bin:$PATH

#Maven Home
export MAVEN_HOME=/opt/maven 
export PATH=$MAVEN_HOME/bin:$PATH

# added by Miniconda2 3.18.3 installer
export PATH="/home/pd/miniconda2/bin:$PATH"

#EMSDK
source ~/Development/emsdk_portable/emsdk_env.sh > /dev/null

#Openshift
export PATH="~/Development/openshift:$PATH"

#GOPATH
export GOPATH="$HOME/Development/go"

#Swift path
export PATH=/home/pd/Development/swift/usr/bin:"${PATH}"

#JAVA HOME
export JAVA_HOME="/usr/"

#LD PATH for skype in 15.10 64bit
alias skype="LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu/ /usr/bin/skype"

#.bash_profile starts here above is copied from .bashrc
PS1="\[\$(tput setaf 147)\]\n\w\[\$(printf '\033[0m')\] [\[\$(tput setaf 196)\]\$(ruby_current version)\[\$(printf '\033[0m')\] \[\$(tput setaf 165)\]\$(ruby_current seperator)\[\$(printf '\033[0m')\] \[\$(tput setaf 10)\]\$(ruby_current gemset)\[\$(printf '\033[0m')\]]\n\[\$(tput setab 8)\]\[\033[1;37m\] \$(git_tree) \[\$(tput setaf 220)\]>\[\$(printf '\033[0m')\] "

###-tns-completion-start-###
if [ -f /home/pd/.tnsrc ]; then
    source /home/pd/.tnsrc
fi
###-tns-completion-end-###
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#XULRUNNER path
export PATH="$PATH:$HOME/Development/xulrunner"

#RbENV
eval "$(rbenv init -)"

#SCM PuFF
eval "$(scmpuff init -s)"
