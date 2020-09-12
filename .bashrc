# Bash Configuration file
# Alistair Mcintyre 2019

# If this isn't an interactive shell we don't need any of this.
case $- in
    *i*) ;;
      *) return;;
esac

# Eternal bash history.
# ---------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# Remove duplicate lines or lines starting with spaces from bash history.
export HISTCONTROL=ignoreboth:erasedups

# Undocumented feature which sets the size to "unlimited".
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%F %T"
# Change the file location because certain bash sessions truncate .bash_history file upon close.
export HISTFILE=~/.bash_eternal_history

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes

# Powerline Configuration
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bindings/bash/powerline.sh
fi

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more useful ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Adding my own bin folder to PATH.
export PATH=$PATH:~/bin/

# Dart Binaries
export PATH=$PATH:/usr/lib/dart/bin
export PATH=$PATH:~/.pub-cache/bin

# Various Git functions & aliases
alias gityolo='git commit --amend --no-edit && git push --force'
alias gitallthebranches='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'

function newgitbranch() {
    git branch $1 && git checkout $1 && git push -u origin $1
}

### DOCKER

function docker_clean() {
    # $1 = an image name
    docker images | grep $1 | awk '{ print $2; }' | xargs -t -i docker image rm ${1}:{}
}

if [[ -f /home/${USER}/.${HOSTNAME}rc ]]
then
  source /home/${USER}/.local-bashrc
fi
