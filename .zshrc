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

#
# Alias
#

alias ls="ls -G"
alias l="ls -laG"
alias tt="tmux"

#
# Zsh option
#
setopt promptsubst
setopt autocd
setopt auto_list
setopt auto_pushd
setopt hash_list_all
setopt completealiases
setopt always_to_end
setopt hist_expand
setopt append_history

#
# Function
#
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

#
# Plugins
#

zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" atpull'%atclone' pick"clrs.zsh"
zplugin load trapd00r/LS_COLORS

zplugin light changyuheng/zsh-interactive-cd

zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

#
# Snippet
#

# NOP

#
# oh-my-zsh
#

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
zplugin snippet OMZ::lib/misc.zsh
zplugin snippet OMZ::lib/prompt_info_functions.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin cdclear -q
zplugin snippet OMZ::plugins/github/github.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

#
# Completion
#

# zsh
zplugin ice wait"0" blockf lucid
zplugin light zsh-users/zsh-completions

zplugin light zdharma/fast-syntax-highlighting

#
# History
#

# NOP

#
# Theme
#

zplugin env-whitelist 'POWERLEVEL9K_*'
zplugin ice atinit"config_powerline_prompt"; zplugin light romkatv/powerlevel10k

### Added by Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
### End of Powerlevel10k

