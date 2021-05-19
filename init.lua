-- Essential Setup
require('my-globals')
require('settings')
require('plugins')
require('nvim-tree')
require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
require('keymappings')
require('o-galaxyline')

require("o-treesitter")

require('o-compe')
require('o-comment')

require("o-gitsigns")

require('o-autopairs')
-- LSP
require('lsp')
require('o-lspinstall')
require('lsp.lua-ls')


