return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree toggle<CR>', desc = 'NeoTree Toggle', silent = true },
  },
  opts = {
    window = {
      position = 'left',
      width = 30,
    },
    filesystem = {
      filtered_items = {
        visible = false,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          '.DS_Store',
        },
        never_show = {}
      },
      window = {
        mappings = {
          ['<C-n>'] = 'close_window',
        },
      },
    },
  },
}
