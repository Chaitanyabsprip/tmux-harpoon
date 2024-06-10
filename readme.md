# Harpoon.tmux

`harpoon` is a simple tool to manage your tmux session bookmarks
efficiently. This tool allows you to track, view, and switch between your tmux
session bookmarks easily. It provides options to add, remove, and list your
tracked sessions, making jumping between essential tmux sessions seamless.

## Installation

1. Clone this repository.
2. Run make command to install, optionally you can install in a custom location
   by setting `INSTALL_PATH` environment variable when calling make.

   ```sh
   sudo make install
   ```

## Usage

```sh
Usage:
    harpoon [options] [args]
Options:
    -a                    Track current tmux session
    -A                    Track pane within current tmux session
    -r <index>            Replace tracked entry at index with current session
    -R <index>            Replace tracked entry at index with current pane within session
    -d [session_name]     Stop tracking session with session name. If
                          session_name is not passed then remove current session
    -l                    List tracked sessions
    -s <index>            Switch to the session at the specified index in the
                          list of tracked sessions
    -e                    Edit the sessions file
    -h                    Display this help message
```

The index corresponds to the position of the session in the list of tracked sessions.

I have the following snippet in my tmux configuration which integrates harpoon
with tmux.

```conf
bind -n M-b run 'harpoon -a'
bind -n .   run 'harpoon -A'
bind -n M-v run 'harpoon -l'
bind -n M-i run 'harpoon -e'
bind -n M-q run 'harpoon -s 1'  # jump to bookmark at index 1
bind    M-q run 'harpoon -r 1'  # replace entry at index 1 with current session
bind -n M-w run 'harpoon -s 2'  # jump to bookmark at index 2
bind    M-w run 'harpoon -R 2'  # replace entry at index 2 with current pane within session
bind -n M-e run 'harpoon -s 3'
bind -n M-r run 'harpoon -s 4'

# Note: When replcaing, if there is no entry at the given index, it is appended to the list instead.
```

## Example

```sh
# Track session
harpoon -a # Track the current tmux session
harpoon -A # Track pane within the current tmux session

harpoon -r 2 # Replace the tracked entry at index 2 with the current session
harpoon -R 3 # Replace the tracked entry at index 3 with the current pane within the session

# Stop tracking session
harpoon -d my_session # Stop tracking named session
harpoon -d # Stop tracking the current session

# List all tracked sessions
harpoon -l

# Jump to session
harpoon -s 1 # Switch to the session at index 1 in the list of tracked sessions
harpoon -s 4

# Edit the sessions file
harpoon -e

# Display the help message
harpoon -h
```

## Dependencies

- `tmux`
- `fzf`
- `tput`
- `awk`
- `make` (installation)

## Contribution

Contributions are welcome! If you find a bug or have a feature request, please
open an issue. If you would like to contribute code, please fork the repository
and submit a pull request.
