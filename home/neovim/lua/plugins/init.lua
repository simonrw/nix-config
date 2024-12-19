return {
    { "folke/which-key.nvim", lazy = true },
      { "folke/noice.nvim"},

      { "catppuccin/nvim", name = "catppuccin", priority = 1000 , config = function()
	      vim.cmd([[colorscheme catppuccin-macchiato]])
      end},

      { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
      {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
      config = function()
	    local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "rust", "python" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })

      end,
      },


  }
