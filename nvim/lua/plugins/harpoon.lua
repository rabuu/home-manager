return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		settings = { sync_on_ui_close = true },
	},
	keys = {
		{
			"<Leader>hh",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "quick menu",
		},
		{
			"<Leader>ha",
			function() require("harpoon"):list():add() end,
			desc = "add entry",
		},
		{
			"<Leader>hn",
			function() require("harpoon"):list():next() end,
			desc = "next entry",
		},
		{
			"<Leader>hp",
			function() require("harpoon"):list():prev() end,
			desc = "previous entry",
		},
		{
			"<leader>h1",
			function() require("harpoon"):list():select(1) end,
			desc = "first entry",
		},
		{
			"<leader>h2",
			function() require("harpoon"):list():select(2) end,
			desc = "second entry",
		},
		{
			"<leader>h3",
			function() require("harpoon"):list():select(3) end,
			desc = "third entry",
		},
		{
			"<leader>h4",
			function() require("harpoon"):list():select(4) end,
			desc = "fourth entry",
		},
	},
}
