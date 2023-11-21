#export MOZ_ENABLE_WAYLAND=1
#export GDK_BACKEND=wayland
#export GTK_USE_PORTAL=1

alias vim='nvim '
alias vi='nvim '
alias view='nvim -R '
alias reboot='sudo reboot'
alias search='sudo pacman -Ss '
alias install='sudo pacman -S '
alias uninstall='sudo pacman -Rdd '
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export EDITOR=/bin/nvim
export PATH=~/bin:$PATH

#if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  pgrep -x mpd >/dev/null || exec mpd &
#  #dbus-run-session sway
#  dbus-launch --exit-with-session sway
#fi

if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
	#MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
    pgrep -x mpd >/dev/null || exec mpd &
    dbus-launch --exit-with-session sway
fi


