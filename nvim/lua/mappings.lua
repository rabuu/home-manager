local function map(mode, lhs, rhs, opts)
	if not opts then
		opts = { remap = false, silent = true }
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- disable search highlight on escape
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- move up and down in wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")
map("v", "j", "gj")
map("v", "k", "gk")
map("v", "gj", "j")
map("v", "gk", "k")

-- toggle spellchecking
map("n", "<Leader>Ts", ":set spell!<CR>", { desc = "spell checking" })

-- center when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- better tabbing
map("v", "<", "<gv")
map("v", ">", ">gv")
