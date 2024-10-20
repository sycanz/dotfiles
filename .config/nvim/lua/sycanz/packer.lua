local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "nvim-lua/plenary.nvim"
    use "christoomey/vim-tmux-navigator"
    use "nvim-tree/nvim-web-devicons"
    use "andweeb/presence.nvim"
    use "github/copilot.vim"
    use "cohama/lexima.vim"

    use (
        'nvim-treesitter/nvim-treesitter',
        {run = ':TSUpdate'}
    )

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }

    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = {
            {"nvim-lua/plenary.nvim"}
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Git tingz
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- use {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function()
    --         require("nvim-autopairs").setup {}
    --     end
    -- }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
