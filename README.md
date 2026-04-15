# zsh

Modular zsh configuration living at `~/.config/zsh/`, sourced by a minimal `~/.zshrc`.

## Structure

| File | Purpose |
|------|---------|
| `aliases.zsh` | Shell aliases |
| `exports.zsh` | Environment variables and PATH |
| `history.zsh` | History settings |
| `completion.zsh` | Completion settings |
| `plugins.zsh` | Starship, fzf, zoxide |
| `work.zsh` | Work-specific config (gitignored — copy from `work.zsh.example`) |
| `secrets.zsh` | Secrets (gitignored — copy from `secrets.zsh.example`) |

## Install

```zsh
curl -fsSL https://raw.githubusercontent.com/SentientClee/zsh/main/install.sh | zsh
```

The install script checks for required dependencies, clones this repo to `~/.config/zsh/`, creates `secrets.zsh` from the example template, and writes `~/.zshrc`.

## Secrets

Copy `secrets.zsh.example` to `secrets.zsh` and fill in values:

```zsh
cp ~/.config/zsh/secrets.zsh.example ~/.config/zsh/secrets.zsh
```

## Dependencies

Required: `zsh`, `nvim`, `git`, `starship`, `zoxide`, `eza`, `bat`, `fzf`
