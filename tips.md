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

## Prompt

Git info shows when you're in a repo, backed by the gitstatus daemon.

| Indicator | Meaning |
|-----------|---------|
| ` name` | Current branch (or `@abc12345` if detached) |
| `✘N` | N unresolved conflicts |
| `+N` | N staged files |
| `!N` | N modified files |
| `?N` | N untracked files |
| `*N` | N stashes |
| `⇡N` | N commits ahead of upstream |
| `⇣N` | N commits behind upstream |

Other:

- `❯` is green normally, red when the last command failed.
- Right side shows the current time. On the right you'll also see the exit code (e.g. `1`) when the last command failed, and ` took Ns` when a command took over 2 seconds.

