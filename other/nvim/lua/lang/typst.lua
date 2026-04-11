vim.pack.add({
	{
		src = "https://github.com/chomosuke/typst-preview.nvim",
		version = vim.version.range("1.x"),
	}
})

require("typst-preview").setup()

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		vim.keymap.set(
			"n",
			"<leader>cc",
			function()
				vim.cmd("LspTinymistPinMain")
				vim.cmd("TypstPreview")
			end,
			{
				desc = "start typst preview",
				buffer = true,
			}
		)
	end,
})
