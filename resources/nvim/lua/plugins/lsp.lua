return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("clangd")
		vim.lsp.enable("texlab")
		vim.lsp.enable("gopls")
		vim.lsp.enable("zls")
		vim.lsp.enable("tinymist")
		vim.lsp.enable("rust_analyzer")
	end,
}
