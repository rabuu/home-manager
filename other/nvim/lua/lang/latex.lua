vim.pack.add({ "https://github.com/lervag/vimtex" })

vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "general"
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "latex" },
	callback = function()
		vim.keymap.set(
			"n",
			"<leader>cc",
			"<cmd>VimtexCompile<cr>",
			{
				desc = "compile LaTeX file",
				buffer = true,
			}
		)
	end,
})
