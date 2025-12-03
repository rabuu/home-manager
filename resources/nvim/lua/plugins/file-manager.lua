return {
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		branch = "stable",
		lazy = false,
		config = true,
		keys = {
			{ "<leader>f", vim.cmd.Fyler, { desc = "Open fyler file manager" } },
			{
				"<leader>F",
				function() require("fyler").open({ kind = "split_left_most" }) end,
				{ desc = "Open fyler file manager (split)" }
			},
		},
	}
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {
	-- 		default_file_explorer = true,
	-- 		skip_confirm_for_simple_edits = true,
	-- 		view_options = {
	-- 			show_hidden = true,
	-- 		},
	-- 		keymaps = {
	-- 			["q"] = "actions.close",
	-- 			["^"] = "actions.parent",
	-- 		},
	-- 	},
	-- 	keys = { { "<leader>f", vim.cmd.Oil, desc = "oil file manager" } },
	-- 	cmd = "Oil",
	-- 	config = function(_, opts)
	-- 		require("oil").setup(opts)
	-- 		vim.api.nvim_set_hl(0, "OilDirIcon", { link = "NvimTreeFolderIcon" })
	-- 	end,
	-- },
}
