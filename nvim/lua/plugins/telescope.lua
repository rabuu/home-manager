local function oilfd(opts)
	require("telescope.builtin").find_files({
		cwd = require("oil").get_current_dir(),
		find_command = {
			"fd",
			"--type", opts.type,
			"--color", "never",
			"--exclude", ".git/",
		},
		hidden = true,
		no_ignore_parent = true,
		no_ignore = opts.no_ignore,
	})
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		lazy = true,
		opts = {
			defaults = require("telescope.themes").get_ivy {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					-- custom from here
					"--hidden",
					"--no-ignore",
					"--trim",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown {}
				}
			}
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end,
		keys = {
			{
				"<leader>tf",
				function()
					oilfd({ type = "file" })
				end,
				desc = "find files",
			},
			{
				"<leader>.",
				function()
					oilfd({ type = "file" })
				end,
				desc = "find files",
			},
			{
				"<leader>tF",
				function()
					oilfd({ type = "file", no_ignore = true })
				end,
				desc = "find files (+hidden)",
			},
			{
				"<leader>td",
				function()
					oilfd({ type = "directory" })
				end,
				desc = "find directories",
			},
			{
				"<leader>tD",
				function()
					oilfd({ type = "directory", no_ignore = true })
				end,
				desc = "find directories (+hidden)",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "live grep",
			},
			{
				"<leader>tb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "find buffers",
			},
			{
				"<leader>,",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "find buffers",
			},
			{
				"<leader>tT",
				function()
					require("telescope.builtin").treesitter()
				end,
				desc = "treesitter",
			},
			{
				"<leader>H",
				function()
					local harpoon = require("harpoon")
					local conf = require("telescope.config").values

					local file_paths = {}
					for _, item in ipairs(harpoon:list().items) do
						table.insert(file_paths, item.value)
					end

					require("telescope.pickers").new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					}):find()
				end
			},
		},
	},
}
