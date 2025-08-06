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
		ft = "polarity",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			auto_format = false,
		},
	},

	-- RUST
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		opts = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>cD", function()
						vim.cmd.RustLsp("debuggables")
					end, { desc = "rust: debuggables", buffer = bufnr })
				end,
				default_settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = { enable = true },
						},
						checkOnSave = true,
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
		end,
	},
	{
		"qnighy/lalrpop.vim",
		dependencies = { "rust-lang/rust.vim" },
	},

	-- ZIG
	"ziglang/zig.vim",
}
