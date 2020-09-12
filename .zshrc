# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alistairmcintyre/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions docker)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#ZLE_RPROMPT_INDENT=0

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias gityolo='git commit --amend --no-edit && git push --force'
alias gitallthebranches='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'

alias bastion='ssh -L 127.0.0.1:8888:localhost:8888 -J wlg-bounce.wgtn.cat-it.co.nz'
alias st-bastion='bastion cat-giscore-staging-mgmt1'
alias prod-bastion='bastion cat-giscore-prod-mgmt1'


alias pview='echo "n" | ssh -J wlg-bounce.wgtn.cat-it.co.nz cat-prod-secret pview'
alias kube-ctx='kubectl config use-context'
alias kube-ctx-st='kube-ctx cat-giscore-staging1-super-admin'
alias kube-ctx-prod='kube-ctx cat-giscore-prod1-super-admin'

alias kube-proxy='export HTTP_PROXY=localhost:8888'


function newgitbranch() {
    git branch $1 && git checkout $1
}
