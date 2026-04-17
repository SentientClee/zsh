alias vim="nvim"

# cd into a bare path (enables the dot-expansion widget below)
setopt AUTO_CD

# Typing `...` expands to `../..`, `....` to `../../..`, etc.
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert

# git
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gb='git branch'

# ls
alias ls='eza --icons --group-directories-first --no-user'
alias l='eza -l --icons --group-directories-first --no-user'
alias la='eza -lA --icons --group-directories-first --no-user'

# grep
alias grep='grep --color=auto'

# cat -> bat
alias cat='bat --paging=never --style=plain'
