
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- better window movement
Map('n', '<C-h>', '<C-w>h', {silent = true})
Map('n', '<C-j>', '<C-w>j', {silent = true})
Map('n', '<C-k>', '<C-w>k', {silent = true})
Map('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
Map('n', '<C-Up>', ':resize -2<CR>', {silent = true})
Map('n', '<C-Down>', ':resize +2<CR>', {silent = true})
Map('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
Map('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- better indenting
Map('v', '<', '<gv', {noremap = true, silent = true})
Map('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
Map('i', 'jk', '<ESC>', {noremap = true, silent = true})
Map('i', 'kj', '<ESC>', {noremap = true, silent = true})
Map('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
Map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
Map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
Map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
Map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')


-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])
