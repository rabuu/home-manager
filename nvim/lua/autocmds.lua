-- highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

-- show relative line numbers in visual mode (from mini.basics)
local relnum_group = vim.api.nvim_create_augroup("visual-relnum", {})
vim.api.nvim_create_autocmd("ModeChanged", {
	desc = "Show relative line numbers",
	group = relnum_group,
	pattern = "*:[V\x16]*",
	callback = function() vim.wo.relativenumber = vim.wo.number end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
	desc = "Hide relative line numbers",
	group = relnum_group,
	pattern = "[V\x16]*:*",
	callback = function()
		vim.wo.relativenumber = string.find(vim.fn.mode(), "^[V\22]") ~= nil
	end,
})
