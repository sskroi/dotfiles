return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
            })

            -- vim.cmd("colorscheme catppuccin-frappe")
        end,
    },

    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "soft"
            vim.cmd("colorscheme gruvbox-material")
        end,
    },
}
