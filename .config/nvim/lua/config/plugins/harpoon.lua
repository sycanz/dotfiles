local harpoon

return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        
        config = function()
            harpoon = require("harpoon") -- Now harpoon is available globally in this file
            harpoon:setup()
        end,

        keys = {
            { "<leader>a", function() harpoon:list():add() end, mode = "n", desc = "Add file to Harpoon" },
            { "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, mode = "n", desc = "Toggle Harpoon menu" },
            { "<leader>1", function() harpoon:list():select(1) end, mode = "n", desc = "Go to Harpoon 1" },
            { "<leader>2", function() harpoon:list():select(2) end, mode = "n", desc = "Go to Harpoon 2" },
            { "<leader>3", function() harpoon:list():select(3) end, mode = "n", desc = "Go to Harpoon 3" },
            { "<leader>4", function() harpoon:list():select(4) end, mode = "n", desc = "Go to Harpoon 4" },
            { "<C-S-P>", function() harpoon:list():prev() end, mode = "n", desc = "Previous Harpoon file" },
            { "<C-S-N>", function() harpoon:list():next() end, mode = "n", desc = "Next Harpoon file" },
        },
    }
}
