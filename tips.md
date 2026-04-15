# Tips & Keybindings

## fzf

| Keybinding | Action |
|------------|--------|
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Fuzzy find files, insert path |
| `Alt+C` | Fuzzy find directories, cd into it |

## zoxide

| Command | Action |
|---------|--------|
| `cd foo` | Jump to best match for "foo" |
| `cd foo bar` | Jump to best match for "foo" and "bar" |
| `cdi` | Interactive directory picker (uses fzf) |

zoxide learns from your usage — the more you visit a directory, the higher it ranks.

## History

- Prefix a command with a space to keep it out of history (e.g. ` export SECRET=abc`)
- `Ctrl+R` (fzf) is much faster than up-arrow for finding old commands
- History is shared across all open tabs in real time

