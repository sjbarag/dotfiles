# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|alacritty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -x /opt/homebrew/bin/brew ] && PATH="/opt/homebrew/bin:${PATH}"
BREW_PREFIX=$(brew --prefix)
# install all bash completions, via https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash
if type brew &>/dev/null
then
  if [[ -r "${BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${BREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# add llvm tools
PATH="$BREW_PREFIX/opt/llvm/bin:$PATH"

# add cargo/rust/rustup
PATH="$HOME/.cargo/bin:$PATH"

# set a GOPATH for go dependencies & binaries to go to
export GOPATH="$HOME"

# and add golang binaries to PATH
PATH="$PATH:$(go env GOPATH)/bin"

# Add n (for nodejs version management)
export N_PREFIX="$HOME/.local/share/n"
PATH="${N_PREFIX}/bin:$PATH"

# use helix as much as possible
export EDITOR=hx

# work stuff!
[ -f ~/.config/bash/work.sh ] && source ~/.config/bash/work.sh

command -v fd > /dev/null
if [ $? ]; then
  export FZF_DEFAULT_COMMAND="fd --type f"
  export FZF_CTRL_T_COMMAND="fd"
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add yarn and yarn-installed binaries to PATH
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export BAT_THEME=ansi

if [[ -z "$TMUX" ]]; then
    export PATH
fi

eval "$(starship init bash)"
eval "$(zoxide init bash)"
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/barag/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"

export ATUIN_ARROW_INDEX=-1
export ATUIN_CYCLE_MODE=0
__atuin__up_arrow() {
  if [[ $ATUIN_CYCLE_MODE -eq 0 && -n "$READLINE_LINE" ]]; then
    # execute traditional atuin_history up arrow function, interactive backwards prefix search or whatever
    __atuin_history --shell-up-key-binding
    return
  fi

  export ATUIN_ARROW_INDEX=$(( ATUIN_ARROW_INDEX + 1))
  export ATUIN_CYCLE_MODE=1

  HISTORY=$(atuin search --cmd-only --filter-mode host --limit 1 --offset $ATUIN_ARROW_INDEX)
  READLINE_LINE=${HISTORY}
  READLINE_POINT=${#READLINE_LINE}

  return
}

__atuin__down_arrow() {
  export ATUIN_ARROW_INDEX=$(( ATUIN_ARROW_INDEX - 1))
  if [[ $ATUIN_ARROW_INDEX -lt 0 ]]; then
    __atuin__reset_arrow
    HISTORY=""
  else
    HISTORY=$(atuin search --cmd-only --filter-mode host --limit 1 --offset $ATUIN_ARROW_INDEX)
  fi
  READLINE_LINE=${HISTORY}
  READLINE_POINT=${#READLINE_LINE}

  return
}

__atuin__reset_arrow() {
  export ATUIN_ARROW_INDEX=-1
  export ATUIN_CYCLE_MODE=0
}

bind -x '"\e[A": __atuin__up_arrow'
bind -x '"\eOA": __atuin__up_arrow'
bind -x '"\e[B": __atuin__down_arrow'
bind -x '"\eOB": __atuin__down_arrow'
precmd_functions+=(__atuin__reset_arrow)
