# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="castle-black"
# ZSH_THEME="funky"
ZSH_THEME="xiong-chiamiov"

setopt extended_glob

# Example aliases
alias zshconf="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconf="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias tmuxreload="tmux source-file ~/.tmux.conf"
alias sshconf="vim ~/.ssh/config"
alias svim="sudo vim"
alias i3conf="vim ~/.i3/config"
# export JAVA_HOME=$(/usr/libexec/java_home)

#For linux distros. Force the current temrinal into 256 colors for airline themes
if [ "$TERM" = "xterm" ]
then
    export TERM=xterm-256color
fi
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode history-substring-search mvn)

source $ZSH/oh-my-zsh.sh

# Fix for history-substring-search bug (https://github.com/robbyrussell/oh-my-zsh/issues/1433)
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

# Customize to your needs...
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Add custom aliases
alias tmuxright='sh ~/.tmux/tmuxright.sh'
alias tmuxleft='sh ~/.tmux/tmuxleft.sh'

# Show slashes after ls directories
alias ls='ls -Gph'

# Grep history
alias hg='history | grep'

# Tmux use 256 colors
alias tmux='tmux -2'

# Make tmux play nice with oh-my-zsh
DISABLE_AUTO_TITLE=true

# Update to gruvbox color palette for each shell
~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh

# Use exuberant ctags over the GNU one that comes by default
export PATH="/usr/local/bin:$PATH"

# Cd aliases
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'

# Vi mode
set -o vi

# Don't enable 'clear', use ctrl-l instead
alias clear='echo "Dont use clear, use <ctrl-l> instead."'

alias avrotools='java -jar ~/Documents/avro-tools/avro-tools-1.7.6.jar'
alias avro2json='java -jar ~/Documents/avro-tools/avro-tools-1.7.6.jar tojson --pretty'

alias pxbl='beeline -u jdbc:hive2://wal1-clustera01:10000 -n aoneill --color=true --outputformat=vertical'
alias unzipall='for zip in *.zip;do mkdir -p ${zip%.zip};unzip $zip -d ${zip%.zip}; done'
alias ccrandpage='jot -r 1 1 900'
alias gtree='git log --graph --decorate --pretty=oneline --abbrev-commit'

# Add the following line to your ~/.bash_profile or ~/.zshrc file (and remember
# to source the file to update your current session):
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# ZSH autojump tab completion
autoload -U compinit && compinit
