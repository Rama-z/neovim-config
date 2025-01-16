return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    config = function()
      vim.g.VM_default_mappings = 1 -- Nonaktifkan default mappings

      -- Mapping khusus untuk vim-visual-multi
      vim.g.VM_maps = {
        ['Find Under'] = '<C-d>',         -- Ubah shortcut untuk "Find Under" menjadi <C-d>
        ['Find Subword Under'] = '<C-d>', -- Ubah untuk "Find Subword Under" menjadi <C-d>
      }
    end,
  },
}
