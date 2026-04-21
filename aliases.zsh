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
# git switch wrapper. No args → fzf picker over local + remote branches,
# locals listed first so they appear nearest the cursor (fzf's default
# layout puts first input items at the bottom, closest to the prompt).
# Dedups remotes whose name matches a local branch. DWIM creates a local
# tracking branch when a remote-only name is picked.
gsw() {
    if (( $# == 0 )); then
        local branch=$(
            {
                git for-each-ref --format='%(refname:short)' refs/heads/ 2>/dev/null | sort
                git for-each-ref --format='%(refname:lstrip=3)' refs/remotes/ 2>/dev/null | grep -v '^HEAD$' | sort -u
            } | awk '!seen[$0]++' | fzf
        ) || return
        set -- "$branch"
    fi
    git switch "$@"
}

# ls
alias ls='eza --icons --group-directories-first --no-user'
alias l='eza -l --icons --group-directories-first --no-user'
alias la='eza -lA --icons --group-directories-first --no-user'

# grep
alias grep='grep --color=auto'

# cat -> bat
alias cat='bat --paging=never --style=plain'
