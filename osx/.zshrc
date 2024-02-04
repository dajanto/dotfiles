eval "$(/opt/homebrew/bin/brew shellenv)"
BREW_HOME=$(brew --prefix)
PATH="/opt/homebrew/opt/man-db/libexec/bin:$PATH"

autoload -Uz compinit && compinit

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


autoload colors; colors;
setopt prompt_subst
#
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

HISTFILE=~/.zsh_history
HISTSIZE=1000000
0SAVEHIST=1000000
setopt appendhistory

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

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

PROMPT='%{$bg[black]%}%{$fg[green]%}$USER%{$reset_color%}🌲$(dirs)$ '

alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -lah'
alias aptapt='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias sdsd='shutdown 0'
alias vim='nvim'
alias ga='git add -u; git commit -m "uwu"; git push'
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
alias cdwin='cd /mnt/c/Users/dajanto/'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="/snap/bin:$PATH"

# fortune | cowsay 
fortune | cowsay | lolcat
export EDITOR=nvim
# set -o vi

# git bash windows only
#function man {
#    local section=all
#    if [[ "$1" =~ ^[0-9]+$ ]]; then section="$1"; shift; fi
#    local doc="$(curl -v --silent --data-urlencode topic="$@" --data-urlencode section="$section" http://man.he.net/ 2>&1)"
#    local ok=$?
#    local pre="$(printf '%s' "$doc" | sed -ne "/<PRE>/,/<\/PRE>/ { /<PRE>/ { n; b; }; p }")"
#    [[ $ok -eq 0 && -n "$pre" ]] && printf '%s' "$pre" | less || printf 'Got nothing.\n' >&2
#    return $ok
#}
