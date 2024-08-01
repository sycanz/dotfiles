local lsp_zero = require('lsp-zero')
local util = require('lspconfig/util')

lsp_zero.on_attach(function(client, bufnr)
  -- `:help lsp-zero-keybindings` to learn the available actions
  -- or this link `https://lsp-zero.netlify.app/v3.x/language-server-configuration.html#default-keybindings`
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- Mason source: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        -- LSP source codes: https://github.com/neovim/nvim-lspconfig/tree/master
        lua_ls = function()
            require'lspconfig'.lua_ls.setup({
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
            require'lspconfig'.pyright.setup({
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
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({select = false}),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
