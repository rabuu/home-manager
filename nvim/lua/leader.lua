local leader = "<Space>"
vim.g.mapleader = vim.api.nvim_replace_termcodes(leader, true, true, true)
vim.g.maplocalleader = vim.g.mapleader

vim.keymap.set("", leader, "<NOP>")
