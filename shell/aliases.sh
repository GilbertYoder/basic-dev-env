# Fuzzy-find a file and edit it with Neovim.
vf() {
  local file
  file="$(fzf)" || return
  [[ -n "$file" ]] && nvim -- "$file"
}

alias v='nvim'
alias lg='lazygit'
