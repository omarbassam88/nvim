 local plugins_list = {

    --[[------------]]--
    --   Essentials   --
    --[[------------]]--

    -- Treesitter
    ['nvim-treesitter'] = {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    -- Use treesitter to autoclose and autorename html tag
    ['nvim-ts-autotag'] = {"windwp/nvim-ts-autotag", opt = true},

    --[[------------]]--
    --      UI        --
    --[[------------]]--

    -- Web-DevIcons
    ['nvim-web-devicons']    = {"kyazdani42/nvim-web-devicons", opt = true},

    -- Dashboard
    ['dashboard-nvim'] = {"ChristianChiarulli/dashboard-nvim", opt = true},

    -- Color Schemes
    ['nvcode-color-schemes.vim'] = { "christianchiarulli/nvcode-color-schemes.vim", opt = true },

    -- nvim tree
    ['nvim-tree.lua'] =  {"kyazdani42/nvim-tree.lua", opt = true},

    -- Status line
    ['galaxyline.nvim'] = {"glepnir/galaxyline.nvim", opt = true},

    -- Tab Bar
    ['barbar.nvim'] = {"romgrk/barbar.nvim", opt = true},

    -- Show Indentations Lines
    ['indent-blankline.nvim'] = {"lukas-reineke/indent-blankline.nvim", branch = 'lua' },



    -- Terminal (Toggle term)
    ['nvim-toggleterm.lua'] = {'akinsho/nvim-toggleterm.lua'},

	-- Viewer & finder for LSP symbols and tags
    ['symbols-outline.nvim'] = {'simrat39/symbols-outline.nvim'},

    -- Minimap (Requires code-minimap)
    ['minimap.vim'] = {'wfxr/minimap.vim'},

    -- Keybindings
    -- Which Key
    ['which-key.nvim'] = {"folke/which-key.nvim", opt = true},


    --[[------------]]--
    --      GIT       --
    --[[------------]]--
    -- gitsigns
    ['gitsigns.nvim'] = {"lewis6991/gitsigns.nvim", opt = true},

    -- integration with LazyGit
    ['lazygit.nvim'] = {'kdheepak/lazygit.nvim'},

    --[[------------]]--
    --      LSP       --
    --[[------------]]--

    --nvim-lspconfig
    ['nvim-lspconfig'] =  {"neovim/nvim-lspconfig"},

    ['lspsaga.nvim'] =  {"glepnir/lspsaga.nvim", opt = true},

    ['nvim-lspinstall'] = {"kabouzeid/nvim-lspinstall", opt = true},
    ['lsp_signature.nvim'] = {"ray-x/lsp_signature.nvim", opt = true},
    ['lspkind-nvim'] = {"onsails/lspkind-nvim", opt = true},


    --[[--------------]]--
    --   AutoComplete   --
    --[[--------------]]--
    ['nvim-compe'] = {"hrsh7th/nvim-compe", opt = true},

    ['vim-vsnip'] = {"hrsh7th/vim-vsnip", opt = true},

    ['friendly-snippets'] = {"rafamadriz/friendly-snippets", opt = true},

    -- Auto Pairs
    ['nvim-autopairs'] = {"windwp/nvim-autopairs", opt = true},

    -- Comment
    ['nvim-comment'] = {"terrortylor/nvim-comment", opt = true},

    -- Rainbow-ts-pairs
    ['nvim-ts-rainbow'] = {'p00f/nvim-ts-rainbow'},

    -- Surround
    ['vim-surround'] = { "tpope/vim-surround" },

    --[[------------]]--
    --     Finder     --
    --[[------------]]--

    -- Telescope
    ['popup.nvim'] = {"nvim-lua/popup.nvim", opt = true},
    ['plenary.nvim'] = {"nvim-lua/plenary.nvim", opt = true},
    ['telescope.nvim'] = {"nvim-telescope/telescope.nvim", opt = true},
    ['telescope-fzy-native.nvim'] = {"nvim-telescope/telescope-fzy-native.nvim", opt = true},

    -- Debugging
    ['nvim-dap'] = {"mfussenegger/nvim-dap", opt = true},

    -- Format
    ['format.nvim'] = {"lukas-reineke/format.nvim"},

    --[[-------------]]--
    --   Web-Related   --
    --[[-------------]]--

    -- colorizer
    ['nvim-colorizer.lua'] = {'norcalli/nvim-colorizer.lua'},
    -- REST Client
    ['vim-dot-http'] = {'bayne/vim-dot-http'},
    -- Emmet
    ['emmet-vim'] = {'mattn/emmet-vim'},

}


-- Default path for installing plugins
local install_path = Fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Check if Packer is installed and installs it if not
if Fn.empty(Fn.glob(install_path)) > 0 then
    Execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    Execute "packadd packer.nvim"
end

--- Helper Function
--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = Fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        Cmd("packadd " .. plugin)
    end
    return ok, err, code
end

Cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- Loop through Plugins
        for plugin, options in pairs(plugins_list) do
            use(options)
            require_plugin(plugin)
        end

end
)

