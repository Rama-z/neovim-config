return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "supermaven-inc/supermaven-nvim",
        opts = {}, -- Konfigurasi opsional untuk supermaven-nvim
      },
    },
    opts = function(_, opts)
      -- Pastikan opts.sources ada sebagai tabel
      opts.sources = opts.sources or {}

      -- Tambahkan supermaven sebagai sumber autocomplete
      table.insert(opts.sources, 1, { name = "supermaven", trigger_chars = { "-" } })

      return opts
    end,
  },
}
