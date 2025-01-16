return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    -- local fileformatname = {
    --   'filename',
    --   path = 0,           -- Menampilkan nama file dengan path relatif
    --   file_status = true, -- Menampilkan status file
    --   fmt = function(name)
    --     -- Ubah label berdasarkan pola file
    --     local patterns = {
    --       ['hooks.ts$'] = function(dirname) return dirname .. ' - hooks' end,
    --       ['index.tsx$'] = function(dirname) return dirname end,
    --       ['helpers.tsx$'] = function(dirname) return dirname .. ' - help' end,
    --       ['types.ts$'] = function(dirname) return dirname .. ' - types' end,
    --       ['components/.*/index.tsx$'] = function(dirname) return dirname .. ' - component' end,
    --     }
    --
    --     for pattern, format_fn in pairs(patterns) do
    --       local dirname = vim.fn.fnamemodify(name, ':h:t') -- Ambil nama direktori
    --       if name:match(pattern) then
    --         return format_fn(dirname)
    --       end
    --     end
    --
    --     return name -- Default: tetap gunakan nama file asli
    --   end,
    -- }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'nord', -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
