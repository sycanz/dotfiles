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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gt', builtin.git_status, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
