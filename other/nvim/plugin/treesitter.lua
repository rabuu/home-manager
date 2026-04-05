vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
})

local treesitter = require("nvim-treesitter")

treesitter.setup()

treesitter.install({
	"comment",
	"diff",
	"gitcommit",
	"markdown",
	"markdown_inline",
	"rust",
	"latex",
	"typst",
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
			vim.cmd("TSUpdate")
		end
	end
})

-- auto-start treesitter for installed parsers
local installed_parsers = treesitter.get_installed("parsers")
local ts_startup_group = vim.api.nvim_create_augroup("treesitter-startup", {})
for _, parser in pairs(installed_parsers) do
	local filetypes = vim.treesitter.language.get_filetypes(parser)
	vim.api.nvim_create_autocmd({ "FileType" }, {
		group = ts_startup_group,
		pattern = filetypes,
		callback = function()
			vim.treesitter.start()
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end
