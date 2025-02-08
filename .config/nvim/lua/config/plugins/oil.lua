return {
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		enabled = true,
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"permissions",
				},
				skip_confirm_for_simple_edits = true,
				prompt_save_on_select_new_entry = true,
				view_options = {
					show_hidden = true,

					is_hidden_file = function(name, bufnr)
						return vim.startswith(name, ".")
					end,

					is_always_hidden = function(name, bufnr)
						return false
					end,
				}
			})
		end,
		keys = {
			{ "-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory" },
		},
	}
}
