-- add some plugins other plugins may depend on
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-mini/mini.icons",
})
require("mini.icons").setup()

-- update plugins
vim.keymap.set("n", "<leader>Pu", vim.pack.update, { desc = "update plugins (vim.pack)" })
