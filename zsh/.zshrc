autoload -Uz vcs_info
precmd() { vcs_info }

autoload -Uz compinit
compinit

autoload -Uz colors
colors

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' formats ' %b%u'
zstyle ':completion:*' menu select

setopt PROMPT_SUBST
setopt MENU_COMPLETE
PROMPT='%B%F{green}┌───(%f%F{blue}%n@%m%f%F{green})-[%f%F{magenta}%2~%f%F{red}${vcs_info_msg_0_}%f%F{green}]
└─%f%F{blue}$%f %b'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

export EDITOR='nvim'
export DOTNET_ROOT=/opt/dotnet
export ANDROID_HOME=/opt/sdk
export JAVA_HOME=/opt/jdk21
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/jdk21/bin:$PATH
export PATH=/opt/node/bin:$PATH
export PATH=/opt/docker:$PATH
export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$HOME/.python/bin:$PATH
export _JAVA_AWT_WM_NONREPARENTING=1

alias ls='lsd'
# alias vim='nvim'

source $HOME/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
