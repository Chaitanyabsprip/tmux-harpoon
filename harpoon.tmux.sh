#!/usr/bin/env bash
set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HARPOON="$CURRENT_DIR/harpoon"
key_append_prefix="@harpoon_key_append"
key_replace_prefix="@harpoon_key_replace"

tmux_option() {
	local -r option=$(tmux show-option -gqv "$1")
	local -r fallback="$2"
	echo "${option:-$fallback}"
}

init_tmux_harpoon() {
	local count=1
	local optval

	while optval="$(tmux_option "$key_append_prefix$count")" && [ -n "$optval" ]; do
		tmux bind-key -n "$optval" run-shell "\"$HARPOON\" -s $count"
		count=$((count + 1))
	done

	count=1
	while optval="$(tmux_option "$key_replace_prefix$count")" && [ -n "$optval" ]; do
		tmux bind-key -n "$optval" run-shell "\"$HARPOON\" -r $count"
		count=$((count + 1))
	done

	[ -z "$(tmux_option "${key_append_prefix}1")" ] &&
		tmux bind-key -n "C-h" run-shell "\"$HARPOON\" -l"
	[ -z "$(tmux_option "${key_replace_prefix}1")" ] &&
		tmux bind-key -n "C-S-h" run-shell "\"$HARPOON\" -a"
}

init_tmux_harpoon
