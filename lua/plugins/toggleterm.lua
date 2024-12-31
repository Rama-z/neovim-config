return {
  {
    'akinsho/toggleterm.nvim',
    version = '*', -- Versi stabil terbaru
    config = function()
      require('toggleterm').setup {
        size = 20,                -- Ukuran terminal default (20 baris untuk horizontal split)
        open_mapping = [[<c-\>]], -- Shortcut untuk membuka/menutup terminal
        direction = 'horizontal', -- Opsi: "horizontal", "vertical", "tab", atau "float"
        close_on_exit = true,     -- Tutup terminal otomatis saat shell selesai
        shell = vim.o.shell,      -- Shell yang digunakan
      }
      require('toggleterm').setup {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,    -- Sembunyikan nomor baris di terminal
        shade_filetypes = {},
        shade_terminals = true, -- Gelapkan terminal untuk membedakan dari buffer biasa
        shading_factor = 2,     -- Intensitas gelap terminal (1-3)
        start_in_insert = true, -- Langsung masuk ke mode insert di terminal
        persist_size = true,    -- Ingat ukuran terminal saat membuka/menutup
        direction = 'float',    -- Float untuk terminal melayang (bisa diganti dengan "horizontal" atau "vertical")
        float_opts = {
          border = 'curved',    -- Gaya border: "single", "double", "shadow", atau "curved"
          winblend = 3,         -- Transparansi window
        },
        shell = vim.o.shell,    -- Shell yang digunakan (default sesuai sistem)
      }
    end,
  },
}
