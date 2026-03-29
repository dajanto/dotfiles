# ============================================================
# PATH
# ============================================================
export PATH="$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH"

# ============================================================
# Homebrew
# ============================================================
export HOMEBREW_NO_ENV_HINTS=1

case "$OSTYPE" in
  darwin*)
    eval "$(/opt/homebrew/bin/brew shellenv)" ;;
  linux*)
    export PATH="/snap/bin:$PATH"
    [ -d /home/linuxbrew/.linuxbrew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" ;;
esac

# ============================================================
# NVM
# ============================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ============================================================
# Not interactive?
# ============================================================
[[ -o interactive ]] || return

# ============================================================
# Completion
# ============================================================
autoload -Uz compinit && compinit

# ============================================================
# History
# ============================================================
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ============================================================
# Prompt
# ============================================================
autoload -U colors && colors
setopt prompt_subst
PROMPT='%{$bg[black]%}%{$fg[green]%}$USER%{$reset_color%}🌲$(dirs)$ '

# ============================================================
# Editor
# ============================================================
export EDITOR=nvim

# ============================================================
# Aliases
# ============================================================
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -lah'
alias aptapt='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias sdsd='shutdown 0'
alias vim='nvim'
alias ga='git add -u; git commit -m "Fix me up later please"; git push'
alias dd='docker-compose down && docker-compose build && docker-compose up -d'
alias gm='git commit -am'
alias gc='git commit'
alias gap='git add -p'
alias gcp='git commit -p'
alias gp='git push'
alias gpt='git push --follow-tags'
alias gptt='git push --tags'
alias gpf='git push --force-with-lease'
alias gpff='git push -f'
alias gs='git status'
alias gst='git switch'
alias gstm='git switch master'
alias gstmm='git switch main'
alias gsl='git stash list'
alias gsa='git stash apply'
alias pa='php artisan'
alias pat='php artisan tinker'
alias pam='php artisan migrate'
alias pamr='php artisan migrate:rollback'
alias pao='php artisan optimize'
alias paoc='php artisan optimize:clear'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias gsw='git show -w'
alias gl='git log --color --first-parent --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -- | head -n 11'
alias gll='git log --color --first-parent --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias glt='git log --color --first-parent --graph --date=format:"%Y-%m-%d, %H:%M" --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr,%Creset %C(yellow)%ad%Creset) %C(bold blue)<%an>%Creset" --abbrev-commit -- | head -n 11'
alias gltt='git log --color --first-parent --graph --date=format:"%Y-%m-%d, %H:%M" --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr,%Creset %C(yellow)%ad%Creset) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias glo='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -- | head -n 11'
alias gloo='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gu='git pull'
alias g='git'
alias c='clear'
alias cleanit='git clean -ffxd -e .env --dry-run'
alias cleanitnow='git clean -ffxd -e .env'
alias grh='git reset --hard'
alias gri='git rebase -i'
alias grs='git restore'
alias grsp='git restore -p'
alias gsp='git stash pop'
alias gss='git stash'
alias gt='git tag'
alias gta='git tag -a'
alias gf='git flow'
alias gfi='git flow init'
alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'
alias gmm='git merge'
alias gms='git merge --squash'
alias gb='git branch'
alias cdwin='cd /mnt/c/Users/dajanto/'
alias grp='grep -ir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ut='uptime'
alias nf='neofetch'
alias history='history 0'
alias cppw='pwd | xclip -selection clipboard'

# ============================================================
# Functions
# ============================================================
mkcd () {
  \mkdir -p "$1"
  cd "$1"
}

# ============================================================
# Tools
# ============================================================
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# ============================================================
# Greeting
# ============================================================
(( $+commands[fortune] )) && (( $+commands[cowsay] )) && (( $+commands[lolcat] )) && fortune | cowsay | lolcat
