# GoGuardian
export NE_OS_NAME=example

# tfenv needs Rosetta on Apple Silicon
if [[ "$(uname)" == "Darwin" ]] && [[ "$(uname -m)" == "arm64" ]]; then
  alias tfenv='arch -x86_64 tfenv'
fi

alias cdl="cd ~/liminex"
alias cde="cd ~/liminex/extensions"
alias cdm="cd ~/liminex/extensions/monitor"
alias cds="cd ~/liminex/extensions/shield"
