if status is-interactive
    # ============================================================
    # Prompt + Core Hooks
    # ============================================================

    # Starship custom prompt
    starship init fish | source

    # For jumping between prompts in Foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    # ============================================================
    # Environment
    # ============================================================

    set -x LANG en_US.UTF-8

    if test -n "$SSH_CONNECTION"
        set -x EDITOR vim
    else
        set -x EDITOR nvim
    end

    # PATH setup
    fish_add_path ~/.local/bin
    fish_add_path ~/.bun/bin
    fish_add_path ~/.local/share/pnpm
    fish_add_path ~/.spicetify

    # ============================================================
    # Direnv + Zoxide
    # ============================================================

    if type -q direnv
        direnv hook fish | source
    end

    if type -q zoxide
        zoxide init fish --cmd cd | source
    end

    # ============================================================
    # Alias and Functions
    # ============================================================
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --icons --group-directories-first -1'

    # For jumping between prompts in foot terminal

    if test -f ~/.config/fish/abbr.fish
        source ~/.config/fish/abbr.fish
    end

    for f in ~/.config/fish/functions/*.fish
        source $f
    end

    # ============================================================
    # Caelestia sequences (colors, transitions)
    # ============================================================

    if test -f ~/.local/state/caelestia/sequences.txt
        cat ~/.local/state/caelestia/sequences.txt
    end
end
