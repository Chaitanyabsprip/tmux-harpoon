#!/usr/bin/env bash

set -e
tmux_option() {
    local -r option=$(tmux show-option -gqv "$1")
    local -r fallback="$2"
    echo "${option:-$fallback}"
}

declare -r CURRENT_DIR
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -r key_append_prefix
key_append_prefix="@harpoon_key_append"
declare -r key_replace_prefix
key_replace_prefix="@harpoon_key_replace"

init_tmux_harpoon() {
    count=1
    # TODO(chaitanya): figure out a way to allow the user to specify whether
    # the bind is with or without tmux prefix
    # TODO(chaitanya): figure out a way to allow the user to specify whether
    # the entry is session or pane level
    while optval="$(tmux_option "$key_append_prefix$count")" && [ -n "$optval" ]; do
        # bind optval key to harpoon -s "$count"
        count=$((count + 1))
    done
    while optval="$(tmux_option "$key_replace_prefix$count")" && [ -n "$optval" ]; do
        # bind optval key to harpoon -r "$count"
        count=$((count + 1))
    done
}
