-- [[ Globals ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Setting options ]]

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true -- Indent after break
vim.opt.undofile = true -- Undo history
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.wrap = true
vim.opt.splitright = true -- New split positions
vim.opt.splitbelow = true
vim.opt.list = true -- Whitespace display
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split' -- Substitution preview
vim.opt.cursorline = true
vim.opt.scrolloff = 10 -- Screen lines above or below cursor
vim.opt.confirm = true -- Close confirm
vim.opt.laststatus = 3
vim.schedule(function() -- Clipboard integration (after UiEnter)
  vim.opt.clipboard = 'unnamedplus'
end)
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- [[ Keymaps ]]

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight in normal mode' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>t', '<cmd>Floaterminal<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>ab', '<cmd>AvanteClear<CR>', { desc = 'avante: clear buffer' })
vim.keymap.set({ 'v', 'n' }, '<leader>/', 'gc', { desc = 'Comment block' })
vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferPrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('n', '<leader>pa', '<cmd>AddProject<CR>', { desc = '[A]dd [P]roject' })
vim.keymap.set('n', '<leader>pd', '<cmd>DeleteProject<CR>', { desc = '[D]elete [P]roject' })
vim.keymap.set('n', '<leader>fb', '<cmd>Oil --float . <CR>', { desc = '[F]ile [B]rowser' })

-- Disable arrow keys in normal and insert mode
vim.keymap.set({ 'i', 'n' }, '<left>', '<cmd>echo "Use h to move!! (<C-h> in insert mode)"<CR>')
vim.keymap.set({ 'i', 'n' }, '<right>', '<cmd>echo "Use l to move!! (<C-l> in insert mode)"<CR>')
vim.keymap.set({ 'i', 'n' }, '<up>', '<cmd>echo "Use k to move!! (<C-k> in insert mode)"<CR>')
vim.keymap.set({ 'i', 'n' }, '<down>', '<cmd>echo "Use j to move!! (<C-j> in insert mode)"<CR>')

-- Move cursor in insert mode
vim.keymap.set('i', '<C-h>', '<left>', { desc = 'Move left in insert mode' })
vim.keymap.set('i', '<C-l>', '<right>', { desc = 'Move right in insert mode' })
vim.keymap.set('i', '<C-k>', '<up>', { desc = 'Move up in insert mode' })
vim.keymap.set('i', '<C-j>', '<down>', { desc = 'Move down in insert mode' })

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'Open new buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<CR>', { desc = 'Close buffer' })

-- [[ Basic Autocommands ]]

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install Lazy.nvim ]]

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]

require('lazy').setup(require 'plugins')
vim.cmd.colorscheme 'catppuccin'

-- [[ Commands ]]

require 'custom.plugins.floaterminal'
require 'custom.commands'
