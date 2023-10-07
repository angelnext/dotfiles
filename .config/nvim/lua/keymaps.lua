local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
map("n", "<Leader>o", ":NvimTreeFocus<CR>", { desc = "Focus Explorer" })
map("n", "<Leader>z", ":ZenMode<CR>", { desc = "Toggle ZenMode" })
map("n", "<Leader>x", ":TroubleToggle<CR>", { desc = "Toggle Trouble Menu" })
map("n", "<Leader>b", ":Telescope buffers<CR>", { desc = "Order Buffers by Window Number" })
map("n", "<C-s>", ":w<CR>")
map("n", "<A-n>", ":n ", { desc = "Create new file" })
map("n", "<A-h>", ":noh<CR>", { desc = "Clear search highlight" })
map(
	"n",
	"<Leader>f",
	"<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>",
	{ desc = "Find Files" }
)

require("which-key").register()
