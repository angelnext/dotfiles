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

require'lazy'.setup {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",  
  "startup-nvim/startup.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "rcarriga/nvim-notify",
  "nvim-lualine/lualine.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "voldikss/vim-floaterm",
  "lewis6991/gitsigns.nvim",
  "romgrk/barbar.nvim",
  'L3MON4D3/LuaSnip',
  'NvChad/nvim-colorizer.lua',
  'windwp/nvim-autopairs',
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
