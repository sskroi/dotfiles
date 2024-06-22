local map = vim.keymap.set

map({ "n" }, "J", "5<Down>", { desc = "Jump 5 lines down" })
map({ "n" }, "K", "5<Up>", { desc = "Jump 5 lines up" })

map({ "n", "i", "x" }, "<C-s>", "<Cmd>w<CR>", { desc = "Write current buffer" })
map({ "n" }, "<C-a>", "ggVG", { desc = "Select all" })

-- Navigating on windows
map("n", "<C-h>", "<C-w>h", { desc = "Focus on left-side window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus on bottom-side window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus on top-side window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus on right-side window" })

map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Stop highlighting search", silent = true })

-- Lines moving in visual mode
map("x", "<C-j>", ":move '>+1<CR>gv")
map("x", "<C-k>", ":move '<-2<CR>gv")
