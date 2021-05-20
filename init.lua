-- Essential Setup
-- Utility Functions
require('ovim.utils')

-- Default settings
require('ovim.default')
require('ovim.settings')

require('plugins')
require('nvim-tree')
require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
require('plugins.galaxyline')
require('plugins.dashboard')
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.whichkey")
require('plugins.compe')
require('plugins.comment')

require("plugins.gitsigns")

require('plugins.autopairs')
-- LSP
require('lsp')
require('plugins.lspinstall')
require('lsp.lua-ls')

-- Load keymappings
require('ovim.keymappings')

-- Extra Message to confirm that everything loaded.
print("O-Vim Loaded Successfully")
