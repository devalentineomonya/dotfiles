# ============================================================
# Directory Navigation Aliases
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
# System Management Aliases
# ============================================================
alias reload='source ~/.zshrc'
alias cls='clear'
alias update='sudo pacman -Syu'
alias pcds='df -h'
alias mem='free -m'
alias vim=nvim
alias vi="nvim"
alias v="nvim"

# ============================================================
# File Listing Aliases
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
# Git Aliases
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
# ============================================================
alias nps='npm start'
alias npd='npm run dev'
alias npt='npm test'
alias npi='npm install'
alias npb='npm run build'
alias npl='npm run lint'

# ============================================================
#  PNPM Aliases
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
#  Bun Aliases
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
#  Docker Aliases
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
#  Docker Compose Aliases
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
#  Helm Aliases
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
#  Kubernetes (kubectl) Aliases
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

# =======================================================
# Other Prgrams
# ======================================================
alias vlc="flatpak run org.videolan.VLC $1 &"
