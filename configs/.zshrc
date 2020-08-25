#    ███████╗███████╗██╗  ██╗██████╗  ██████╗
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#      ███╔╝ ███████╗███████║██████╔╝██║     
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


function launch_starship () {
  eval "$(starship init zsh)"
}

function add_aliases() {
  # ツリー表示
  alias tree="exa --tree --classify --long --level 1 --time-style long-iso --git --header"

  # Windowsのエイリアス
  alias pwsh="pwsh.exe"
  alias cmd="cmd.exe"
  alias wsl="wsl.exe"
  alias clip="clip.exe"
  alias rel="source ~/.zshrc"
  
}

# brewの補完
function brew_completion() {
  if type brew &>/dev/null; then
    FPATH=${brewprefix}/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
  fi
}

function github_completion() {
  # GitHub CLIの補完
  eval "$(gh completion -s zsh)"
}

function asdf_init () {
  # これがないとasdf helpが動かない https://github.com/asdf-vm/asdf/issues/607
  . $(brew --prefix asdf)/asdf.sh
}

function asdf_completion() {
  # asdfの補完
  fpath=(
    $(brew --prefix asdf)/etc/bash_completion.d
    $fpath
  )
}

function cargo_path () {
  PATH=$HOME/.cargo/bin:$PATH
}

function add_completions () {
  fpath=(
    $HOME/.zfunc
    $fpath
  )
}

function cargo_completion () {
  fpath=(
    $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/zsh/site-functions/_cargo
    $fpath
  )
}

function set_options () {
  setopt auto_cd # cd省略
  HISTFILE=~/.zsh-history
  HISTSIZE=10000
  SAVEHIST=10000
  setopt hist_ignore_dups # 直前と同じコマンドは履歴に入れない
  setopt share_history # 履歴を共有
  setopt hist_reduce_blanks # 余分な空白を削って履歴に記録
  setopt inc_append_history
}

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


######################################################

# brewprefix=$(brew --prefix)

if [ "$(uname)" = "Linux" ]; then
  source ${HOME}/.zshrc-linux.sh
fi

if [ "$(uname)" = "Darwin" ]; then
  source ${HOME}/.zshrc-mac.sh
fi


set_options
add_aliases

# cd後にツリー表示
chpwd() { tree }
tree

launch_starship

asdf_init

cargo_path
brew_completion
github_completion
add_completions
cargo_completion
asdf_completion

# zinit

zinit ice wait
zinit light zsh-users/zsh-autosuggestions

zinit ice wait
zinit light zdharma/fast-syntax-highlighting

zinit ice wait
zinit light zdharma/history-search-multi-word

zinit ice wait
zinit load zsh-users/zsh-completions

# 補完
autoload -Uz compinit && compinit
