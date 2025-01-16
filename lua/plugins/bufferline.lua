return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',              -- Set to "tabs" to only show tabpages instead
        themable = true,               -- Allows highlight groups to be overriden i.e. sets highlights as default
        numbers = 'none',              -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = 'Bdelete! %d', -- Can be a string | function, see "Mouse actions"
        buffer_close_icon = '✗',
        close_icon = '✗',
        path_components = 1, -- Show only the file name without the directory
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 30,
        max_prefix_length = 30,   -- Prefix used when a buffer is de-duplicated
        tab_size = 31,
        diagnostics = 'nvim_lsp', -- Menampilkan diagnostics di buffer
        diagnostics_update_in_insert = false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true, -- Whether or not custom sorted buffers should persist
        separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        show_tab_indicators = false,
        indicator = {
          style = 'icon', -- Options: 'icon', 'underline', 'none'
        },
        icon_pinned = '󰐃',
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = 'insert_at_end',

        -- Formatter untuk mengubah nama buffer sesuai pola
        name_formatter = function(buf)
          -- Pastikan kita mendapatkan nomor buffer sebagai angka
          local buf_number = buf.id or buf.bufnr or buf
          if type(buf_number) ~= 'number' then
            return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t') -- Default: hanya nama file
          end

          local name = vim.api.nvim_buf_get_name(buf_number) -- Ambil nama file berdasarkan nomor buffer
          local patterns = {
            ['hooks.ts$'] = function(dirname) return dirname .. ' - hooks' end,
            ['index.tsx$'] = function(dirname) return dirname end,
            ['helpers.tsx$'] = function(dirname) return dirname .. ' - help' end,
            ['types.ts$'] = function(dirname) return dirname .. ' - types' end,
            ['components/.*/index.tsx$'] = function(dirname) return dirname .. ' - component' end,
          }

          for pattern, format_fn in pairs(patterns) do
            local dirname = vim.fn.fnamemodify(name, ':h:t') -- Ambil nama direktori
            if name:match(pattern) then
              return format_fn(dirname)
            end
          end

          return vim.fn.fnamemodify(name, ':t') -- Default: hanya nama file
        end,
      },
      highlights = {
        separator = {
          fg = '#434C5E',
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    }
  end,
}
