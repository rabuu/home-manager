local function map(mode, lhs, rhs, opts)
	if not opts then
		opts = { remap = false, silent = true }
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- disable search highlight on escape
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- center when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- better tabbing
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lsp
map("n", "grd", vim.lsp.buf.definition, { desc = "go to definition"})
map("n", "grf", vim.lsp.buf.format, { desc = "format code"})

-- diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostics"})

-- yank to / paste from system clipboard
map({"n", "v"}, "<leader>y", "\"+y", { desc = "yank to system clipboard" })
map({"n", "v"}, "<leader>p", "\"+p", { desc = "paste from system clipboard" })
