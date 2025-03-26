return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        show_tab_indicators = true,
        style_preset = bufferline.style_preset.default,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            separator = true,
            text_align = 'center',
          },
        },
        indicator = {
          icon = '| ',
          style = 'icon',
        },
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        themable = true,
        separator_style = "none"
      },
      highlights = {
        buffer_selected = {
          -- bg = 'none',
          italic = false,
          bold = true,
        },
        fill = {
          bg = 'none',
        },
      },
    }
    -- Transparent backgropund fix
    -- vim.cmd [[
    --   hi BufferLineFill guibg='#000'
    --   set termguicolors
    -- ]]
    --Mappings
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNex<CR>', { desc = 'Next tab' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous tab' })
  end,
}
