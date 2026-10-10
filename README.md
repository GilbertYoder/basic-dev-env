# Terminal bootstrap (Ubuntu / Multipass)

Installs: Neovim (Snap), fzf, ripgrep, Node.js + npm (nvm), Pyright, Lazygit, Delta.

## Install

```bash
git clone <YOUR-REPO-URL> ~/terminal-bootstrap
bash ~/terminal-bootstrap/bootstrap.sh
source ~/.bashrc
```

Requires Ubuntu/Debian with `sudo`, `apt`, and Snap available. Run as your regular user, **not** via `sudo bash`.

## Commands

- `vf`: fuzzy-pick a file with fzf, open in Neovim.
- `v`: Neovim.
- `lg`: Lazygit.
- Neovim: `gd` definition, `<Space>rn` rename, `<Space>gr` references, `<Ctrl-Space>` completion.

## Config

Configs are symlinked to this repo. Existing configs are backed up with timestamp suffixes. Edit files in the repo and changes take effect on the next launch. The bootstrap is intended to be rerunnable; tools are installed if missing, while nvm/Pyright are refreshed.

Set identity separately in `~/.gitconfig.local` (not committed):

```ini
[user]
    name = Your Name
    email = you@example.com
```

**Note:** Neovim's modern `vim.lsp.config`/`vim.lsp.enable` API requires Neovim 0.11+. No Neovim plugins are installed. Tree-sitter parsers are not installed.

This is intentionally Ubuntu-focused, not a cross-platform installer. For zsh, source `~/.config/terminal-bootstrap/aliases.sh` from `~/.zshrc` manually.
