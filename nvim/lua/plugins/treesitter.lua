return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function() require("nvim-treesitter.install").update() end,
		lazy = true,
		event = "VeryLazy",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = {
			ensure_installed = {
				"comment",
				"diff",
				"gitcommit",
				"markdown_inline",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
	},
}
