return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "petertriho/nvim-scrollbar",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "folke/trouble.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "folke/twilight.nvim",
  "rcarriga/nvim-notify",
  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",
  "romgrk/barbar.nvim",
  "goolord/alpha-nvim",
  "NvChad/nvim-colorizer.lua",
  "windwp/nvim-autopairs",
  "folke/zen-mode.nvim",
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = 10,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      open_mapping = [[<leader>t]],
      shading_factor = 2,
      direction = "float",
      float_opts = { border = "rounded" },
    },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
}