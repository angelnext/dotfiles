local set = vim.keymap.set

set("n", "<C-s>", ":w<CR>")
set("n", "<A-c>", "<Cmd>BufferClose<CR>")
set("n", "<C-p>", "<Cmd>BufferPick<CR>")

for i = 1, 10 do
	set("n", "<A-" .. i .. ">", "<cmd>BufferGoto " .. i .. "<cr>")
end
