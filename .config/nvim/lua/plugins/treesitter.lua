return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "go", "cpp", "c", "python", "lua", "sql", "vimdoc", "query", "markdown", "markdown_inline" },
                highlight = {
                    enable = true,
                },
            })
        end
    },
}
