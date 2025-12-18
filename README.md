# .dotfiles

> "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away." — Antoine de Saint-Exupéry

This repository is the blueprint for my development environment. It follows strict **Stoic Minimalism** and **XDG Base Directory** standards. There is no bloat. There are no frameworks (no Oh My Zsh, no NVM). Every line of config is intentional.

## ⚡ The Stack

* **OS:** macOS (Apple Silicon)
* **Shell:** Zsh + [Starship](https://starship.rs/) (Rust-based, instant prompt)
* **Package Manager:** Homebrew (Minimalist install, <50 packages)
* **Node Manager:** [fnm](https://github.com/Schniz/fnm) (Fast Node Manager - Rust)
* **Editor:** Neovim (Nightly via `bob`)
* **Multiplexer:** tmux
* **Window Manager:** Aerospace (Tiling)

## 📂 The Structure (XDG Compliance)

I refuse to let applications pollute my `$HOME`.

* **Config:** `~/.config/` (Symlinked from here)
* **Data:** `~/.local/share/`
* **State/Logs:** `~/.local/state/`
* **Cache:** `~/.cache/`
* **Binaries:** `~/.local/bin/` (The only user binary path)

### The Specifics
* **Zsh:** History in `.local/state`, Cache in `.cache`.
* **NPM:** Config forced to `~/.config/npm/npmrc`.
* **PNPM:** Global binaries forced to `~/.local/bin`.
* **Ruby/Bundler:** Config/Cache explicitly redirected via env vars to prevent `~/.bundle` creation.

## 🛠️ Installation

### 1. The Pre-requisites
Install the base layers. Do not install Node/Python yet.

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"

# Install the Vault
git clone [https://github.com/YOUR_USERNAME/.dotfiles.git](https://github.com/YOUR_USERNAME/.dotfiles.git) ~/.dotfiles
cd ~/.dotfiles
```

### 2. The Brew
Restore the lean package list.
```bash
brew bundle --file=Brewfile
```

### 3. The Links
Symlink the core configurations.

```bash
# Core Configs (Mapped from home/)
ln -sfn ~/.dotfiles/home/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/home/.tmux.conf ~/.tmux.conf

# XDG Configs (Mapped from config/)
mkdir -p ~/.config
ln -sfn ~/.dotfiles/config/nvim ~/.config/nvim
ln -sfn ~/.dotfiles/config/npm ~/.config/npm
ln -sfn ~/.dotfiles/config/pnpm ~/.config/pnpm

## ⚙️ Post-Install Configurations

### Node.js (FNM)
`fnm` is installed via Brew. Setup the environment:
```bash
fnm install --lts
fnm use lts-latest
npm install -g pnpm
```

### Neovim Providers
Neovim requires bridges to talk to external tools.

**Python 3 (System Bridge):**
We use the system python to avoid `pyenv` shim bloat.
```bash
/usr/local/bin/python3 -m pip install --user --upgrade pynvim
```

**Node.js (XDG Bridge):**
We force `pnpm` to install global binaries to our user bin, preventing PATH pollution.
```bash
pnpm config set global-bin-dir "$HOME/.local/bin"
pnpm add -g neovim
```

## 🚫 The Ban List

The following are strictly forbidden on this machine:
1.  **Oh My Zsh:** Bloated, slow startup.
2.  **NVM/Pyenv:** Shell shims are too slow. Use `fnm` and native paths.
3.  **Global Pip Installs:** Never `sudo pip install`. Use `pip --user` or `uv`.
4.  **Non-XDG configs:** If an app tries to create `~/.appname`, it gets uninstalled or aliased into submission.
