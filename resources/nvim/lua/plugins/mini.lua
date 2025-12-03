return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.icons").setup()
			require("mini.notify").setup()
			require("mini.pairs").setup()
			require("mini.pick").setup()
			require("mini.statusline").setup()
		end,
		keys = {
			{
				"<Leader>.",
				function() require("mini.pick").builtin.files() end,
				desc = "Pick files",
			},
			{
				"<Leader>,",
				function() require("mini.pick").builtin.buffers() end,
				desc = "Pick buffers",
			},
			{
				"<Leader>/",
				function() require("mini.pick").builtin.grep_live() end,
				desc = "Grep live",
			},
		},
	},
}
