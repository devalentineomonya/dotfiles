# ~/.bashrc - Bash Configuration
# CPHK3R Custom Configuration

# ============================================================
# 🎨 Greeting Function
# ============================================================
show_greeting() {
    # Set dark color (ANSI escape code)
    echo -ne '\x1b[38;5;16m'
    echo ''
    echo ' ██████╗██████╗ ██╗  ██╗██╗  ██╗██████╗ ██████╗'
    echo '██╔════╝██╔══██╗██║  ██║██║ ██╔╝╚════██╗██╔══██╗'
    echo '██║     ██████╔╝███████║█████╔╝  █████╔╝██████╔╝'
    echo '██║     ██╔══██╗╚════██║██╔═██╗  ╚═══██╗██╔══██╗'
    echo '╚██████╗██║  ██║     ██║██║  ██╗██████╔╝██║  ██║'
    echo ' ╚═════╝╚═╝  ╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝'
    echo ''
    echo '───────────────────────────────────────────────────────'
    echo '───────────────────────────────────────────────────────'
    # Reset color
    echo -ne '\x1b[0m'
}

# Show greeting for interactive shells
if [[ $- == *i* ]]; then
    show_greeting
fi

# ============================================================
# 🌐 Environment Variables
# ============================================================
export LANG=en_US.UTF-8

# Set editor based on SSH connection
if [ -n "$SSH_CONNECTION" ]; then
    export EDITOR=vim
else
    export EDITOR=nvim
fi

# ============================================================
# 📍 PATH Configuration
# ============================================================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/share/pnpm:$PATH"
export PATH="$HOME/.spicetify:$PATH"

# ============================================================
# 🎨 Prompt Configuration
# ============================================================
# Initialize Starship prompt if available
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# Foot terminal prompt marking
if [ "$TERM" = "foot" ]; then
    PS0='\[\e]133;A\e\\\]'
fi

# ============================================================
# 🔧 Tool Integrations
# ============================================================
# Direnv hook
if command -v direnv &> /dev/null; then
    eval "$(direnv hook bash)"
fi

# Zoxide (cd replacement)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash --cmd cd)"
fi

# ============================================================
# 📁 Directory Navigation Aliases
# ============================================================
alias deval='cd ~/Desktop/learningCoding/projects/devalProjects'
alias other='cd ~/Desktop/learningCoding/otherDevs'
alias hackathon='cd ~/Desktop/learningCoding/hackathon'
alias intern='cd ~/Desktop/learningCoding/attachmentsAndInternships'
alias projects='cd ~/Desktop/learningCoding/projects'
alias learn='cd ~/Desktop/learningCoding/learning'
alias client='cd ~/Desktop/learningCoding/clientsWork/'
alias csk='cd ~/Desktop/learningCoding/projects/cskWebApp'

# ============================================================
# 🧰 System Management Aliases
# ============================================================
alias reload='source ~/.bashrc'
alias cls='clear'
alias update='sudo apt update && sudo apt upgrade -y'
alias pcds='df -h'
alias memory='free -m'
alias runds='ollama run deepseek-r1'

# ============================================================
# 📂 File Listing Aliases
# ============================================================
# Use eza if available, otherwise use standard ls with colors
if command -v eza &> /dev/null; then
    alias ls='eza --icons --group-directories-first -1'
    alias ll='eza -la --icons --group-directories-first'
    alias la='eza -A --icons --group-directories-first'
    alias l='eza -CF --icons --group-directories-first'
else
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'
fi

alias grep='grep --color=auto'

# ============================================================
# 🧠 Git Aliases
# ============================================================
alias gs='git status'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gbm='git branch -M main'
alias gm='git merge'
alias gf='git fetch'
alias grb='git rebase'
alias gst='git stash'
alias gd='git diff'
alias glg='git log --graph --oneline --decorate'
alias gar='git remote add origin'
alias grr='git remote set-url'

# ============================================================
# 📦 NPM Aliases
# ============================================================
alias nps='npm start'
alias npd='npm run dev'
alias npt='npm test'
alias npi='npm install'
alias npb='npm run build'
alias npl='npm run lint'

