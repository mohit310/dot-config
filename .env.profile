export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland
export GTK_USE_PORTAL=1

alias vim='nvim'
alias vi='nvim'
alias reboot='sudo reboot'
alias search='xbps-query'
alias install='sudo xbps-install'
alias uninstall='sudo xbps-remove'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  dbus-run-session sway
fi
