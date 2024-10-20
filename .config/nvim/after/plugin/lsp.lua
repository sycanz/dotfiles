local lsp_zero = require('lsp-zero')
local util = require('lspconfig/util')

local lsp_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = true
    })
end

lsp_zero.extend_lspconfig({
    sign_text = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
    },
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Mason source: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'pyright'},
    handlers = {
        -- LSP source codes: https://github.com/neovim/nvim-lspconfig/tree/master
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end,

        pyright = function()
            require('lspconfig').pyright.setup({
                cmd = { "pyright-langserver", "--stdio" },
                filetypes = { "python" },
                root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git"),
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true
                        }
                    }
                },
                single_file_support = true
            })
        end,

        bashls = function()
            require'lspconfig'.bashls.setup({
                cmd = { "bash-language-server", "start" },
                filetypes = { "sh" },
                root_dir = util.find_git_ancestor,
                {
                    bashIde = {
                        globPattern = "*@(.sh|.inc|.bash|.command)"
                    }
                },
                single_file_support = true
            })
        end,

        eslint = function()
            require'lspconfig'.eslint.setup({
              --- ...
              on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  command = "EslintFixAll",
                })
              end,
            })
        end,

        html = function()
            require'lspconfig'.html.setup ({})
        end,
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        {name = 'nvim_lsp'}
    },
    mapping = {
        -- confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = true}),

        -- select previous and next option
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

        -- scroll up and down the documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
