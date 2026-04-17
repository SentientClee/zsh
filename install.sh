#!/usr/bin/env zsh
set -e

ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSHRC="$HOME/.zshrc"
REPO="https://github.com/SentientClee/zsh.git"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

check() { command -v "$1" &>/dev/null; }
ok()   { echo "${GREEN}[ok]${NC}  $1"; }
warn() { echo "${YELLOW}[warn]${NC} $1"; }
fail() { echo "${RED}[missing]${NC} $1"; }

echo "\nChecking dependencies...\n"

deps=(zsh nvim git zoxide eza bat fzf)
missing=0

for dep in "${deps[@]}"; do
  if check "$dep"; then
    ok "$dep"
  else
    fail "$dep"
    missing=$((missing + 1))
  fi
done

p10k_paths=(
  /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
  /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
  /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
)
p10k_found=0
for p in "${p10k_paths[@]}"; do
  [[ -f "$p" ]] && p10k_found=1 && break
done
if (( p10k_found )); then
  ok "powerlevel10k"
else
  fail "powerlevel10k (install via Homebrew, your distro package manager, or git clone to ~/powerlevel10k)"
  missing=$((missing + 1))
fi

if [[ $missing -gt 0 ]]; then
  echo "\n${RED}$missing required dependency/dependencies missing. Install them before continuing.${NC}"
  exit 1
fi

echo "\nAll required dependencies found.\n"

# Clone or update the config
if [[ -d "$ZSH_CONFIG_DIR/.git" ]]; then
  echo "Updating existing config at $ZSH_CONFIG_DIR..."
  git -C "$ZSH_CONFIG_DIR" pull
else
  echo "Cloning config to $ZSH_CONFIG_DIR..."
  git clone "$REPO" "$ZSH_CONFIG_DIR"
fi

# Clone or update plugins
plugins=(
  https://github.com/zsh-users/zsh-autosuggestions.git
  https://github.com/zsh-users/zsh-syntax-highlighting.git
)

mkdir -p "$ZSH_CONFIG_DIR/plugins"
for repo in "${plugins[@]}"; do
  name="${repo:t:r}"
  dir="$ZSH_CONFIG_DIR/plugins/$name"
  if [[ -d "$dir/.git" ]]; then
    git -C "$dir" pull --quiet
    ok "$name (updated)"
  else
    git clone --quiet "$repo" "$dir"
    ok "$name (cloned)"
  fi
done

# Set up secrets.zsh if missing
if [[ ! -f "$ZSH_CONFIG_DIR/secrets.zsh" ]]; then
  cp "$ZSH_CONFIG_DIR/secrets.zsh.example" "$ZSH_CONFIG_DIR/secrets.zsh"
  warn "Created secrets.zsh from example — fill in your values at $ZSH_CONFIG_DIR/secrets.zsh"
fi

# Set up machine.zsh if missing
if [[ ! -f "$ZSH_CONFIG_DIR/machine.zsh" ]]; then
  cp "$ZSH_CONFIG_DIR/machine.zsh.example" "$ZSH_CONFIG_DIR/machine.zsh"
  warn "Created machine.zsh from example — fill in your values at $ZSH_CONFIG_DIR/machine.zsh"
fi

# Write ~/.zshrc
cat > "$ZSHRC" <<'EOF'
# Sources every *.zsh file in ~/.config/zsh in alphabetical order. Prefix a
# file with `00-` to force it to load first (e.g. for p10k instant prompt,
# which requires silence before it runs).
for f in ~/.config/zsh/*.zsh; do
  [[ -r "$f" ]] && source "$f"
done
EOF

ok "~/.zshrc updated"
echo "\n${GREEN}Done.${NC} Restart your shell or run: source ~/.zshrc\n"
