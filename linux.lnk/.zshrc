fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
 autojump
 fzf
 git
 sudo
 zsh-cwd
 gcloud
)

source $ZSH/oh-my-zsh.sh

export AWS_REGION="eu-west-1"
eval "$(op completion zsh)"; compdef _op op
setopt HIST_IGNORE_SPACE
eval "$(direnv hook zsh)"

function sso() {
  if test $# -ne 1; then
    echo "Usage: $0 [env]"
    return
  fi
  export AWS_PROFILE="${1}"
  echo "Logging into ${AWS_PROFILE}"
  aws-sso-util login --profile $AWS_PROFILE
  eval $(aws configure export-credentials --format env)
}

# Java stuff
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export JUNIT_HOME="$HOME/java"
export DOTNET_HOME="/usr/local/share/dotnet"
export PATH="$PATH:$JUNIT_HOME:$DOTNET_HOME"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.13.2.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"

alias t=terraform
alias tg=terragrunt
alias tm=terramate
alias code=code-insiders

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias vi=nvim
export EDITOR=nvim
export VISUAL=nvim
cwd
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
alias ls='lsd'
alias lla='ls -la'
alias lt='ls --tree'
alias n='nvim'

# Toolbox
function is_toolbox() {
  if [ -f "/run/.toolboxenv" ]
  then
    TOOLBOX_NAME=$(cat /run/.containerenv | grep -oP "(?<=name=\")[^\";]+")
    echo "%F{blue}[%f%F{green}${TOOLBOX_NAME}%F{blue}]%f "
  fi
}
export PROMPT="$(is_toolbox)$PROMPT"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
