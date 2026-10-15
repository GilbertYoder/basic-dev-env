vim.cmd.colorscheme('retrobox')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = ' '
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp',
    'https://github.com/windwp/nvim-autopairs',
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/tpope/vim-surround",
})

require('nvim-treesitter').install({ 'python', 'lua', 'bash', 'json', 'yaml' })
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>f', fzf.files)
vim.keymap.set('n', '<leader>g', fzf.live_grep)
vim.keymap.set('n', '<leader>b', fzf.buffers)

require('gitsigns').setup()
require('nvim-autopairs').setup()

vim.cmd.packadd('blink.lib')
require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'accept', 'fallback' },
    },
    completion = {
        documentation = {
            auto_show = true,
        },
    },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        '.git',
    },
    capabilities = capabilities,
})
vim.lsp.enable('pyright')

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
})
vim.lsp.enable("ts_ls")

vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_fix", "ruff_format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
  },
})
vim.keymap.set("n", "<leader>s", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
  })
end, { desc = "Format buffer" })

