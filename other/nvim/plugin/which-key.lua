vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local wk = require("which-key")

wk.setup()

wk.add({
	{ "<leader>gr", group = "lsp" },
	{ "<leader>c", group = "code" },
	{ "<leader>T", group = "toggle" },
	{ "<leader>P", group = "pack" },
})
