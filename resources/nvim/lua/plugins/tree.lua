return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    opts = {
        sync_root_with_cwd = true,
        hijack_cursor = true,
        update_focused_file = {
            enable = true,
        },
    },
    keys = {
        { "<leader>Tt", vim.cmd.NvimTreeToggle, desc = "tree file browser" },
        { "<leader>F", vim.cmd.NvimTreeFocus, desc = "focus tree file browser" },
    },
}
