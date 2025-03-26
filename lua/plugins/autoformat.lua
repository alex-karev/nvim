return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]or[M]at buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      javascript = { 'prettierd' },
    },
  },
}
