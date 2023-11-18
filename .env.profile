export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland
export GTK_USE_PORTAL=1

alias vim='nvim'
alias vi='nvim'
alias reboot='sudo reboot'
alias search='sudo emerge --search'
alias install='sudo emerge --verbose --ask'
alias uninstall='sudo emerge'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export PATH=~/bin:$PATH

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  dbus-run-session sway
fi
