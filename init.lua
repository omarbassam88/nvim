-- Essential Setup
-- Utility Functions
require('ovim.utils')

-- Default settings
require('ovim.default')
require('ovim.settings')

require('plugins')
-- require('nvim-tree')
require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
require('plugins.configs.galaxyline')
require('plugins.configs.dashboard')
require('plugins.configs.telescope')
require('plugins.configs.treesitter')
require('plugins.configs.compe')
require('plugins.configs.comment')
require('plugins.configs.format')
require('plugins.configs.colorizer')
require('plugins.configs.symbols')

require('plugins.configs.gitsigns')

require('plugins.configs.autopairs')
require('plugins.configs.ts-rainbow')
require('plugins.configs.indent-blankline')

-- LSP
require('lsp')
require('plugins.lspinstall')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.js-ts-ls')
-- require('lsp.dart-ls')
require("plugins.configs.flutter-tools")

-- Load keymappings
require('ovim.keymappings')
require('plugins.configs.whichkey')

-- Extra Message to confirm that everything loaded.
print('O-Vim Loaded Successfully')
