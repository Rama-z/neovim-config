return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Setup tema tokyonight
    require('tokyonight').setup {
      style = 'night',        -- Pilihan style: 'storm', 'moon', 'night', 'day'
      transparent = true,     -- Membuat background transparan
      terminal_colors = true, -- Warna terminal sesuai tema
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = { bold = true, italic = true },
        variables = { bold = false },
      },
      sidebars = { 'qf', 'help' }, -- Sidebar dengan background gelap
      dim_inactive = true,         -- Meredupkan jendela yang tidak aktif
    }

    -- Terapkan tema
    vim.cmd [[colorscheme tokyonight]]

    -- Highlight tambahan untuk elemen kode
    -- vim.api.nvim_set_hl(0, 'Comment', { fg = '#5f748c', italic = true }) -- Komentar
    -- vim.api.nvim_set_hl(0, 'String', { fg = '#9ece6a' })                 -- String
    -- vim.api.nvim_set_hl(0, 'Function', { fg = '#7aa2f7', bold = true })  -- Fungsi
    -- vim.api.nvim_set_hl(0, 'Keyword', { fg = '#bb9af7', bold = true })   -- Kata kunci
    -- vim.api.nvim_set_hl(0, 'Type', { fg = '#2ac3de', bold = true })      -- Tipe data
    vim.api.nvim_set_hl(0, 'Number', { fg = '#ff9e64' })   -- Angka
    vim.api.nvim_set_hl(0, 'Constant', { fg = '#ff75a0' }) -- Konstanta
    -- vim.api.nvim_set_hl(0, 'Variable', { fg = '#e0af68' })               -- Variabel
    vim.api.nvim_set_hl(0, 'Variable', { fg = 'white' })   -- Variabel

    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#2ac3de' })

    vim.api.nvim_set_hl(0, 'LineNrRelative', { fg = 'pink' })
  end,
}
