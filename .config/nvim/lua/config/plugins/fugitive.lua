return {
    {
        'tpope/vim-fugitive',
        keys = {
            { "<leader>gs", function() vim.cmd.Git() end, mode = "n", desc = "Open Git Status" },
        },
    }
}
