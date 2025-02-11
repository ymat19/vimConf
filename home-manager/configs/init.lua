-- general settings
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true  -- デフォルトで大文字・小文字を無視
vim.opt.smartcase = true   -- 大文字が含まれる場合は大文字・小文字を区別
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- key bindings
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', 's', '"_diwP', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', 'S', '"_diWP', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<C-h>', '^', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<C-l>', '$', { noremap = true, silent = true })

-- plugins setup
require'substitute'.setup{}
require'nvim-surround'.setup{}
require'lspconfig'.nixd.setup{}
require'hlchunk'.setup{
    chunk = {
        enable = true
    }
}
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
  }
}

vim.cmd[[colorscheme tokyonight]]

-- substitute-nvim
vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

-- lazy setup
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
      require('copilot').setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            next = "<Down>",
            prev = "<Up>",
          }
        }
      })
    end
})
-- lazy setup
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      require('CopilotChat').setup{}
    end
})
