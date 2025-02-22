return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = true,
		config = function ()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true, -- disables setting the background color.
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			})

			vim.cmd.colorscheme "catppuccin"
		end
	}
}

