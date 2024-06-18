return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        branch = "v3.x",
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                source_selector = {
                    winbar = true,
                    sources = {
                        { source = "filesystem" },
                        { source = "git_status" },
                    },
                },
                window = {
                    width = 35,
                    mappings = {
                        ["t"] = "none",
                    },
                },
            })

            vim.keymap.set("n", "<leader>t", "<Cmd>Neotree toggle<CR>", { desc = "Open neo-tree" })
        end,
    },
}
