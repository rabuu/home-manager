vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup()

require("mini.comment").setup()

require("mini.icons").setup()

require("mini.pairs").setup({
	mappings = {
		-- This is is the default setting for ' but also blocks pairing directly after <.
		-- The reason is Rust lifetimes. But I would prefer to just disable it for some filetypes.
		["'"] = {
			action = 'closeopen',
			pair = "''",
			neigh_pattern = '^[^%a\\<]',
			register = { cr = false }
		}
	}
})

local pick = require("mini.pick")
pick.setup()

vim.keymap.set(
	{ "n", "v" },
	"<leader>.",
	pick.builtin.files,
	{ desc = "pick files" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>,",
	pick.builtin.buffers,
	{ desc = "pick buffers" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>/",
	pick.builtin.grep_live,
	{ desc = "grep live" }
)

require("mini.statusline").setup()
