vim.pack.add({ "https://github.com/c-cube/vim-tptp" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tptp" },
	callback = function()
		vim.bo.commentstring = "% %s"
	end,
})
