return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("which-key").add({
			{ "<leader>c", group = "code" },
			{ "<leader>T", group = "toggle" },
		})
	end,
}
