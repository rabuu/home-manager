vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1",
	},
})

require("blink.cmp").setup({
	keymap = { preset = "enter" },
	appearance = { nerd_font_variant = "mono" },
	completion = {
		documentation = { auto_show = false }
	},
	signature = { enabled = true },
})
