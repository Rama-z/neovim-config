return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/null-ls.nvim', -- For formatting and linting
      'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
      'hrsh7th/nvim-cmp',                -- Autocompletion
      'hrsh7th/cmp-nvim-lsp',            -- LSP source for nvim-cmp
      'L3MON4D3/LuaSnip',                -- Snippets engine
      'saadparwaiz1/cmp_luasnip',        -- Snippets source for nvim-cmp
      'windwp/nvim-ts-autotag',          -- Auto close and rename tags
      'rafamadriz/friendly-snippets',    -- Collection of snippets
      'onsails/lspkind.nvim',            -- VSCode-like pictograms
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local null_ls = require 'null-ls'
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      -- Load friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      -- Common on_attach function for LSP servers
      local on_attach = function(client, bufnr)
        local buf_map = function(mode, lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
        end
        -- Keybindings
        buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        buf_map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>')

        -- Set up formatting on save
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = 'LspFormatting', buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('LspFormatting', { clear = false }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                bufnr = bufnr,
                timeout_ms = 5000,
              }
            end,
          })
        end
      end

      -- Configure CSS LSP
      lspconfig.cssls.setup {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      }

      -- Configure Tailwind LSP
      lspconfig.tailwindcss.setup {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { 'cva\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
                { 'cx\\(([^)]*)\\)',  "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { 'tw\\`([^`]*)\\`',  '([^`]*)' },
              },
            },
            validate = true,
          },
        },
      }

      -- Configure TypeScript LSP
      lspconfig.ts_ls.setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Disable tsserver formatting in favor of null-ls
          client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          typescript = {
            suggestionActions = { enabled = false },
            updateImportsOnFileMove = { enabled = true },
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            suggestionActions = { enabled = false },
            updateImportsOnFileMove = { enabled = true },
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      }

      -- Configure Lua LSP
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      -- Configure null-ls
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier.with {
            filetypes = {
              'javascript',
              'javascriptreact',
              'typescript',
              'typescriptreact',
              'css',
              'scss',
              'sass',
              'less',
              'html',
              'json',
              'markdown',
              'yaml',
            },
          },
          null_ls.builtins.diagnostics.eslint,
        },
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = 'LspFormatting', buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end,
      }

      -- Configure Treesitter
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'javascript', 'typescript', 'tsx', 'html', 'css', 'scss', 'json', 'lua' },
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
      require('nvim-ts-autotag').setup()

      -- Configure nvim-cmp
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function(entry, vim_item)
              -- Source 표시
              vim_item.menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[LuaSnip]',
                path = '[Path]',
              })[entry.source.name]
              return vim_item
            end,
          },
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      }
    end,
  },
}
