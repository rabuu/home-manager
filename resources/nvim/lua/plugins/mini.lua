return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		lazy = false,
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.icons").setup()
			require("mini.pairs").setup({
				mappings = {
					-- This is is the default setting for ' but also blocks pairing directly after <.
					-- The reason is Rust lifetimes. But I would prefer to just disable it for some filetypes.
					["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '^[^%a\\<]', register = { cr = false } }
				}
			})
			require("mini.pick").setup()
			require("mini.statusline").setup()
		end,
		keys = {
			{
				"<leader>.",
				function() require("mini.pick").builtin.files() end,
				desc = "Pick files",
			},
			{
				"<leader>,",
				function() require("mini.pick").builtin.buffers() end,
				desc = "Pick buffers",
			},
			{
				"<leader>/",
				function() require("mini.pick").builtin.grep_live() end,
				desc = "Grep live",
			},
		},
	},
}
