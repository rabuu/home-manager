vim.pack.add({
	{
		src = "https://github.com/A7Lavinraj/fyler.nvim",
		version = "stable",
	},
})

local fyler = require("fyler")
fyler.setup()

vim.keymap.set(
	{ "n", "v" },
	"<leader>f",
	vim.cmd.Fyler,
	{ desc = "open file manager (Fyler)" }
)

vim.keymap.set(
	{ "n", "v" },
	"<leader>F",
	function() fyler.open({ kind = "split_left_most" }) end,
	{ desc = "open file manager in split (Fyler)" }
)
