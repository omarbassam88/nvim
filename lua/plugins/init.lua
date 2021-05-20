local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

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
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        --[[
            UI
        ]]--

        -- Color
        use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
        require_plugin("nvcode-color-schemes.vim")

        -- Icons
        use {"kyazdani42/nvim-web-devicons", opt = true}
        require_plugin("nvim-web-devicons")
        -- Status line
        use {"glepnir/galaxyline.nvim", opt = true}
        require_plugin("galaxyline.nvim")

        -- Buffer Line
        use {"romgrk/barbar.nvim", opt = true}
        require_plugin("barbar.nvim")

        -- Dashboard
        use {"ChristianChiarulli/dashboard-nvim", opt = true}
        require_plugin("dashboard-nvim")

        -- Which Key
        use {"folke/which-key.nvim", opt = true}
        require_plugin("which-key.nvim")

        --[[
            Git Intergration
        --]]

        use {"lewis6991/gitsigns.nvim", opt = true}
        require_plugin("gitsigns.nvim")

        -- Telescope
        use {"nvim-lua/popup.nvim", opt = true}
        require_plugin("popup.nvim")
        use {"nvim-lua/plenary.nvim", opt = true}
        require_plugin("plenary.nvim")
        use {"nvim-telescope/telescope.nvim", opt = true}
        require_plugin("telescope.nvim")
        use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}

        -- Debugging
        use {"mfussenegger/nvim-dap", opt = true}
        --[[
            Treesitter
        --]]
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        require_plugin("nvim-treesitter")
        use {"windwp/nvim-ts-autotag", opt = true}
        require_plugin("nvim-ts-autotag")
        --[[
            Explorer
        --]]

        -- nvim tree
        use {"kyazdani42/nvim-tree.lua", opt = true}
        require_plugin("nvim-tree.lua")

        --[[
            LSP
        ]]--

        --nvim-lspconfig
        use {"neovim/nvim-lspconfig", opt = true}
        require_plugin("nvim-lspconfig")

        use {"glepnir/lspsaga.nvim", opt = true}
        require_plugin("lspsaga.nvim")

        use {"kabouzeid/nvim-lspinstall", opt = true}
        require_plugin("nvim-lspinstall")

        --[[
            AutoComplete
        ]]--

        use {"hrsh7th/nvim-compe", opt = true}
        require_plugin("nvim-compe")

        use {"hrsh7th/vim-vsnip", opt = true}
        require_plugin("vim-vsnip")

        use {"rafamadriz/friendly-snippets", opt = true}
        require_plugin("friendly-snippets")

        -- Auto Pairs
        use {"windwp/nvim-autopairs", opt = true}
        require_plugin("nvim-autopairs")

        -- Comment
        use {"terrortylor/nvim-comment", opt = true}
        require_plugin("nvim-comment")

end
)

