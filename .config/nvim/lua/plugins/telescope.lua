return {
    { -- file picker, live grep
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown()
                    }
                },

                defaults = {
                    initial_mode = "insert",
                },
            })
            require("telescope").load_extension("ui-select")

            local tbuiltin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", tbuiltin.find_files, { desc = "File picker" })
            vim.keymap.set("n", "<leader>fg", tbuiltin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fd", tbuiltin.buffers, { desc = "Buffers" })
        end,
    },

    { "nvim-telescope/telescope-ui-select.nvim",
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
}
