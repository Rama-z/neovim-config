return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'supermaven-inc/supermaven-nvim',
        opts = {}, -- Konfigurasi opsional untuk supermaven-nvim
      },
    },
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-a>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        ignore_filetypes = {}, -- or { "cpp", }
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
        log_level = 'off', -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      }
    end,
    opts = function(_, opts)
      -- Pastikan opts.sources ada sebagai tabel
      opts.sources = opts.sources or {}

      -- Tambahkan supermaven sebagai sumber autocomplete
      table.insert(opts.sources, 1, { name = 'supermaven', trigger_chars = { '-' } })

      return opts
    end,
  },
}
