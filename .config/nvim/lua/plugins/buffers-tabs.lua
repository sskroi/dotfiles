return {
    {
        "akinsho/bufferline.nvim",
        config = function()
            local buffer_delete = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local bufferline_index = require("bufferline.state").current_element_index
                local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })

                if modified then
                    vim.api.nvim_echo(
                        { { string.format("No write since last change for current(%d) buffer", bufnr), "ErrorMsg" } },
                        false,
                        {})
                else
                    -- current buffer is last -> go prev
                    if #require("bufferline.state").visible_components == bufferline_index then
                        require("bufferline.commands").cycle(-1)
                    else
                        require("bufferline.commands").cycle(1)
                    end

                    vim.api.nvim_buf_delete(bufnr, { force = false })
                end
            end

            vim.opt.mousemoveevent = true -- need for hover events
            require("bufferline").setup {
                options = {
                    numbers = "ordinal",
                    offsets = {
                        { filetype = "neo-tree" }
                    },
                    diagnostics = "nvim_lsp",
                    -- need for setup catppuccin theme for bufferline
                    highlights = require("catppuccin.groups.integrations.bufferline").get(),
                    hover = { enabled = true, delay = 0, reveal = { "close" } },
                    close_command = buffer_delete,
                }
            }

            local go_to_buffer = function()
                local bufnr = vim.v.count

                if bufnr == 0 then
                    return
                else
                    require("bufferline").go_to(bufnr, true)
                end
            end

            vim.keymap.set("n", "gr", go_to_buffer, { desc = "Go to buffer [count]" })
            vim.keymap.set("n", "<A-d>", buffer_delete, { desc = "Close current buffer" })
            vim.keymap.set("n", "L", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
            vim.keymap.set("n", "H", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to prev buffer" })
            vim.keymap.set("n", "<A-l>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move current buffer next" })
            vim.keymap.set("n", "<A-h>", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move current buffer prev" })
        end
    },

    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup()
        end
    },
}
