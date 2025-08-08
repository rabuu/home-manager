require("settings")
require("leader")
require("mappings")
require("autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	perfomance = {
		cache = {
			enabled = true,
		},
	},
	install = {
		colorscheme = { "gruvbox" },
	},
	ui = {
		backdrop = 100,
	},
})

require("colorscheme")
