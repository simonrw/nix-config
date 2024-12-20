return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        {path = "${3rd}/luv/library", words = {"vim%.uv"}}
                    }
                }
            }
        },
        config = function()
            require("lspconfig").lua_ls.setup {}
            local __binds = {
                {
                    action = vim.lsp.buf.type_definition,
                    key = "gy",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = vim.lsp.buf.implementation,
                    key = "gi",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = vim.lsp.buf.hover,
                    key = "<leader>k",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = vim.lsp.buf.rename,
                    key = "<leader>r",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = vim.diagnostic.goto_next,
                    key = "]d",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = vim.diagnostic.goto_prev,
                    key = "[d",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = function()
                        vim.lsp.buf.code_action({
                            source = {organizeImports = true}
                        })
                    end,
                    key = "<leader>a",
                    mode = "n",
                    options = {noremap = true, silent = true}
                }, {
                    action = vim.lsp.buf.signature_help,
                    key = "<C-h>",
                    mode = "i",
                    options = {noremap = true, silent = true}
                }
            }

            for _, map in ipairs(__binds) do
                vim.keymap.set(map.mode, map.key, map.action, map.options)
            end

            vim.lsp.inlay_hint.enable()
        end
    }
}
