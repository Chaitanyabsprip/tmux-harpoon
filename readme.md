# Harpoon.tmux

`harpoon.tmux` is a simple tool to manage your tmux session bookmarks
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
    -r [session_name]     Stop tracking session with session name. If
                          session_name is not passed then remove
                          current session
    -l                    View and jump to tracked sessions
    -s [index]            Switch to the session at the specified
                          index in the list of tracked sessions
    -h                    Display this help message
```

The index corresponds to the position of the session in the list of tracked sessions.

## Example

```sh
# Track the current session
harpoon.tmux -a

# Remove a session by name
harpoon.tmux -r mysession

# List tracked sessions
harpoon.tmux -l

# Switch to the Nth tracked session
harpoon.tmux -s 1
harpoon.tmux -s 3
```

## Dependencies

- `tmux`
- `fzf`
- `tput`
- `awk`
- `make`

## Contribution

Contributions are welcome! If you find a bug or have a feature request, please
open an issue. If you would like to contribute code, please fork the repository
and submit a pull request.
