# ============================================================
# 🔌 Plugin Manager (zinit)
# ============================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
# ============================================================
# 🎨 Prompt Configuration (Load early)
# ============================================================
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
if [ "$TERM" = "foot" ]; then
    precmd() {
        print -Pn "\e]133;A\e\\"
    }
fi
if [ -z "$TMUX" ] && [ -f ~/.local/state/caelestia/sequences.txt ]; then
    cat ~/.local/state/caelestia/sequences.txt
fi
# ============================================================
# 🔌 Zsh Plugins
# ============================================================
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-history-substring-search
zinit light hlissner/zsh-autopair
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use
# ============================================================
# 🎨 Oh-My-Zsh Plugins (optional)
# ============================================================
zinit snippet OMZP::git
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::kubectl
zinit snippet OMZP::helm
zinit snippet OMZP::npm
zinit snippet OMZP::command-not-found
# ============================================================
# 🌐 Environment Variables
# ============================================================
export LANG=en_US.UTF-8
# ============================================================
# 📍 PATH Configuration
# ============================================================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/share/pnpm:$PATH"
export PATH="$HOME/.spicetify:$PATH"
# ============================================================
# 🔧 Tool Integrations
# ============================================================
if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh --cmd cd)"
fi
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)"
fi
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
pagesize_uncomp() {
  local url="$1"
  [[ -z "$url" ]] && echo "Usage: pagesize_uncomp <url>" && return 1
  [[ "$url" != http* ]] && url="https://$url"
  
  curl -Ls -H "Accept-Encoding: identity" "$url" | wc -c | numfmt --to=iec
}
pagesize_comp() {
  local url="$1"
  [[ -z "$url" ]] && echo "Usage: pagesize_comp <url>" && return 1
  [[ "$url" != http* ]] && url="https://$url"
  
  curl -Ls -H "Accept-Encoding: gzip" "$url" | wc -c | numfmt --to=iec
}
pagesize() {
  local url="$1"
  [[ -z "$url" ]] && echo "Usage: pagesize <url>" && return 1
  [[ "$url" != http* ]] && url="https://$url"
  echo "URL: $url"
  echo "---------------------------"
  echo -n "Uncompressed: "
  curl -Ls -H "Accept-Encoding: identity" "$url" | wc -c | numfmt --to=iec
  echo -n "Gzip compressed: "
  curl -Ls -H "Accept-Encoding: gzip" "$url" | wc -c | numfmt --to=iec
  echo "---------------------------"
}
# ============================================================
# 📝 History Configuration
# ============================================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS    
setopt HIST_REDUCE_BLANKS      
setopt HIST_IGNORE_SPACE       
setopt HIST_VERIFY             
setopt SHARE_HISTORY           
setopt EXTENDED_HISTORY        
setopt INC_APPEND_HISTORY      
# ============================================================
# 🔧 Shell Options
# ============================================================
setopt AUTO_CD                 
setopt AUTO_PUSHD              
setopt PUSHD_IGNORE_DUPS       
setopt PUSHD_SILENT            
setopt ALWAYS_TO_END           
setopt AUTO_MENU               
setopt COMPLETE_IN_WORD        
setopt LIST_PACKED             
setopt EXTENDED_GLOB           
setopt NO_CASE_GLOB            
setopt CORRECT                 
setopt CORRECT_ALL             
# ============================================================
# 🎯 Completion Configuration
# ============================================================
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  
zstyle ':completion:*' menu select                       
zstyle ':completion:*' group-name ''                     
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2,bg:-1,bg+:-1
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# ============================================================
# 🎨 Plugin Configuration
# ============================================================
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# ============================================================
# 🔄 Source Custom Files
# ============================================================
if [ -d ~/.config/zsh ]; then
    for file in ~/.config/zsh/*.zsh; do
        [ -r "$file" ] && source "$file"
    done
fi
if [[ $- == *i* ]]; then
    show_greeting
fi
 
export PNPM_HOME="/home/d3f4alt/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
[ -s "/home/d3f4alt/.bun/_bun" ] && source "/home/d3f4alt/.bun/_bun"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
