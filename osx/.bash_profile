eval "$(/opt/homebrew/bin/brew shellenv)"
BREW_HOME=$(brew --prefix)
PATH="/opt/homebrew/opt/man-db/libexec/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# most programs
export PATH="${BREW_HOME}/bin:$PATH"
export MANPATH="${BREW_HOME}/share/man:$MANPATH"
export INFOPATH="${BREW_HOME}/share/info:$INFOPATH"

# coreutils
export PATH="${BREW_HOME}/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="${BREW_HOME}/opt/coreutils/libexec/gnuman:$MANPATH"

# make
export PATH="${BREW_HOME}/opt/make/libexec/gnubin:$PATH"
export MANPATH="${BREW_HOME}/opt/make/libexec/gnuman:$MANPATH"

# m4
export PATH="${BREW_HOME}/opt/m4/bin:$PATH"

# file-formula
export PATH="${BREW_HOME}/opt/file-formula/bin:$PATH"

# unzip
export PATH="${BREW_HOME}/opt/unzip/bin:$PATH"

# python
export PATH="${BREW_HOME}/opt/python/libexec/bin:$PATH"

# flex
export PATH="${BREW_HOME}/opt/flex/bin:$PATH"
export LDFLAGS="-L${BREW_HOME}/opt/flex/lib"
export CPPFLAGS="-I${BREW_HOME}/opt/flex/include"

# bison
export PATH="${BREW_HOME}/opt/bison/bin:$PATH"
export LDFLAGS="-L${BREW_HOME}/opt/bison/lib"

# libressl
export PATH="${BREW_HOME}/opt/libressl/bin:$PATH"
export LDFLAGS="-L${BREW_HOME}/opt/libressl/lib"
export CPPFLAGS="-I${BREW_HOME}/opt/libressl/include"
export PKG_CONFIG_PATH="${BREW_HOME}/opt/libressl/lib/pkgconfig"

# ed
export PATH="${BREW_HOME}/opt/ed/libexec/gnubin:$PATH"

# findutils
export PATH="${BREW_HOME}/opt/findutils/libexec/gnubin:$PATH"

# gnu-indent
export PATH="${BREW_HOME}/opt/gnu-indent/libexec/gnubin:$PATH"

# gnu-sed
export PATH="${BREW_HOME}/opt/gnu-sed/libexec/gnubin:$PATH"

# gnu-tar
export PATH="${BREW_HOME}/opt/gnu-tar/libexec/gnubin:$PATH"

# gnu-which
export PATH="${BREW_HOME}/opt/gnu-which/libexec/gnubin:$PATH"

# grep
export PATH="${BREW_HOME}/opt/grep/libexec/gnubin:$PATH"
alias grep="grep --color=auto"

unset BREW_HOME

#
#
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
# old
#HISTSIZE=10000
#HISTFILESIZE=20000
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]🌲:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\e[32;40m\]\u\[\e[m\]🌲\w\[\033[00m\]\$ ' 
    #PS1='\[\e[32;40m\]\u\[\e[m\]🌲\[\e[36m\]\\$\[\e[m\]\w/ ' 
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h🌲:\w\$ '
    #PS1='\[\e[32;40m\]\u\[\e[m\]🌲\[\e[36m\]\\$\[\e[m\]\w/ '
    PS1='\[\e[32;40m\]\u\[\e[m\]🌲\w\[\033[00m\]\$ ' 
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #PS1='\[\e[32;40m\]\u\[\e[m\]🌲\[\e[36m\]\\$\[\e[m\]\w/ ' 
    PS1='\[\e[32;40m\]\u\[\e[m\]🌲\w\[\033[00m\]\$ ' 
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -lah'
alias aptapt='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias sdsd='shutdown 0'
alias ga='git add -u; git commit -m "uwu"; git push'
alias vim='nvim'
alias dd='docker-compose down && docker-compose build && docker-compose up -d'
alias gm='git commit -am'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gst='git switch'
alias gd='git diff -w'
alias gsw='git show -w'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gpu='git pull'
alias g='git'
alias c='clear'
alias grh='git reset --hard'
alias gsp='git stash pop'
alias gss='git stash'
alias gmm='git merge'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set -o vi

# fortune | cowsay 
fortune | cowsay | lolcat
export EDITOR=nvim
