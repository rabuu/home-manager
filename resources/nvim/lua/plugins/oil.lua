return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["q"] = "actions.close",
			["^"] = "actions.parent",
		},
	},
	keys = { { "<Leader>f", vim.cmd.Oil, desc = "oil file manager" } },
	cmd = "Oil",
	config = function(_, opts)
		require("oil").setup(opts)
		vim.api.nvim_set_hl(0, "OilDirIcon", { link = "NvimTreeFolderIcon" })
	end,
}
