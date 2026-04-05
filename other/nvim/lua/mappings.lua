local map = vim.keymap.set
local opts = { remap = false, silent = true }

-- disable search highlight on escape
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- center when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- better tabbing (stay in visual mode)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- lsp
map("n", "grd", vim.lsp.buf.definition, { desc = "go to definition"})
map("n", "grf", vim.lsp.buf.format, { desc = "format code"})

-- diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostics"})

-- yank to / paste from system clipboard
map({"n", "v"}, "<leader>y", "\"+y", { desc = "yank to system clipboard" })
map({"n", "v"}, "<leader>p", "\"+p", { desc = "paste from system clipboard" })
