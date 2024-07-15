require('telescope').setup{
  pickers = {
    live_grep = {
      theme = "dropdown",
    },
    find_files = {
      theme = "dropdown",
      previewer = false
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
