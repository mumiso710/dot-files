# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# for powerline
source ~/.zplug/init.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# plugins
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2  
zplug load


# alias
alias ls='eza --icons'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -lh'
alias la='ls -ah'
alias jn='jupyter notebook'
alias jl='jupyter lab'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'
alias cat='bat'
alias lg='lazygit'
alias oj='~/.venv/bin/oj t -d ./tests/'
alias clang++="clang++ -std=c++20"
alias cd="z"



# PROMPTに関する設定 参考(https://tomiylab.com/2020/03/prompt/)
autoload -Uz compinit && compinit  # 補完を有効化 -U はaliasに上書きされるのを防ぎ, -z はzsh形式での読み込みを指定 何も考えずに書いておくといい


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# for use openJKD@11
export JAVA_HOME=`/usr/libexec/java_home -v "17"`
PATH=$JAVA_HOME/bin:$PATH


# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source ~/fzf-git.sh/fzf-git.sh

# thefuck alias
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# bat setting
export BAT_THEME=Nord
