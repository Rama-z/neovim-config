return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Manager
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSP Features
      { 'j-hui/fidget.nvim',       opts = {} }, -- Status updates
      'hrsh7th/cmp-nvim-lsp',             -- Autocompletion source
      'jose-elias-alvarez/null-ls.nvim',  -- Formatting and linting

      -- Additional Plugins
      'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
      'L3MON4D3/LuaSnip',                -- Snippets engine
      'hrsh7th/nvim-cmp',                -- Autocompletion
      'saadparwaiz1/cmp_luasnip',        -- Snippets source
      'windwp/nvim-ts-autotag',          -- Auto close tags
      'rafamadriz/friendly-snippets',    -- Snippets collection
      'onsails/lspkind.nvim',            -- VSCode-like pictograms
    },

    config = function()
      local lspconfig = require 'lspconfig'
      local mason = require 'mason'
      local mason_lspconfig = require 'mason-lspconfig'
      local null_ls = require 'null-ls'
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      -- Configure Mason
      mason.setup()

      -- Default Capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Common on_attach Function
      local on_attach = function(client, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        -- Keybindings
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, 'Format Code')

        -- Highlight References
        if client.supports_method 'textDocument/documentHighlight' then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
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

      lspconfig.gopls.setup {
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_dir = require('lspconfig').util.root_pattern('go.work', 'go.mod', '.git'),
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            usePlaceholders = true,
            staticcheck = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            codelenses = {
              generate = true,
              gc_details = true,
              test = true,
              tidy = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }
      -- Configure CSS LSP
      lspconfig.cssls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      }

      -- Configure Tailwind LSP
      lspconfig.tailwindcss.setup {
        on_attach = on_attach,
        capabilities = capabilities,
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
            exclude = {
              'node_modules/**',
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
            exclude = {
              'node_modules/**',
            },
          },
        },
      }

      -- Configure Lua LSP
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = {
              version = 'LuaJIT',
            },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = {
              disable = { 'missing-fields' },
              globals = { 'vim' }, -- Menambahkan "globals" seperti dalam konfigurasi sebelumnya
            },
          },
        },
      }

      -- Groovy lsp config
      lspconfig.groovyls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'groovy-language-server' },
        filetypes = { 'groovy' },
        root_dir = lspconfig.util.root_pattern('settings.gradle', '.git'),
        settings = {
          groovy = {
            classpath = {}, -- Bisa disesuaikan jika ada kebutuhan classpath tertentu
          },
        },
      }

      -- Configure Svelte LSP
      lspconfig.svelte.setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          -- Optional: Auto-refresh Svelte files on save
          vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.svelte' },
            callback = function()
              client.notify('$/onDidChangeWatchedFiles', { changes = {} })
            end,
          })
        end,
        capabilities = capabilities,
      }

      -- Configure C LSP
      lspconfig.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'clangd', '--background-index', '--clang-tidy' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
        settings = {
          clangd = {
            fallbackFlags = { '-std=c++17' },
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
              'svelte',
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
        ensure_installed = { 'javascript', 'typescript', 'tsx', 'html', 'css', 'scss', 'json', 'lua', 'svelte' },
        highlight = {
          enable = true,
        },
        -- autotag = {
        --   enable = true,
        -- },
        indent = {
          enable = true,
        },
      }
      require('nvim-ts-autotag').setup {}

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
          -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
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
