local map = vim.keymap.set
local is_vscode = vim.g.vscode

-- Safe keymaps for all environments
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clipboard and paste handling
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- Escape in insert
map("i", "<C-c>", "<Esc>")

-- Disable annoying command
map("n", "Q", "<nop>")

-- Diagnostics float
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostics float" })

-- Format (LSP)
map("n", "<leader>f", function()
    if not is_vscode then
        vim.lsp.buf.format()
    else
        vim.cmd("call VSCodeNotify('editor.action.formatDocument')")
    end
end)

-- Markdown preview (needs the markdown-preview plugin)
vim.api.nvim_set_keymap("n", "<C-,>", "<Plug>MarkdownPreview", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<M-s>mp", "<Plug>MarkdownPreview", { noremap = false, silent = true })

-- Optional: Skip or VSCode-specific mappings
if not is_vscode then
    -- VimWithMe
    map("n", "<leader>vwm", function()
        require("vim-with-me").StartVimWithMe()
    end)
    map("n", "<leader>svwm", function()
        require("vim-with-me").StopVimWithMe()
    end)

    -- Run tmux command (won’t work in VSCode terminal)
    map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

    -- Quickfix/Location List navigation
    map("n", "<C-k>", "<cmd>cnext<CR>zz")
    map("n", "<C-j>", "<cmd>cprev<CR>zz")
    map("n", "<leader>k", "<cmd>lnext<CR>zz")
    map("n", "<leader>j", "<cmd>lprev<CR>zz")

    -- Rename under cursor
    map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

    -- chmod +x current file
    map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

    -- Insert Go-style error return
    map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

    -- Open dotfiles
    map("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")

    -- CellularAutomaton
    map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

    -- Reload file
    map("n", "<leader><leader>", function()
        vim.cmd("so")
    end)
end
