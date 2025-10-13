return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("clangd")
		vim.lsp.enable("texlab")
		vim.lsp.enable("gopls")
		vim.lsp.enable("zls")
		vim.lsp.enable("tinymist")
		vim.lsp.enable("rust_analyzer")

		vim.diagnostic.config({
			severity_sort = true,
			virtual_text = true,
			virtual_lines = {
				current_line = true,
			},
			float = {
				focusable = false,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
			},
		})
	end,
}
