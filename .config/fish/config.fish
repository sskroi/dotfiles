# Envs
set -gx EDITOR nvim
set -gx VISUAL $EDITOR

# Abbreviations and aliases
abbr -a v nvim

alias l='eza --grid --sort=type --icons=always'
alias L='eza --oneline --sort=type --icons=always'
alias la='eza --grid --sort=type --icons=always --all'
alias La='eza --oneline --sort=type --icons=always --all'
alias ll='eza --long --sort=type --icons=always --all --smart-group --binary --git'
abbr -a tree 'eza --tree'

abbr -a lg lazygit
abbr -a rm trash
abbr -a hx helix
abbr -a d docker

abbr -a poweroff 'systemctl poweroff'
abbr -a reboot 'systemctl reboot'
abbr -a root 'sudo -i'

abbr -a vpnon 'sudo wg-quick up wg0c'
abbr -a vpnoff 'sudo wg-quick down wg0c'

abbr -a screenrec 'mkdir -p {$HOME}/Videos/Screencasts && wf-recorder -c libx264rgb -r 30 -p preset=fast -f {$HOME}/Videos/Screencasts/Screencast_$(date +'%F_%T').mp4'

# Zoxide setup
zoxide init fish | source

# Fzf setup
fzf --fish | source
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

