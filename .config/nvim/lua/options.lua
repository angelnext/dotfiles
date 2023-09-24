local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.conceallevel = 2

set.number = true
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"
set.clipboard = "unnamedplus"

set.hidden = true
set.mouse = "a"

set.completeopt = { "menu", "menuone", "noselect" }

vim.g.mapleader = ","

local api = vim.api
local fn = vim.fn

api.nvim_create_augroup("WorkingDirectory", { clear = true })
api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.*" },
	callback = function()
		local path = fn.expand("%:h") .. "/"
		path = "cd " .. path
		api.nvim_command(path)
	end,
	group = "WorkingDirectory",
})
