# .dotfiles

> "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away." — Antoine de Saint-Exupéry

This repository is the blueprint for my *minimalist* development environment. 

## ⚡ The Stack

* **OS:** macOS (Apple Silicon)
* **Shell & Terminal:** Zsh + [Starship](https://starship.rs/) (Rust-based, instant prompt) + Ghostty (Easy to-configure terminal emulator)
* **Package Manager:** Homebrew 
* **Node Manager:** [fnm](https://github.com/Schniz/fnm) (Fast Node Manager - Rust)
* **Editor:** Neovim, btw (Nightly via `bob`)
* **Multiplexer:** tmux
* **Window Manager:** Aerospace Tiling Window Manager **(no-to alt-tabbers)**

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

# Install the GOATED config
git clone [https://github.com/mothy-08/.dotfiles.git](https://github.com/mothy-08/.dotfiles.git) ~/.dotfiles
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
ln -sfn ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/home/.tmux.conf ~/.tmux.conf
ln -sfn ~/.dotfiles/home/.zprofiel ~/.zprofile
ln -sfn ~/.dotfiles/home/.zshrc ~/.zshrc

# XDG Configs (Mapped from config/)
mkdir -p ~/.config
ln -sfn ~/.dotfiles/config/aerospace ~/.config/aerospace
ln -sfn ~/.dotfiles/config/ghostty ~/.config/ghostty
ln -sfn ~/.dotfiles/config/npm ~/.config/npm
ln -sfn ~/.dotfiles/config/nvim ~/.config/nvim
ln -sfn ~/.dotfiles/config/pnpm ~/.config/pnpm
ln -sfn ~/.dotfiles/config/starship.toml ~/.config/starship.toml

## ⚙️ Post-Install Configurations

### Node.js (FNM)
`fnm` is installed via Brew. Setup the environment:
```bash
fnm install --lts
fnm use lts-latest
npm install -g pnpm
```

**Node.js (XDG Bridge):**
We force `pnpm` to install global binaries to our user bin, preventing PATH pollution.
```bash
pnpm config set global-bin-dir "$HOME/.local/bin"
pnpm add -g neovim
```
