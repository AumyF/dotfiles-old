#    ███████╗███████╗██╗  ██╗██████╗  ██████╗
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#      ███╔╝ ███████╗███████║██████╔╝██║     
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


# Alias which shows pretty directory tree
alias tree="exa --tree --classify --long --level 1 --time-style long-iso --git --header"

# Aliasses for WSL environments
alias pwsh="pwsh.exe"
alias cmd="cmd.exe"
alias wsl="wsl.exe"
alias clip="clip.exe"
alias open="pwsh.exe /c start" # Open url in default browser of Windows host

# added by Nix installer
if [ -e /home/u/.nix-profile/etc/profile.d/nix.sh ]; then . /home/u/.nix-profile/etc/profile.d/nix.sh; fi 

# Make `asdf help` working https://github.com/asdf-vm/asdf/issues/607
# . $brewprefix/opt/asdf/asdf.sh

# Change directory without `cd`
setopt auto_cd
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
# Don't save same command as recent to history
setopt hist_ignore_dups
# Share history across windows
setopt share_history
# Save blanks-reduced commandline
setopt hist_reduce_blanks
setopt inc_append_history

# Show directory tree after cd
chpwd() { tree }

# Cargo path
PATH=$HOME/.cargo/bin:$PATH


function add_completions () {
  fpath=(
    $HOME/.zfunc
    $fpath
  )
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


if [ "$(uname)" = "Linux" ]; then
  source ${HOME}/.zshrc-linux.sh
fi

if [ "$(uname)" = "Darwin" ]; then
  source ${HOME}/.zshrc-mac.sh
fi

brewprefix=$(brew --prefix)

# Show directory tree after starting shell
tree

# Launch starship
eval "$(starship init zsh)"

# Completion of GitHub CLI
eval "$(gh completion -s zsh)"





if type brew &>/dev/null; then
  FPATH=${brewprefix}/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
  
add_completions

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

