### Added by Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
### End of Powerlevel10k

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# zsh options
export ZSH_DISABLE_COMPFIX=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:"

autoload -Uz compaudit 
autoload -Uz compinit
autoload -Uz colors

setopt auto_list 
setopt auto_menu
setopt list_packed
setopt list_types
setopt auto_cd

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Alias
alias tt="tmux"
alias ls="lsd"
alias l="lsd -la"
alias ll="lsd -l"

# Function

# theme_default() {
# }
#

config_powerline_prompt() {
  # theme_default
}


ttn() {
  tt new -s $1
}

tta() {
  tt a -t $1
}

ttd() {
  tt kill-session -t $1
}

# Plugins
zplugin light changyuheng/zsh-interactive-cd

zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions

zplugin snippet OMZ::lib/bzr.zsh
zplugin snippet OMZ::lib/clipboard.zsh
zplugin snippet OMZ::lib/compfix.zsh
zplugin snippet OMZ::lib/completion.zsh
zplugin snippet OMZ::lib/correction.zsh
zplugin snippet OMZ::lib/diagnostics.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::lib/grep.zsh
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/misc.zsh
zplugin snippet OMZ::lib/prompt_info_functions.zsh
zplugin snippet OMZ::lib/spectrum.zsh
zplugin snippet OMZ::lib/termsupport.zsh
zplugin snippet OMZ::lib/theme-and-appearance.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin cdclear -q
zplugin snippet OMZ::plugins/github/github.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zplugin light zdharma/fast-syntax-highlighting

zplugin env-whitelist 'POWERLEVEL9K_*'
zplugin ice atinit"config_powerline_prompt"; zplugin light romkatv/powerlevel10k

### Added by Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
### End of Powerlevel10k

