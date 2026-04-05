vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		rust = {
			"rustfmt",
			lsp_format = "fallback",
		},
		typst = {
			"typstyle",
			lsp_format = "fallback",
		},
	},
	format_on_save = {
		timeout_ms = 500,
	},
})

vim.keymap.set(
	"n",
	"<leader>cf",
	conform.format,
	{ desc = "format code (conform)" }
)
