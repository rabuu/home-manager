return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "goto definition")
				map("gD", vim.lsp.buf.declaration, "goto declaration")
				map("gr", require("telescope.builtin").lsp_references, "goto references")
				map("gI", require("telescope.builtin").lsp_implementations, "goto implementation")
				map("<leader>cd", require("telescope.builtin").lsp_type_definitions, "type definition")
				map("<leader>cr", vim.lsp.buf.rename, "rename")
				map("<leader>ca", vim.lsp.buf.code_action, "code action")
				map("<leader>cf", vim.lsp.buf.format, "format")
				map("K", vim.lsp.buf.hover, "hover documentation")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("lspconfig").clangd.setup({ capabilities = capabilities })
		require("lspconfig").texlab.setup({ capabilities = capabilities })
		require("lspconfig").gopls.setup({ capabilities = capabilities })
		require("lspconfig").zls.setup({ capabilities = capabilities })

	end,
}
