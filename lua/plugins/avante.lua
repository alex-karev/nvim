return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = 'custom',
    -- cursor_applying_provider = 'custom',
    behaviour = {
      auto_focus_sidebar = false,
      -- enable_cursor_planning_mode = true,
    },
    vendors = {
      custom = {
        __inherited_from = 'openai',
        endpoint = os.getenv('AVANTE_URL'),
        api_key_name = 'AVANTE_TOKEN',
        model = os.getenv('AVANTE_MODEL'),
        disable_tools = true,
      },
    },
    hints = { enabled = false },
    mappings = {
      diff = {
        ours = '<leader>amo',
        theirs = '<leader>amt',
        all_theirs = '<leader>amat',
        both = '<leader>amb',
        cursor = '<leader>amc',
        next = '<leader>amn',
        prev = '<leader>amN',
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        switch_windows = '<C-j>',
        reverse_switch_windows = '<C-k>',
        add_file = 'a',
      },
      jump = {
        next = 'n',
        prev = 'N',
      },
      submit = {
        insert = '<CR>',
      },
    },
    windows = {
      sidebar_header = {
        enabled = false,
      },
      input = {
        height = 6,
      },
    },
    file_selector = {
      provider = 'telescope',
    },
  },
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
}
