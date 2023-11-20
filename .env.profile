export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland
export GTK_USE_PORTAL=1

alias vim='nvim'
alias vi='nvim'
alias reboot='sudo reboot'
alias search='sudo emerge --search '
alias install='sudo emerge --verbose --ask '
alias uninstall='sudo emerge --deselect '
alias changeuse='sudo emerge --ask --verbose --update --deep --changed-use @world'
alias upgrade='sudo emerge --ask --verbose --update --deep --newuse @world'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export PATH=~/bin:$PATH


if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  pgrep -x mpd >/dev/null || exec mpd &
  #dbus-run-session sway
  dbus-launch --exit-with-session sway
fi
