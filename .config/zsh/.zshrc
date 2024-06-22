# Oh-my-zsh installation directory
ZSH="$HOME/.local/share/oh-my-zsh"
# Checking oh-my-zsh installation
if [[ ! -d ${ZSH} ]] then
    mkdir -p "${HOME}/.local/share";
    git clone --depth 1 "https://github.com/ohmyzsh/ohmyzsh" "$ZSH"
fi

# Oh-my-zsh plugins
plugins=()

# Custom location for completion cache file
ZSH_COMPDUMP="$ZSH/cache/.zcompdump-${HOST}-${ZSH_VERSION}"
# Custom location for history file
HISTFILE="${HOME}/.local/state/zsh_history"

# Oh-my-zsh setup
source $ZSH/oh-my-zsh.sh


# Env
export EDITOR=nvim
export VISUAL=${EDITOR}

# No oh-my-zsh plugins setup
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Aliases
alias v='nvim'

alias l='eza --grid --sort=type --icons=always'
alias L='eza --oneline --sort=type --icons=always'
alias la='eza --grid --sort=type --icons=always --all'
alias La='eza --oneline --sort=type --icons=always --all'
alias ll='eza --long --sort=type --icons=always --all --smart-group --binary --git'
alias tree='eza --tree'

alias lg='lazygit'
alias rm='trash'
alias hx='helix'
alias d='docker'

alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias root='sudo -i'

alias vpnon='sudo wg-quick up wg0c'
alias vpnoff='sudo wg-quick down wg0c'

alias screenrec='mkdir -p ${HOME}/Videos/Screencasts && wf-recorder -c libx264rgb -r 30 -p preset=fast -f ${HOME}/Videos/Screencasts/Screencast_$(date +'%F_%T').mp4'

# Starship setup
eval "$(starship init zsh)"

# Zoxide setup
eval "$(zoxide init zsh)"

# Fzf setup
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


# Functions
# Open yazi
function y() {
  echo -e "\e]2;yazi" # set terminal title to "yazi"
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function clean() {
    sudo paccache -rk2
    sudo paccache -ruk0
    pacman -Qenq > ${HOME}/dotfiles/archlinux_explicitly_installed_packages.txt
    pacman -Qemq > ${HOME}/dotfiles/archlinux_aur_packages_list.txt
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

