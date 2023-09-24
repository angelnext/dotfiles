local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<Leader>n", ":n<CR>", { desc = "New Buffer" })
map("n", "<Leader>z", ":ZenMode<CR>", { desc = "Toggle ZenMode" })
map("n", "<Leader>x", ":TroubleToggle<CR>", { desc = "Toggle Trouble Menu" })
map("n", "<Leader>b", ":Telescope buffers<CR>", { desc = "Order Buffers by Window Number" })
map("n", "<C-s>", ":w<CR>")
map("n", "<Leader>f", ":Telescope file_browser<CR>", { desc = "Find Files" })

require("which-key").register()
