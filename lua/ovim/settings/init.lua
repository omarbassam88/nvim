
Cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
Cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
Cmd('set inccommand=split') -- Make substitution work in realtime
Scopes.o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
Scopes.o.title = true
TERMINAL = Fn.expand('$TERMINAL')
Cmd('let &titleold="'..TERMINAL..'"')
Scopes.o.titlestring="%<%F%=%l/%L - nvim"
Scopes.w.wrap = O.wrap_lines -- Display long lines as just one line
Cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
Cmd('syntax on') -- syntax highlighting
Scopes.o.pumheight = 10 -- Makes popup menu smaller
Scopes.o.fileencoding = "utf-8" -- The encoding written to file
Scopes.o.encoding = "utf-8"
Scopes.o.cmdheight = 2 -- More space for displaying messages
Cmd('set colorcolumn=99999') -- fix indentline for now
Scopes.o.mouse = "a" -- Enable your mouse
Scopes.o.splitbelow = true -- Horizontal splits will automatically be below
Scopes.o.termguicolors = true -- set term gui colors most terminals support this
Scopes.o.splitright = true -- Vertical splits will automatically be to the right
Scopes.o.t_Co = "256" -- Support 256 colors
Scopes.o.conceallevel = 0 -- So that I can see `` in markdown files
Cmd('set ts=4') -- Insert 2 spaces for a tab
Cmd('set sw=4') -- Change the number of space characters inserted for indentation
Cmd('set expandtab') -- Converts tabs to spaces
Scopes.b.smartindent = true -- Makes indenting smart
Scopes.w.number = O.number -- set numbered lines
Scopes.w.relativenumber = O.relative_number -- set relative number
Scopes.w.cursorline = true -- Enable highlighting of the current line
Scopes.o.showtabline = 2 -- Always show tabs
Scopes.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
Scopes.o.backup = false -- This is recommended by coc
Scopes.o.writebackup = false -- This is recommended by coc
Scopes.w.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
Scopes.o.updatetime = 300 -- Faster completion
Scopes.o.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
Scopes.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw

-- Scopes.o.guifont = "Hack\\ Nerd\\ Font\\ Mono"
-- Scopes.o.guifont = "SauceCodePro Nerd Font:h17"
Scopes.o.guifont = "FiraCode Nerd Font:h17"

