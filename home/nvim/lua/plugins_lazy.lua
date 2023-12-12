-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    performance = {
        -- allow nix packages
        rtp = {
            reset = false,
        },
    },
}

require("lazy").setup({
        'christoomey/vim-tmux-runner',
        'christoomey/vim-conflicted',

        -- language plugins
        'lepture/vim-velocity',
        'DingDean/wgsl.vim',
        'tweekmonster/django-plus.vim',
        'terrastruct/d2-vim',
        'arcticicestudio/nord-vim',

        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'VonHeikemen/lsp-zero.nvim', branch = 'v2.x'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},

        'nvim-lua/lsp-status.nvim',



        -- telescope
        { 'nvim-telescope/telescope.nvim',  branch = '0.1.x',
          dependencies = { 'nvim-lua/plenary.nvim' },
          config = function()
                local mappings = require('mappings')

                mappings.nnoremap('<leader>f', [[<cmd>lua require('telescope.builtin').git_files()<Cr>]])
                mappings.nnoremap('<leader>F', [[<cmd>lua require('telescope.builtin').find_files()<Cr>]])
                mappings.nnoremap('gb', [[<cmd>lua require('telescope.builtin').buffers()<Cr>]])
                mappings.nnoremap('<leader><space>', [[<cmd>lua require('telescope.builtin').live_grep()<Cr>]])
                mappings.nnoremap('<leader>/', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<Cr>]])

                require("telescope").setup({
                    defaults = {
                        layout_strategy = 'horizontal',
                        layout_config = {
                            prompt_position = 'top',
                        },
                        sorting_strategy = 'ascending',
                    },
                    pickers = {
                        git_files = {
                            disable_devicons = true,
                        },
                        find_files = {
                            disable_devicons = true,
                        },
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,
                            override_generic_sorter = true,
                            override_file_sorter = true,
                            case_mode = "smart_case",
                        },
                    }
                })

                require("telescope").load_extension("fzf")
            end,
        },

        'lewis6991/gitsigns.nvim',

        {
            'nvim-treesitter/nvim-treesitter-context',
            config = function()
                require('treesitter-context').setup({
                    max_lines = 5,
                })
            end,
        },


        {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup {
                    icons = false,
                    use_diagnostic_signs = false,
                    auto_preview = false,
                }

                vim.keymap.set("n", "yot", function() require('trouble').toggle() end, { remap = false })
            end
        },

        'stevearc/aerial.nvim',
        'nvim-lualine/lualine.nvim',

        -- use {
        --     'VonHeikemen/lsp-zero.nvim',
        --     branch = "v2.x",
        --     requires = {
        --         -- LSP Support
        --         { 'neovim/nvim-lspconfig' },
        --         { 'williamboman/mason.nvim' },
        --         { 'williamboman/mason-lspconfig.nvim' },

        --         -- Autocompletion
        --         { 'hrsh7th/nvim-cmp' },
        --         { 'hrsh7th/cmp-buffer' },
        --         { 'hrsh7th/cmp-path' },
        --         { 'saadparwaiz1/cmp_luasnip' },
        --         { 'hrsh7th/cmp-nvim-lsp' },
        --         { 'hrsh7th/cmp-nvim-lua' },

        --         -- Snippets
        --         { 'L3MON4D3/LuaSnip' },
        --     }
        -- }
}, opts)

