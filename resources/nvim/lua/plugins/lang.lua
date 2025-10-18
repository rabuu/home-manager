return {
	-- JAVA
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		opts = {
			cmd = { "jdtls" },
			root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', '.mvn'}, { upward = true })[1]),
		},
		config = function(_, opts)
			require("jdtls").start_or_attach(opts)
		end,
	},

	-- HASKELL
	{
		"mrcjkb/haskell-tools.nvim",
		version = "^4",
		lazy = false,
	},

	-- LATEX
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.opt.conceallevel = 2
			vim.opt.concealcursor = "c"

			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "general"
			vim.g.vimtex_view_general_viewer = "okular"
			vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdmg"
		end,
		keys = {
			{
				"<leader>cc",
				"<cmd>VimtexCompile<cr>",
				ft = "tex",
				desc = "compile LaTeX file",
			},
		},
	},

	-- POLARITY
	{
		"rabuu/polarity.nvim",
		dev = false,
		ft = "polarity",
		opts = {
			auto_format = false,
		},
	},

	-- RUST
	{
		"rust-lang/rust.vim",
		config = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"qnighy/lalrpop.vim",
		dependencies = { "rust-lang/rust.vim" },
	},

	-- ZIG
	"ziglang/zig.vim",
}
