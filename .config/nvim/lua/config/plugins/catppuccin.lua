return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = true,
		config = function ()
			require("catppuccin").setup({
                -- auto_integrations = true,
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true, -- disables setting the background color.
                float = {
                    transparent = true, -- enable transparent floating windows
                    solid = false, -- use solid styling for floating windows, see |winborder|
                },
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                -- custom_highlights = {
                --     Normal = { bg = "none" },
                --     NormalNC = { bg = "none" },
                --     NormalFloat = { bg = "none" },
                --     FloatBorder = { bg = "none" },
                --     SignColumn = { bg = "none" },
                --     VertSplit = { bg = "none" },
                --     StatusLine = { bg = "none" },
                --     StatusLineNC = { bg = "none" },
                --     EndOfBuffer = { bg = "none" },
                -- }
            })
		    vim.cmd.colorscheme "catppuccin"
		end
	}
}

