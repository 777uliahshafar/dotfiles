if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# I add code below by myself
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

# Colorized dir/ ls command

export CLICOLOR=1
export LSCOLORS=gxfxcxDxBxegedabagaced

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP


#Solved perl warning in ssh server
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Keybinding for zsh autosuggest
bindkey '^ ' autosuggest-accept

# Disable autosuggestion for large buffers
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Shortcuts
export LOCAL_IP=`ipconfig getifaddr en0`
alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

alias graph="git log --all --decorate --oneline --graph"
alias v="mvim -v"
alias compilescss="npm run scss"
alias ls="ls -G"

alias myh="cd ~/.vim/plugged/vim-myhelp/doc"
alias df="cd ~/git/dotfiles"
alias ww="vim -c VimwikiIndex"
alias wi="vim -c VimwikiDiaryIndex"

alias tt="cd /Volumes/hdd/tesis"
alias ks="cd /Volumes/hdd/kuesioner"
alias ip="cd /Volumes/hdd/sttblog/src/markdown"

# Configuration path PythonA
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"

# Adding autosuggestions in your Zsh shell.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
