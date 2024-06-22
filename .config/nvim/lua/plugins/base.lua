return {
    {
        "folke/which-key.nvim",
        lazy = false,
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            local wk = require("which-key")
            wk.setup()
            -- Which key is used only in this place to set mapping groups
            -- all other mappings are set using vim.keymap.set with "desc" option
            wk.register({
                ["<leader>f"] = { name = "Telescope" },
                ["<leader>l"] = { name = "LSP" },
                ["<leader>g"] = { name = "Git" },
            })
        end,
    },

    { -- status bar
        dependencies = { "nvim-tree/nvim-web-devicons" },
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup()
        end,
    },

    { -- icnons
        "nvim-tree/nvim-web-devicons",
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup { hint_enable = true, hint_prefix = "" }
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup {
                indent = {
                    char = "▏",
                },
                scope = {
                    show_start = false
                }
            }
        end,
    },

    {
        "mrjones2014/smart-splits.nvim",
        enabled = false,
        config = function()
            local map = vim.keymap.set

            map("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Focus on left-side window" })
            map("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Focus on bottom-side window" })
            map("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Focus on top-side window" })
            map("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Focus on right-side window" })
        end,
    },

    { -- Highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure {
                modes_denylist = { "v" },
            }
        end,
    },

    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents" },
            }
        end,
    },

    { -- Breadcrumbs
        "Bekaboo/dropbar.nvim",
        config = function()
            vim.keymap.set("n", "<leader>e", require("dropbar.api").pick, { desc = "Dropbar pick" })

            require("dropbar").setup({
                bar = { pick = { pivots = "qwertyuiopasdfghjkl" }, },
            })
        end,
    },

    { -- A pretty window for previewing, navigating and editing your LSP locations in one place
        "DNLHC/glance.nvim",
        config = function()
            require("glance").setup({
                hooks = {
                    -- Don"t open glance when there is only one result and it is located in the current buffer, open otherwise
                    before_open = function(results, open, jump, method)
                        local uri = vim.uri_from_bufnr(0)
                        if #results == 1 then
                            -- local target_uri = results[1].uri or results[1].targetUri
                            -- if target_uri == uri then
                            --     jump(results[1])
                            -- else
                            --     open(results)
                            -- end
                            jump(results[1])
                        else
                            open(results)
                        end
                    end,
                }
            })
        end,
    },

    { -- Yazi file manager plugin
        "mikavilpas/yazi.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>y", function()
                require("yazi").yazi(nil, vim.fn.getcwd())
            end, { desc = "Open yazi" })
        end,
    },

    { -- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
        "hedyhli/outline.nvim",
        config = function()
            require("outline").setup({
                keymaps = {
                    toggle_preview = "i", -- default "K"
                }
            })

            vim.keymap.set("n", "<leader>s", "<cmd>Outline<CR>", { desc = "Toggle outline" })
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = "<A-q>",
                direction = "float",
            })
        end

    },
}
