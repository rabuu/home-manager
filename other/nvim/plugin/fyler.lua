vim.pack.add({ "https://github.com/FylerOrg/fyler.nvim" })

local fyler = require("fyler")
fyler.setup({
	mappings = {
		n = {
			["^"] = {
				action = "visit",
				args = { parent = true },
			},
		},
	},
	integrations = {
		icon = "mini_icons",
	},
	ui = {
		indent_guides = true,
	},
})

vim.keymap.set(
	{ "n", "v" },
	"<leader>f",
	function() fyler.open() end,
	{ desc = "open file manager (fyler)" }
)

vim.keymap.set(
	{ "n", "v" },
	"<leader>F",
	function() fyler.open({ kind = "split_left_most" }) end,
	{ desc = "open file manager in split (fyler)" }
)
