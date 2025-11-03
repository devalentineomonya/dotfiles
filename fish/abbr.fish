# ============================================================
# 📁 Directory Navigation
# ============================================================

abbr deval 'cd ~/Desktop/learningCoding/projects/devalProjects'
abbr other 'cd ~/Desktop/learningCoding/otherDevs'
abbr hackathon 'cd ~/Desktop/learningCoding/hackathon'
abbr intern 'cd ~/Desktop/learningCoding/attachmentsAndInternships'
abbr projects 'cd ~/Desktop/learningCoding/projects'
abbr learn 'cd ~/Desktop/learningCoding/learning'
abbr client 'cd ~/Desktop/learningCoding/clientsWork/'
abbr csk 'cd ~/Desktop/learningCoding/projects/cskWebApp'

# ============================================================
# 🧰 System Management
# ============================================================

abbr reload 'source ~/.config/fish/config.fish'
abbr cls 'clear'
abbr update 'sudo apt update && sudo apt upgrade -y'
abbr pcds 'df -h'
abbr memory 'free -m'
abbr runds 'ollama run deepseek-r1'

# ============================================================
# 📂 File Listing
# ============================================================

abbr ll 'ls -la'
abbr la 'ls -A'
abbr l 'ls -CF'
abbr grep 'grep --color=auto'

# ============================================================
# 🧠 Git Shortcuts
# ============================================================

abbr gs 'git status'
abbr gi 'git init'
abbr ga 'git add'
abbr gc 'git commit -m'
abbr gp 'git push'
abbr gl 'git pull'
abbr gco 'git checkout'
abbr gb 'git branch'
abbr gbm 'git branch -M main'
abbr gm 'git merge'
abbr gf 'git fetch'
abbr grb 'git rebase'
abbr gst 'git stash'
abbr gd 'git diff'
abbr glg 'git log --graph --oneline --decorate'
abbr gar 'git remote add origin'
abbr grr 'git remote set-url'

# ============================================================
# 📦 NPM Commands
# ============================================================

abbr nps 'npm start'
abbr npd 'npm run dev'
abbr npt 'npm test'
abbr npi 'npm install'
abbr npb 'npm run build'
abbr npl 'npm run lint'

# ============================================================
# 🚀 PNPM Commands
# ============================================================

abbr pns 'pnpm start'
abbr pnsd 'pnpm start:dev'
abbr pnd 'pnpm dev'
abbr pnt 'pnpm test'
abbr pni 'pnpm install'
abbr pna 'pnpm add'
abbr pnb 'pnpm build'
abbr pnl 'pnpm lint'
abbr pnx 'pnpm dlx'
abbr pnup 'pnpm up'
abbr png 'pnpm add -g'

# ============================================================
# ⚡ Bun Commands
# ============================================================

abbr bns 'bun start'
abbr bnd 'bun dev'
abbr bnt 'bun test'
abbr bni 'bun install'
abbr bnb 'bun build'
abbr bnl 'bun lint'
abbr bnx 'bunx'
abbr bnr 'bun run'

# ============================================================
# 🐳 Docker Commands
# ============================================================

abbr d 'docker'
abbr di 'docker images'
abbr dps 'docker ps'
abbr dpsa 'docker ps -a'
abbr dstart 'docker start'
abbr dstop 'docker stop'
abbr drm 'docker rm'
abbr drmi 'docker rmi'
abbr dexec 'docker exec -it'
abbr dlogs 'docker logs -f'
abbr dprune 'docker system prune -a'
abbr ld 'lazydocker'

# ============================================================
# 🐙 Docker Compose
# ============================================================

abbr dc 'docker compose'
abbr dcb 'docker compose build'
abbr dcup 'docker compose up'
abbr dcupd 'docker compose up -d'
abbr dcdown 'docker compose down'
abbr dclog 'docker compose logs'
abbr dclogf 'docker compose logs -f'
abbr dce 'docker compose exec'
abbr dcrun 'docker compose run'
abbr dcps 'docker compose ps'
abbr dcrestart 'docker compose restart'
abbr dcpull 'docker compose pull'
abbr dckill 'docker compose kill'

# ============================================================
# ⚓ Helm Commands
# ============================================================

abbr hi 'helm install'
abbr hu 'helm upgrade'
abbr hru 'helm upgrade --install'
abbr hls 'helm list'
abbr hlsn 'helm list -n'
abbr hdel 'helm uninstall'
abbr hdep 'helm dependency update'
abbr hval 'helm show values'
abbr htpl 'helm template'
abbr hhist 'helm history'
abbr hget 'helm get all'
abbr hlint 'helm lint'

# ============================================================
# ☸️ Kubernetes (kubectl)
# ============================================================

abbr k 'kubectl'
abbr kg 'kubectl get'
abbr kgp 'kubectl get pods'
abbr kgs 'kubectl get svc'
abbr kgd 'kubectl get deployments'
abbr kgn 'kubectl get nodes'
abbr kgns 'kubectl get namespaces'
abbr kd 'kubectl describe'
abbr kdp 'kubectl describe pod'
abbr kdd 'kubectl describe deployment'
abbr kl 'kubectl logs'
abbr klf 'kubectl logs -f'
abbr ke 'kubectl exec -it'
abbr kaf 'kubectl apply -f'
abbr kdf 'kubectl delete -f'
abbr kr 'kubectl rollout restart'
abbr kctx 'kubectl config use-context'
abbr kcn 'kubectl config set-context'
abbr kcur 'kubectl config current-context'
abbr kns 'kubectl config set-context --current --namespace'
abbr kpf 'kubectl port-forward'
abbr kpfp 'kubectl port-forward pod'
abbr kpfsvc 'kubectl port-forward svc'
abbr kgsct 'kubectl get secret'
abbr kgcm 'kubectl get configmap'
abbr kdsc 'kubectl describe secret'
abbr kdcmp 'kubectl describe configmap'
abbr ktop 'kubectl top pod'
abbr ktd 'kubectl top deployment'
abbr krun 'kubectl run debug --rm -i --tty --image=alpine -- bash'
abbr kruncurl 'kubectl run tmp-curl --rm -i --tty --image=curlimages/curl --'
abbr kedit 'kubectl edit'
abbr kcnl 'kubectl config set-context --current --namespace='
abbr knsc 'kubectl create namespace'
abbr kcp 'kubectl cp'

# =======================================================
# Other Proograms
# =======================================================
abbr vlc "flatpak run org.videolan.VLC $1 &"

