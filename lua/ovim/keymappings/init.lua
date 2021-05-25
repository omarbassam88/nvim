-- Define leader key to space
-- and call leader mapper
Map('n', '<Space>', '<Nop>')
Api.nvim_set_var('mapleader', ' ')

-- TODO for Ranger Integration
Map('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})
-- ]]--------------------[[--
--    Window Management   --
-- ]]--------------------[[--
-- better window movement
Map('n', '<C-h>', '<C-w>h', {silent = true})
Map('n', '<C-j>', '<C-w>j', {silent = true})
Map('n', '<C-k>', '<C-w>k', {silent = true})
Map('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
Cmd([[
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

-- resize windows with arrows
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
Cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
Cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- no hl
Map('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
Map('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Comments
Map("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
Map("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
Map("n", "<leader>c", ":BufferClose<CR>", {noremap = true, silent = true})

-- LSP
local opts = {noremap = true, silent = true}
Map('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
Map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
Map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
Map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
Map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
Map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
Map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- ]]--------------------[[--
--   which-key Mappings   --
-- ]]--------------------[[--

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
    ["/"] = "Comment",
    ["e"] = "Explorer",
    ["h"] = "No Highlight",
    w = {
        name = '+Window',
        o = {':only<CR>', 'Close all other windows'},
        c = {':close<CR>', 'Close current window'},
        h = {':split<CR>', 'Split horizontally'},
        v = {':vsplit<CR>', 'Split vertically'}
    },
    b = {
        name = '+Buffer',
        ['1'] = {':BufferGoto 1<CR>', 'Buffer 1'},
        ['2'] = {':BufferGoto 2<CR>', 'Buffer 2'},
        ['3'] = {':BufferGoto 3<CR>', 'Buffer 3'},
        ['4'] = {':BufferGoto 4<CR>', 'Buffer 4'},
        ['5'] = {':BufferGoto 5<CR>', 'Buffer 5'},
        ['6'] = {':BufferGoto 6<CR>', 'Buffer 6'},
        ['7'] = {':BufferGoto 7<CR>', 'Buffer 7'},
        ['8'] = {':BufferGoto 8<CR>', 'Buffer 8'},
        ['9'] = {':BufferLast<CR>', 'Last buffer'},
        c = {':BufferClose<CR>', 'Close buffer'},
        f = {':FormatWrite<CR>', 'Format buffer'},
        n = {':BufferNext<CR>', 'Next buffer'},
        i = {':BufferPick<CR>', 'Pick buffer'},
        p = {':BufferPrevious<CR>', 'Previous buffer'}
    },
    d = {
        name = "+Debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
        c = {"<cmd>DebugContinue<cr>", "Continue"},
        i = {"<cmd>DebugStepInto<cr>", "Step Into"},
        o = {"<cmd>DebugStepOver<cr>", "Step Over"},
        r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
        s = {"<cmd>DebugStart<cr>", "Start"}
    },
    g = {
        name = '+Git',
        o = {':LazyGit<CR>', 'Open LazyGit'},
        P = {':TermExec cmd="git pull"<CR>', 'Pull'},
        p = {':TermExec cmd="git push"<CR>', 'Push'},
        S = {'Stage hunk'},
        s = {':TermExec cmd="git status"<CR>', 'Status'},
        u = {'Undo stage hunk'},
        R = {'Reset buffer'},
        r = {'Reset hunk'},
        h = {'Preview hunk'},
        b = {'Blame line'}
    },
    f = {
        name = '+File',
        c = {':e $MYVIMRC<CR>', 'Edit Neovim configuration'},
        n = {'Create a new unnamed buffer'},
        f = {':Telescope find_files<CR>', 'Find files'},
        b = {':Telescope marks<CR>', 'Bookmarks'},
        W = {':Telescope live_grep<CR>', 'Find word'},
        t = {':Telescope help_tags<CR>', 'Help tags'},
        h = {':Telescope oldfiles<CR>', 'Recently opened files'},
        w = {':SudaWrite<CR>', 'Write file with sudo permissions'},
        r = {':SudaRead<CR>', 'Re-open file with sudo permissions'}
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    },
    t = {
        name = '+Toggle',
        s = {':Dashboard<CR>', 'Open start screen'},
        c = {':Telescope colorscheme<CR>', 'Change colorscheme'},
        e = {':NvimTreeToggle<CR>', 'Toggle Tree Explorer'},
        m = {':MinimapToggle<CR>', 'Toggle Minimap'},
        S = {':SymbolsOutline<CR>', 'Toggle Symbols view'},
        t = {':ToggleTerm<CR>', 'Toggle terminal'}
    },

    s = {
        name = "+Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    S = {name = "+Session", s = {"<cmd>SessionSave<cr>", "Save Session"}, l = {"<cmd>SessionLoad<cr>", "Load Session"}}
}

local wk = require("which-key")
wk.register(mappings, opts)
