# 🪝 tmux-harpoon

`harpoon` is a simple tool to manage your tmux session bookmarks efficiently.
This tool allows you to track, view, and switch between your tmux session
bookmarks easily. It provides options to add, remove, and list your tracked
sessions, making jumping between essential tmux sessions seamless.

Now available as both a **standalone CLI tool** and a **TPM (Tmux Plugin Manager)
plugin**.

---

## 🚀 Features

* Track and jump to tmux sessions or panes
* Fuzzy search through tracked entries (via `fzf`)
* Replace entries at specific indexes
* Create or switch to sessions on the fly
* Edit the session list in a tmux popup
* Works both as a CLI tool and a TPM plugin

---

## 📦 Installation

### ✅ TPM (Tmux Plugin Manager)

Add this to your `.tmux.conf`:

```tmux
set -g @plugin 'Chaitanyabsprip/tmux-harpoon'
run '~/.tmux/plugins/tpm/tpm'
```

Then reload tmux and press `prefix + I` to install.

### ✅ Standalone

Clone this repository and run:

```sh
git clone https://github.com/yourusername/tmux-harpoon.git
cd tmux-harpoon
sudo make install
# or specify a custom path:
INSTALL_PATH=$HOME/.local/bin make install
```

---

## ⌨️ Keybindings

### ▶️ Example (manual `.tmux.conf` setup)

```tmux
bind -n M-b run 'harpoon -a'
bind -n .   run 'harpoon -A'
bind -n M-v run 'harpoon -l'
bind -n M-i run 'harpoon -e'
bind -n M-q run 'harpoon -s 1'
bind    M-q run 'harpoon -r 1'
bind -n M-w run 'harpoon -s 2'
bind    M-w run 'harpoon -R 2'
bind -n M-e run 'harpoon -s 3'
bind -n M-r run 'harpoon -s 4'
```

> 📝 **Note:** When replacing, if there is no entry at the given index, it is
appended instead.

### ▶️ Default TPM Keybindings

If you don’t define custom ones, these are set:

| Key            | Action                             |
| -------------- | ---------------------------------- |
| `Ctrl-h`       | Fuzzy-jump to a saved session/pane |
| `Ctrl-Shift-h` | Add current session                |
| `Alt-h`        | Add current session + pane         |
| `Ctrl-e`       | Edit the saved list in a popup     |

Override them via:

```tmux
set -g @harpoon_key_append1 'C-j'
set -g @harpoon_key_replace1 'M-j'
```

---

## 🧪 Usage (CLI)

```sh
Usage:
    harpoon [options] [args]
Options:
    -a                    Track current tmux session
    -A                    Track pane within current tmux session
    -r <index>            Replace tracked entry at index with current session
    -R <index>            Replace tracked entry at index with current pane within session
    -d [session_name]     Stop tracking session (or current session if name not provided)
    -l                    List tracked sessions
    -s <index>            Switch to the session at specified index
    -e                    Edit the sessions file
    -h                    Display help
```

---

## 📄 License

MIT

---

🪝 Built with love for a smoother tmux experience. Try it, star it, and open a
PR if you’ve got something cool!

## Contribution

Contributions are welcome! If you find a bug or have a feature request, please
open an issue. If you would like to contribute code, please fork the repository
and submit a pull request.
