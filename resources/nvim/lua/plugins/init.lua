return {
	{ "nmac427/guess-indent.nvim", config = true },
	{ "j-hui/fidget.nvim", config = true },
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
}
