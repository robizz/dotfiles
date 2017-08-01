#bash completion script portin
#source /etc/bash_completion.d/git-promote-completion.bash

# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin:/home/rsora/code/utils
#add awscli path
export PATH=~/.local/bin:$PATH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="garage-bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(docker sublime ssh-agent virtualenvwrapper aws git git-flow zsh-syntax-highlighting brew repo sudo knife vagrant bundler web-search)

# set int_display for dpi config as default value
export DISPLAY_FONT_SETTINGS="int_display"
export CHROME_DEVICE_SCALE_FACTOR="1.8"


source $ZSH/oh-my-zsh.sh
# set mouse speed for t460p
xset m 2 2

# set modifier to enable vim navigation for kaysonic
xmodmap .Xmodmap

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

[[ -s "$HOME/code/utils" ]] && . "$HOME/code/utils"

# Shell Aliases
alias ll='ls -lahtr'
## Git Aliases
alias gs='git status '
alias gss='git fetch && git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

## Vagrant Aliases
alias vag='vagrant'
alias vagup='vagrant up'
alias vagdestroy='vagrant destroy'
alias vagssh='vagrant ssh'
alias vaghalt='vagrant halt'

## Miscellaneous Aliases
alias vpnrun='sh /home/rsora/Dropbox/forticlientsslvpn/fortisslvpn.sh &'
alias eclipse='eclipse &'
alias subl='st '
#alias sls170="~/code/projects/telecom/laboratorio_virtuale/node_modules/.bin/sls"
alias sls15="~/code/utils/node_modules/.bin/sls"
alias sls10="~/code/utils/serverless-1.10.0/node_modules/.bin/sls"
alias sls11="~/code/utils/serverless-1.11.0/node_modules/.bin/sls"
alias sls12="~/code/utils/serverless-1.12.1/node_modules/.bin/sls"
alias sls16="~/code/utils/serverless-1.16.1/node_modules/.bin/sls"
alias sls14="~/code/utils/serverless-1.14.0/node_modules/.bin/sls"
##proxy remove alias
#alias rmproxy='unset http_proxy; unset https_proxy; unset HTTP_PROXY; unset HTTPS_PROXY'

##tmux aliases
alias tmux='TERM=xterm-256color tmux'



##Audio alias
alias m='amixer sset Master toggle'

# Shell Functions
# remove proxy settings in 
rmproxy(){
    unset http_proxy
    unset https_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    sudo mv /etc/apt/apt.conf.d/80proxy /etc/apt/apt.conf.d.disabled
}

mkproxy(){
    #export reply proxy
    export http_proxy='http://proxy.reply.eu:8080'
    export https_proxy=${http_proxy}
    export HTTP_PROXY=${http_proxy}
    export HTTPS_PROXY=${https_proxy}
    sudo mv /etc/apt/apt.conf.d.disabled/80proxy /etc/apt/apt.conf.d
}

# change font to support external screen for daily work tools
edisp(){
	#env var setting to ext_display
	export DISPLAY_FONT_SETTINGS="ext_display"
	export CHROME_DEVICE_SCALE_FACTOR="1"
	# pycharm config
	cp -f ~/${DISPLAY_FONT_SETTINGS}/.PyCharm2016.2/config/options/*.xml ~/.PyCharm2016.2/config/options/	
	# terminal config
	gnome-terminal --tab-with-profile=${DISPLAY_FONT_SETTINGS}
}

idisp(){
	#env var setting to ext_display
	export DISPLAY_FONT_SETTINGS="int_display"
	export CHROME_DEVICE_SCALE_FACTOR="1.8"
	# pycharm config
	cp -f ~/${DISPLAY_FONT_SETTINGS}/.PyCharm2016.2/config/options/*.xml ~/.PyCharm2016.2/config/options/	
	# terminal config
	gnome-terminal --tab-with-profile=${DISPLAY_FONT_SETTINGS}
}

# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

awsexp () {
  	export AWS_ACCESS_KEY_ID=$1
 	export AWS_SECRET_ACCESS_KEY=$2
 	if [ ! -z "$3" ]
  	then
		export AWS_DEFAULT_REGION=$3
	fi
 	if [ ! -z "$4" ]
	then	
		export AWS_SESSION_TOKEN=$4
	fi
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

#export locale
export LC_ALL=en_US.UTF-8

#export reply proxy
export http_proxy='http://proxy.reply.eu:8080'
export https_proxy=${http_proxy}
export HTTP_PROXY=${http_proxy}
export HTTPS_PROXY=${https_proxy}

autoload -U +X bashcompinit && bashcompinit

#z command autoload
. ~/programs/z/z.sh

# create .Xdbus file in order to use keychain in cron to run awsadfs
# # in cron use 
# # source $HOME/.Xdbus; /usr/bin/offlineimap
if [ -f /home/rsora/code/utils/awsadfs/export_x_info.sh ]; then
  bash /home/rsora/code/utils/awsadfs/export_x_info.sh 
fi

# poor man cron tu run refresh credentials
#while true 
#do
#    nohup /usr/local/bin/awsadfs  --domain replyfed.reply.eu > /tmp/awsadfs.log 2>&1 &
#    sleep 3000
#done

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/rsora/code/utils/serverless-1.16.1/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/rsora/code/utils/serverless-1.16.1/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/rsora/code/utils/serverless-1.16.1/node_modules/tabtab/.completions/sls.zsh ]] && . /home/rsora/code/utils/serverless-1.16.1/node_modules/tabtab/.completions/sls.zsh
