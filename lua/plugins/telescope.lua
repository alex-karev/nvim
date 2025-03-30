return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'natecraddock/workspaces.nvim',
      config = function()
        require('workspaces').setup {
          hooks = {
            open = {
              'Telescope find_files',
            },
          },
        }
      end,
    },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local fb_actions = require('telescope').extensions.file_browser.actions

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<Tab>'] = 'move_selection_next',
            ['<S-Tab>'] = 'move_selection_previous',
            ['<esc>'] = 'close',
          },
        },
      },
      pickers = {
        find_files = {
          layout_config = {
            prompt_position = 'top',
          },
          sorting_strategy = 'ascending',
          mappings = {
            i = {
              ['<C-h>'] = {
                function(prompt_bufnr)
                  local actions = require 'telescope.actions'
                  local action_state = require 'telescope.actions.state'
                  local current_line = action_state.get_current_line()
                  actions.close(prompt_bufnr)
                  vim.schedule(function()
                    require('telescope.builtin').find_files {
                      default_text = current_line,
                      find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*', '--glob', '**/.*' },
                    }
                  end)
                end, 
              },
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        ['file_browser'] = {
          cwd_to_path = true,
          mappings = {
            ['i'] = {
              ['<C-a>'] = fb_actions.create,
              ['<C-r>'] = fb_actions.rename,
              ['<C-d>'] = fb_actions.remove,
              ['<C-c>'] = fb_actions.change_cwd,
            },
          },
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'workspaces')
    pcall(require('telescope').load_extension, 'file_browser')
    local builtin = require 'telescope.builtin'
    local workspaces = require('telescope').extensions.workspaces
    local file_browser = require('telescope').extensions.file_browser
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]ettings' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    vim.keymap.set('n', '<leader>ft', builtin.buffers, { desc = '[F]ind [T]abs' })
    vim.keymap.set('n', '<leader>fp', workspaces.workspaces, { desc = '[F]ind [P]rojects' })
    vim.keymap.set('n', '<leader>fb', file_browser.file_browser, { desc = '[F]ile [B]rowser' })
    vim.keymap.set('n', '<leader>fe', function()
      builtin.find_files {}
    end, { desc = '[F]ile [B]rowser' })
    vim.keymap.set('n', '<leader><leader>', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = 'Search in current buffer' })
  end,
}
