return {
	{
		"folke/trouble.nvim",
		opts = {
			auto_close = true,
			auto_preview = false,
		},
		keys = {
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=true<cr>",
				desc = "lsp info (Trouble)",
			},
			{
				"<leader>cd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "diagnostics (Trouble)",
			},
			{
				"<leader>cD",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "diagnostics in buffer (Trouble)",
			},
		},
	}
}
