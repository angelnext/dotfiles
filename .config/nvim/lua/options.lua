local set = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.g.mapleader = ","

--[[ vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
	  if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint(args.buf, true)
		end
	end,
}) ]]
--
