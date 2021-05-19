-- Global Values used in settings.lua
O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'lunar',
    hidden_files = true,
    wrap_lines = true,
    number = true,
    relative_number = false,
    shell = 'bash',
	timeoutlen = 100,
    nvim_tree_disable_netrw = 0, -- "1 by default, disables netrw (must be set before plugin's packadd)

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },

    -- Dashboard
	dashboard = {
		custom_header = {
                   '  ██████╗       ██╗   ██╗██╗███╗   ███╗',
                   ' ██╔═══██╗      ██║   ██║██║████╗ ████║',
                   ' ██║   ██║█████╗██║   ██║██║██╔████╔██║',
                   ' ██║   ██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║',
                   ' ╚██████╔╝       ╚████╔╝ ██║██║ ╚═╝ ██║',
                   '  ╚═════╝         ╚═══╝  ╚═╝╚═╝     ╚═╝'
                                      
		},
		footer= {'Omar Bassam'}
	}

}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
