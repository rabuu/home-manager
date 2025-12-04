return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
			},
		},
		keys = {
			{ "<leader>cf", function() require("conform").format() end, desc = "format code (Conform)" },
		},
	}
}
