-- Easily comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = {},
  config = function()
    require('Comment').setup {
      padding = true,
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-c>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('v', '<C-c>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  end,
}
