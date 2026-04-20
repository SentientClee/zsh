autoload -Uz add-zsh-hook

for p in \
    /opt/homebrew/opt/gitstatus/gitstatus.plugin.zsh \
    /usr/local/opt/gitstatus/gitstatus.plugin.zsh \
    /usr/share/gitstatus/gitstatus.plugin.zsh \
    "$HOME/gitstatus/gitstatus.plugin.zsh"; do
  [[ -f "$p" ]] && source "$p" && break
done

if typeset -f gitstatus_start >/dev/null; then
    gitstatus_stop 'MY' 2>/dev/null
    gitstatus_start 'MY'

    _update_git_info() {
        if ! gitstatus_query 'MY' || [[ $VCS_STATUS_RESULT != 'ok-sync' ]]; then
            GIT_INFO=""
            return
        fi
        local indicators=()
        (( VCS_STATUS_NUM_CONFLICTED )) && indicators+=("%F{red}✘${VCS_STATUS_NUM_CONFLICTED}%f")
        (( VCS_STATUS_NUM_STAGED     )) && indicators+=("%F{green}+${VCS_STATUS_NUM_STAGED}%f")
        (( VCS_STATUS_NUM_UNSTAGED   )) && indicators+=("%F{yellow}!${VCS_STATUS_NUM_UNSTAGED}%f")
        (( VCS_STATUS_NUM_UNTRACKED  )) && indicators+=("%F{blue}?${VCS_STATUS_NUM_UNTRACKED}%f")
        (( VCS_STATUS_STASHES        )) && indicators+=("%F{cyan}*${VCS_STATUS_STASHES}%f")
        (( VCS_STATUS_COMMITS_AHEAD  )) && indicators+=("%F{green}⇡${VCS_STATUS_COMMITS_AHEAD}%f")
        (( VCS_STATUS_COMMITS_BEHIND )) && indicators+=("%F{yellow}⇣${VCS_STATUS_COMMITS_BEHIND}%f")
        local branch="${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT[1,8]}}"
        GIT_INFO=" on %F{magenta}"$'\uE0A0'" ${branch}%f"
        (( ${#indicators} )) && GIT_INFO+=" ${(j: :)indicators}"
    }
    add-zsh-hook precmd _update_git_info
fi

_cmd_timer_preexec() {
    _cmd_timer=$SECONDS
}
_cmd_timer_precmd() {
    if (( _cmd_timer )); then
        local elapsed=$(( SECONDS - _cmd_timer ))
        (( elapsed >= 2 )) && CMD_TIME="%F{yellow}took ${elapsed}s%f" || CMD_TIME=""
        _cmd_timer=0
    else
        CMD_TIME=""
    fi
}
add-zsh-hook preexec _cmd_timer_preexec
add-zsh-hook precmd _cmd_timer_precmd

setopt prompt_subst
PROMPT='%F{cyan}%~%f${GIT_INFO} %(?.%F{green}.%F{red})❯%f '
RPROMPT='%(?..%F{red}%?%f )${CMD_TIME:+${CMD_TIME} }%F{244}%*%f'
