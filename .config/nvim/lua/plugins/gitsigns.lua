return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                on_attach = function(bufnr)
                    local map = vim.keymap.set

                    map("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>", { desc = "Diff this file" })
                end
            }
        end
    },
}
