return {
	{ "nmac427/guess-indent.nvim", config = true },

	{ "stevearc/dressing.nvim", config = true },
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
}
