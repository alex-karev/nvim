return {
  -- Plugins with big configs
  require 'plugins.colorscheme',
  require 'plugins.telescope',
  require 'plugins.neotree',
  require 'plugins.lsp',
  require 'plugins.treesitter',
  require 'plugins.autoformat',
  require 'plugins.autocomplete',
  require 'plugins.statusline',
  require 'plugins.avante',
  require 'plugins.gitsigns',
  require 'plugins.startup',
  require 'plugins.ufo',
  --require 'plugins.lint',

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { -- Buffers as tabs
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
      icons = {
        separator_at_end = false,
      },
      sidebar_filetypes = {
        ['neo-tree'] = { event = 'BufWipeout', text = 'File Selector', align = 'center' },
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  { -- LazyGit
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gl', '<cmd>LazyGit<CR>', desc = '[L]azy[G]it' },
    },
  },

  { -- Toggle terminal
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {},
  },

  { -- Configure lua for nvim
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  { -- Adds git related signs and utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 100,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = {}, -- User Nerd Font
      },
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>l', group = '[L]SP' },
        { '<leader>a', group = '[A]vante' },
        { '<leader>n', group = '[N]ew' },
        { '<leader>g', group = '[G]it' },
        { '<leader>p', group = '[P]roject' },
        { '<leader>f', group = '[F]ind/[F]ormat' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  { -- Automatically add bracket pairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  { -- Small usefull keybindings
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      --require('mini.surround').setup()
      require('mini.comment').setup {
        mappings = {
          comment = '<leader>/',
          comment_line = '<leader>/',
          comment_visual = '<leader>/',
          textobject = '<leader>/',
        },
      }
    end,
  },

  -- Custom plugins

  { import = 'custom.plugins' },
}, {
  ui = { icons = vim.g.have_nerd_font },
}
