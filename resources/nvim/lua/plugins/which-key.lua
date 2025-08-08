return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("which-key").add({
			{ "<leader>c", group = "code" },
			{ "<leader>t", group = "telescope" },
			{ "<leader>T", group = "toggle" },
			{ "<leader>h", group = "harpoon" },
		})
	end,
}
