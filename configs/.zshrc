# cdの省略
setopt auto_cd

# ツリー表示
alias tree="exa --tree --classify --long --level 1 --time-style long-iso --git --header"

# Windowsのエイリアス
alias pwsh="pwsh.exe"
alias cmd="cmd.exe"
alias wsl="wsl.exe"
alias clip="clip.exe"

# cd後にツリー表示
chpwd() { tree }

# brewのパスを通す

if [ "$(uname)" = "Linux" ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi


# これがないとasdf helpが動かない https://github.com/asdf-vm/asdf/issues/607
. $(brew --prefix asdf)/asdf.sh

# asdfの補完 
fpath=(
  $(brew --prefix asdf)/etc/bash_completion.d
  $fpath
)

# starshipの初期化
eval "$(starship init zsh)"

# PWDのツリー表示
tree

# 補完
autoload -Uz compinit && compinit

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# zinit

zinit ice wait
zinit light zsh-users/zsh-autosuggestions

zinit ice wait
zinit light zdharma/fast-syntax-highlighting

zinit ice wait
zinit light zdharma/history-search-multi-word
