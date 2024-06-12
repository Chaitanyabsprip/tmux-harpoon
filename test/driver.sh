#!/bin/sh

! type harpoon >/dev/null && echo "Could not find harpoon" && exit 1

setup() {
	mkdir /root/.cache
	TERM="${TERM:-screen256color}"
	tmux new -ds home
	cachefile=/root/.cache/.tmux-harpoon-sessions
	harpoon -h >/dev/null
}

failed() {
	echo "$LINENO Failed"
	exit 1
}

setup

! [ "$(cat "$cachefile")" = "" ] && failed
echo pass

tmux ls
tmux -V
tmux send-keys -t "home" Enter "harpoon -a" Enter
sleep 1

! [ "$(cat "$cachefile")" = "home=/root" ] && failed
echo "pass"
