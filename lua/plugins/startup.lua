return {
  'startup-nvim/startup.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
  config = function()
    require('startup').setup {
      header = {
        type = 'text',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Header',
        margin = 5,
        content = {
          ' _   _  _____ _____  _   _ ________  ___',
          '| \\ | ||  ___|  _  || | | |_   _|  \\/  |',
          '|  \\| || |__ | | | || | | | | | | .  . |',
          '| . ` ||  __|| | | || | | | | | | |\\/| |',
          '| |\\  || |___\\ \\_/ /\\ \\_/ /_| |_| |  | |',
          '\\_| \\_/\\____/ \\___/  \\___/ \\___/\\_|  |_/'
        },
        highlight = 'Statement',
        default_color = '',
        oldfiles_amount = 0,
      },
      -- name which will be displayed and command
      body = {
        type = 'mapping',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Basic Commands',
        margin = 5,
        content = {
          { ' Open Project', 'Telescope porjects', '<leader>fp' },
          { ' Recent Files', 'Telescope oldfiles', '<leader>fo' },
          { ' File Browser', 'Telescope file_browser', '<leader>ff' },
          { ' Colorschemes', 'Telescope colorscheme', '<leader>fc' },
          { ' New File', "lua require'startup'.new_file()", '<leader>nf' },
        },
        highlight = 'String',
        default_color = '',
        oldfiles_amount = 0,
      },
      footer = {
        type = 'text',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Footer',
        margin = 5,
        content = { 'alex-karev/nvim' },
        highlight = 'Number',
        default_color = '',
        oldfiles_amount = 0,
      },

      options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
      },
      mappings = {
        execute_command = '<CR>',
        open_file = 'o',
        open_file_split = '<c-o>',
        open_section = '<TAB>',
        open_help = '?',
      },
      parts = { 'header', 'body', 'footer' },
    }
  end,
}
