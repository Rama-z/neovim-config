return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls.nvim',
    'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting   -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- Formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'svelte',
        'prettier',        -- ts/js formatter
        'stylua',          -- lua formatter
        'eslint_d',        -- ts/js linter
        'shfmt',           -- Shell formatter
        'checkmake',       -- Linter for Makefiles
        'ruff',            -- Python linter and formatter
        'npm-groovy-lint', -- Groovy linter
      },
      automatic_installation = true,
    }

    -- Define sources for null-ls
    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.stylua,
      formatting.shfmt.with { args = { '-i', '4' } },
      formatting.terraform_fmt,
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
      require 'none-ls.formatting.ruff_format',

      formatting.npm_groovy_lint.with {
        extra_args = { '--format' },
      }
    }

    -- Setup null-ls
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
