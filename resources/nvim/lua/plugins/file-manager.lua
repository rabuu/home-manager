return {
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		branch = "stable",
		lazy = false,
		config = true,
		keys = {
			{ "<leader>f", vim.cmd.Fyler, desc = "open file manager (Fyler)" },
			{
				"<leader>F",
				function() require("fyler").open({ kind = "split_left_most" }) end,
				desc = "open file manager in split (Fyler)"
			},
		},
	}
}
