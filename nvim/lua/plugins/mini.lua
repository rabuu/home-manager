return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.diff").setup()
			require("mini.git").setup()
			require("mini.icons").setup()
			require("mini.move").setup()
			require("mini.notify").setup()
			require("mini.pairs").setup()
			require("mini.statusline").setup()
		end,
	},
}