# ============================================================
# 🚀 PNPM Aliases
# ============================================================
alias pns='pnpm start'
alias pnsd='pnpm start:dev'
alias pnd='pnpm dev'
alias pnt='pnpm test'
alias pni='pnpm install'
alias pna='pnpm add'
alias pnb='pnpm build'
alias pnl='pnpm lint'
alias pnx='pnpm dlx'
alias pnup='pnpm up'
alias png='pnpm add -g'

# ============================================================
# ⚡ Bun Aliases
# ============================================================
alias bns='bun start'
alias bnd='bun dev'
alias bnt='bun test'
alias bni='bun install'
alias bnb='bun build'
alias bnl='bun lint'
alias bnx='bunx'
alias bnr='bun run'

# ============================================================
# 🐳 Docker Aliases
# ============================================================
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dstart='docker start'
alias dstop='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'
alias dexec='docker exec -it'
alias dlogs='docker logs -f'
alias dprune='docker system prune -a'
alias ld='lazydocker'

# ============================================================
# 🐙 Docker Compose Aliases
# ============================================================
alias dc='docker compose'
alias dcb='docker compose build'
alias dcup='docker compose up'
alias dcupd='docker compose up -d'
alias dcdown='docker compose down'
alias dclog='docker compose logs'
alias dclogf='docker compose logs -f'
alias dce='docker compose exec'
alias dcrun='docker compose run'
alias dcps='docker compose ps'
alias dcrestart='docker compose restart'
alias dcpull='docker compose pull'
alias dckill='docker compose kill'

# ============================================================
# ⚓ Helm Aliases
# ============================================================
alias hi='helm install'
alias hu='helm upgrade'
alias hru='helm upgrade --install'
alias hls='helm list'
alias hlsn='helm list -n'
alias hdel='helm uninstall'
alias hdep='helm dependency update'
alias hval='helm show values'
alias htpl='helm template'
alias hhist='helm history'
alias hget='helm get all'
alias hlint='helm lint'

# ============================================================
# ☸️ Kubernetes (kubectl) Aliases
# ============================================================
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ke='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kr='kubectl rollout restart'
alias kctx='kubectl config use-context'
alias kcn='kubectl config set-context'
alias kcur='kubectl config current-context'
alias kns='kubectl config set-context --current --namespace'
alias kpf='kubectl port-forward'
alias kpfp='kubectl port-forward pod'
alias kpfsvc='kubectl port-forward svc'
alias kgsct='kubectl get secret'
alias kgcm='kubectl get configmap'
alias kdsc='kubectl describe secret'
alias kdcmp='kubectl describe configmap'
alias ktop='kubectl top pod'
alias ktd='kubectl top deployment'
alias krun='kubectl run debug --rm -i --tty --image=alpine -- bash'
alias kruncurl='kubectl run tmp-curl --rm -i --tty --image=curlimages/curl --'
alias kedit='kubectl edit'
alias kcnl='kubectl config set-context --current --namespace='
alias knsc='kubectl create namespace'
alias kcp='kubectl cp'

# ============================================================
# 🔍 Custom Functions
# ============================================================
vmrss_watch() {
    if [ -z "$1" ]; then
        echo "Usage: vmrss_watch <process_name>"
        return 1
    fi
    
    local pid=$(pgrep -f "$1" | head -n 1)
    if [ -z "$pid" ]; then
        echo "No process found for: $1"
        return 1
    fi
    
    echo "Monitoring PID $pid ($1)..."
    VMRSS_MONITOR=1 vmrss "$pid"
}

# ============================================================
# 📝 History Configuration
# ============================================================
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# ============================================================
# 🔧 Shell Options
# ============================================================
# Check window size after each command
shopt -s checkwinsize

# Enable extended globbing
shopt -s extglob

# Case-insensitive globbing
shopt -s nocaseglob

# Autocorrect typos in path names
shopt -s cdspell

# ============================================================
# 🎯 Completion
# ============================================================
# Enable programmable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# ============================================================
# 🔄 Source Custom Files
# ============================================================
# Source any custom bash scripts in ~/.config/bash/
if [ -d ~/.config/bash ]; then
    for file in ~/.config/bash/*.bash; do
        [ -r "$file" ] && source "$file"
    done
fi
