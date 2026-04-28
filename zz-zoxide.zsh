# Loaded last (zz- prefix) so zoxide's precmd hook is registered after
# prompt.zsh's hooks — keeps `zoxide doctor` quiet.
eval "$(zoxide init zsh --cmd cd)"
