-- Essential Setup
require('my-globals')
require('settings')
require('plugins')

require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
require('keymappings')
require('o-galaxyline')
require('o-compe')

-- LSP
require('lsp')
require('o-lspinstall')
require('lsp.lua-ls')


