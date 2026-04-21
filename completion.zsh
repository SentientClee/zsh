autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# gsw (git switch wrapper in aliases.zsh): complete only local branches.
# Fuzzy picker (no-args path in gsw) shows remotes too; tab is intentionally narrower.
_gsw() {
    local branches
    branches=(${(f)"$(git for-each-ref --format='%(refname:short)' refs/heads/ 2>/dev/null)"})
    _describe 'local branch' branches
}
compdef _gsw gsw

bindkey '^[[Z' reverse-menu-complete
