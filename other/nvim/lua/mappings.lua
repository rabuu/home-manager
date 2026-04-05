local opts = { remap = false, silent = true }

-- disable search highlight on escape
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- center when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- better tabbing (stay in visual mode)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- yank to / paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p", { desc = "paste from system clipboard" })
