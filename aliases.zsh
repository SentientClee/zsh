alias vim="nvim"
alias cdl="cd ~/liminex"
alias cde="cd ~/liminex/extensions"
alias cdm="cd ~/liminex/extensions/monitor"
alias cds="cd ~/liminex/extensions/shield"

# tfenv needs Rosetta on Apple Silicon
if [[ "$(uname)" == "Darwin" ]] && [[ "$(uname -m)" == "arm64" ]]; then
  alias tfenv='arch -x86_64 tfenv'
fi

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
alias cat='bat --paging=never'
