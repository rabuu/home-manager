vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		c = {
			"clang-format",
			lsp_format = "fallback",
		},
		cpp = {
			"clang-format",
			lsp_format = "fallback",
		},
		rust = {
			"rustfmt",
			lsp_format = "fallback",
		},
		typst = {
			"typstyle",
			lsp_format = "fallback",
		},
		javascript = {
			"biome-check",
			"prettier",
			lsp_format = "fallback",
			stop_after_first = true,
		},
		typescript = {
			"biome-check",
			"prettier",
			lsp_format = "fallback",
			stop_after_first = true,
		},
		json = {
			"biome-check",
			lsp_format = "fallback",
		},
		css = {
			"biome-check",
			lsp_format = "fallback",
		},
		dart = { "dart_format", },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "never",
	},
})

vim.keymap.set(
	"n",
	"<leader>cf",
	conform.format,
	{ desc = "format code (conform)" }
)
