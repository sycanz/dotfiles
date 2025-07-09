return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
        config = function()
            require("mason").setup()
        end
    },
    {
        -- this connects mason and nvim_lsp
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls" },
            automatic_installation = true,
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = { { name = "nvim_lsp" } }
            })
        end
    },
}
