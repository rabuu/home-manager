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
			require("mini.statusline").setup()
		end,
	},
}
