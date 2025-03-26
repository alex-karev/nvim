return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = 'custom',
    -- cursor_applying_provider = 'custom',
    -- behaviour = {
    --   enable_cursor_planning_mode = true,
    -- },
    vendors = {
      custom = {
        __inherited_from = 'openai',
        endpoint = 'https://api.nuwaapi.com/v1',
        api_key_name = 'AVANTE_TOKEN',
        model = 'gpt-4o',
        disable_tools = true,
      },
    },
  },
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        code = {
          disable_background = true,
          border = 'thin',
          width = 'block',
        },
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
