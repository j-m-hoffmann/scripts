alias ..='cd ..'
alias -- -='cd -'

#https://zwischenzugs.com/2015/07/01/bash-shortcuts-gem/
alias binds='bind -P | grep "can be" | less' 
#alias binds="stty -a | awk 'BEGIN{RS=\"[;n]+ ?\"}; /= ..$/'"

alias cat='bat --theme "Solarized (light)"'

# alias du='ncdu --exclude .git'
# alias du="sn p --exclude '\.git'"
alias du="sn o"
alias du.='sn o -d=1'
# alias du.='du -h --max-depth=1'

alias grep='rg'

# git
alias gad='git add'
alias gam='git commit -am'
alias gbr='git checkout -b'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gdi='git diff'
alias glpo='git log --pretty=oneline'
alias gpom='git push origin master'
alias gpu='git push'
alias grm='git rm'
alias gst='git status'

alias l='exa'
alias ll='exa -al'
alias la='exa -a'
alias l.='exa -d .*'

alias nv='nvim'
alias nvrc='nvim ~/.config/nvim/init.vim'

# package management
alias pcl='sudo apt autoremove && sudo apt autoclean'
alias pco='sudo nvim /etc/apt/sources.list'
alias pin='sudo apt install'
alias pli='apt list -a'
alias pre='sudo apt remove'
alias pup='sudo apt update && sudo apt upgrade'
alias pui='sudo apt update && sudo apt install'

# system files
alias als='$EDITOR ~/.bash_aliases && source ~/.bash_aliases'
alias bpr='$EDITOR ~/.bash_profile && source ~/.bash_profile'
alias egr='sudo $EDITOR /etc/default/grub && sudo update-grub'
alias fst='sudo $EDITOR /etc/fstab'
alias pro='$EDITOR ~/.profile && source ~/.profile'

alias stpg='sudo -u postgres psql'

# alias sv='/usr/bin/vim.basic'
alias svrc='$EDITOR ~/.SpaceVim.d/init.toml'

alias vi='/usr/bin/vim.basic'
alias vrc='vim ~/.vimrc'
