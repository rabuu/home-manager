vim.pack.add({ "https://github.com/folke/trouble.nvim" })

local trouble = require("trouble")

trouble.setup({
	auto_close = true,
	auto_preview = false,
})

vim.keymap.set(
	"n",
	"<leader>cs",
	"<cmd>Trouble symbols toggle focus=false<cr>",
	{ desc = "symbols (trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false<cr>",
	{ desc = "lsp info (trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>cd",
	"<cmd>Trouble diagnostic toggle<cr>",
	{ desc = "diagnostics (trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>cD",
	"<cmd>Trouble diagnostic toggle filter.buf=0<cr>",
	{ desc = "diagnostics in buffer (trouble)" }
)
