# `00-` prefix forces this file to load first in ~/.zshrc's alphabetical loop
# (see the heredoc in install.sh). Instant prompt must run before anything
# else prints to stdout.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for p in \
    /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme \
    /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme \
    /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
    "$HOME/powerlevel10k/powerlevel10k.zsh-theme"; do
  [[ -f "$p" ]] && source "$p" && break
done

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
