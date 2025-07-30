# Bootstrap homebrew on macOS only.
if [[ $(uname) = "Darwin" ]]; then
  BREW_PREFIX=/opt/homebrew
  eval "$($BREW_PREFIX/bin/brew shellenv)"
fi

# Enable ^x^e to edit the current line in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

path=("$HOME/.cargo/bin" "$HOME/.atuin/bin/" $path)

# Disable a few beeps, but allow 'tput bel' to beep on-demand.
setopt NO_BEEP
setopt NO_HIST_BEEP
setopt NO_LIST_BEEP

# Use helix as the global editor
if command -v hx > /dev/null; then
  export EDITOR=hx
fi

# Use terminal colors for bat.
export BAT_THEME=ansi

# Enable completions
autoload -Uz compinit
compinit

# Load zoxide for directory jumping.
command -v zoxide > /dev/null && eval "$(zoxide init zsh)"

# Use mise for tool versioning (beyond standard work tools).
# This is mostly to provide support for global tools installed with language-specific toolchains,
# e.g. 'npm install -g (...)' or 'go install (...)'
command -v mise > /dev/null && eval "$(mise activate zsh)"

[[ -r ~/.config/zsh/work.sh ]] && source ~/.config/zsh/work.sh

FD_COMMAND=fdfind
if [[ $(uname) = "Darwin" ]]; then
  FD_COMMAND=fd
fi
# Bootstrap fzf+zsh shell integration, using fd for file discover.
if command -v fzf > /dev/null; then
  export FZF_DEFAULT_COMMAND="$FD_COMMAND --type f"
  export FZF_CTRL_T_COMMAND="FD_COMMAND"
  source <(fzf --zsh)
fi

# Load atuin for shell history.
command -v atuin > /dev/null && eval "$(atuin init zsh)"

# Load starship for prompt.
command -v starship > /dev/null && eval "$(starship init zsh)"
