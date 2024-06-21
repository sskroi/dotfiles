return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "DNLHC/glance.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local map = vim.keymap.set

            vim.lsp.inlay_hint.enable(true)

            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Go
            lspconfig.gopls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(signature_setup, bufnr)
                end,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        hints = {
                            rangeVariableTypes = true,
                            parameterNames = true,
                            constantValues = true,
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            functionTypeParameters = true,
                        },
                    }
                }
            }

            -- C++
            lspconfig.clangd.setup { -- setting up LSP
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(signature_setup, bufnr)
                    map("n", "<F4>", "<Cmd>ClangdSwitchSourceHeader<CR>", bufopts)
                end,
                capabilities = capabilities,
            }

            -- Python
            lspconfig.pyright.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(signature_setup, bufnr)
                end,
                capabilities = capabilities,
            }

            -- Lua
            lspconfig.lua_ls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(signature_setup, bufnr)
                end,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    },
                },
            }

            -- LSP servers with default config
            local servers = { "rust_analyzer" }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup { -- setting up LSP
                    on_attach = function(client, bufnr)
                        require("lsp_signature").on_attach(signature_setup, bufnr)
                    end,
                    capabilities = capabilities
                }
            end


            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            map("n", "<leader>w", vim.diagnostic.open_float, { desc = "Diagnostic open float" })
            map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic open list" })
            map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic go to prev" })
            map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic go to next" })

            -- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below function

                    ---@param description string
                    local opts = function(description)
                        return { buffer = ev.buf, desc = description }
                    end

                    map("n", "gd", "<CMD>Glance definitions<CR>", opts("Go to definition"))
                    map("n", "gD", "<CMD>Glance type_definitions<CR>", opts("Go to type definition"))
                    map("n", "gR", "<CMD>Glance references<CR>", opts("Go to references"))
                    map("n", "gi", "<CMD>Glance implementations<CR>", opts("Go to implementation"))

                    map("n", "<leader>lk", vim.lsp.buf.hover, opts("Show documentation"))
                    map("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end,
                        opts("Format current file"))
                    map("n", "<leader>lr", vim.lsp.buf.rename, opts("Rename symbol"))
                    map("n", "<leader>lD", vim.lsp.buf.type_definition, opts("Go to type definition"))
                    map("n", "<leader>lc", vim.lsp.buf.code_action, opts("Code action"))
                    map("n", "<leader>li", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
                    map("n", "<leader>lo", vim.lsp.buf.remove_workspace_folder,
                        opts("Remove workspace folder"))
                    map("n", "<leader>lp",
                        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
                        opts("List workspace folders"))
                    map("n", "<leader>ll",
                        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
                        opts("Toggle inlay hints"))
                end,
            })
        end
    },
}
