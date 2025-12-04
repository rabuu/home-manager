return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.icons").setup()
			require("mini.pairs").setup()
			require("mini.pick").setup()
			require("mini.statusline").setup()
		end,
		keys = {
			{
				"<leader>.",
				function() require("mini.pick").builtin.files() end,
				desc = "Pick files",
			},
			{
				"<leader>,",
				function() require("mini.pick").builtin.buffers() end,
				desc = "Pick buffers",
			},
			{
				"<leader>/",
				function() require("mini.pick").builtin.grep_live() end,
				desc = "Grep live",
			},
		},
	},
}
