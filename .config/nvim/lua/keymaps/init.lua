function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "<Leader>e", ":NvimTreeToggle<CR>")
Map("n", "<Leader>o", ":NvimTreeFocus<CR>")
Map("n", "<Leader>t", ":FloatermToggle<CR>")
Map('n', '<A-,>', ':BufferPrevious<CR>')
Map('n', '<A-.>', ':BufferNext<CR>')
Map('n', '<A-<>', ':BufferMovePrevious<CR>')
Map('n', '<A->>', ':BufferMoveNext<CR>')
Map('n', '<A-1>', ':BufferGoto 1<CR>')
Map('n', '<A-2>', ':BufferGoto 2<CR>')
Map('n', '<A-3>', ':BufferGoto 3<CR>')
Map('n', '<A-4>', ':BufferGoto 4<CR>')
Map('n', '<A-5>', ':BufferGoto 5<CR>')
Map('n', '<A-6>', ':BufferGoto 6<CR>')
Map('n', '<A-7>', ':BufferGoto 7<CR>')
Map('n', '<A-8>', ':BufferGoto 8<CR>')
Map('n', '<A-9>', ':BufferGoto 9<CR>')
Map('n', '<A-0>', ':BufferLast<CR>')
Map('n', '<A-p>', ':BufferPin<CR>')
Map('n', '<A-c>', ':BufferClose<CR>')
Map('n', '<C-p>', ':BufferPick<CR>')
Map('n', '<Leader>bb', ':BufferOrderByBufferNumber<CR>')
Map('n', '<Leader>bd', ':BufferOrderByDirectory<CR>')
Map('n', '<Leader>bl', ':BufferOrderByLanguage<CR>')
Map('n', '<Leader>bw', ':BufferOrderByWindowNumber<CR>')

require'which-key'.register {}

