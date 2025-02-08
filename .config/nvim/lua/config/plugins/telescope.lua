return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    enabled = true,
    config = function()
        require('telescope').setup {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        height = 0.8,
                        width = 0.9,
                        prompt_position = 'bottom',
                        preview_width = 0.7,
                    },
                },
                -- sorting_strategy = "ascending"
            },
        }
    end,
    keys = {
        { '<leader>pf', function() require('telescope.builtin').find_files() end, mode = "n", desc = "Find files" },
        { '<leader>lg', function() require('telescope.builtin').live_grep() end, mode = "n", desc = "Live grep" },
        { '<leader>gt', function() require('telescope.builtin').git_status() end, mode = "n", desc = "Git status" },
        { '<leader>gb', function() require('telescope.builtin').git_branches() end, mode = "n", desc = "Git brances" },
    },
}
