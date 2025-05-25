vim.g.mapleader = " "

local keymap = vim.keymap.set

-- :[N]Lexplore, N% of the current window will be used for the new window.
keymap("n", "<leader>e", ":25Lexplore<CR>", { desc = "Open file tree" })

keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Reduce indentation" })
keymap("v", ">", ">gv", { desc = "Increase indentation" })
