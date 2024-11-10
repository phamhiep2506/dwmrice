autoload -U compinit
compinit
zstyle ":completion:*" menu select

eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship.toml

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export EDITOR="nvim"
export DOTNET_ROOT=/opt/dotnet
export ANDROID_HOME=/opt/sdk
export JAVA_HOME=/opt/jdk
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/jdk/bin:$PATH
export PATH=/opt/node/bin:$PATH
export PATH=/opt/docker:$PATH
export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$HOME/.python/bin:$PATH
export _JAVA_AWT_WM_NONREPARENTING=1

alias ls="lsd"
alias vim="nvim"

source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
