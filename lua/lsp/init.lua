-- taken from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local nvim_lsp = require('lspconfig')
-- Snippets support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Lsp Symbols
Fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
Fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
Fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})
Fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})

-- Add Diagnostics as virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = "", spacing = 0},
        signs = true,
        underline = true
    })

-- Signature help
require('lsp_signature').on_attach()

-- Vscode-like pictograms on completion
require('lspkind').init({
    with_text = true,
    symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
    }
})

local on_attach = function(client, bufnr)
    local function buf_set_option(...) Api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    local opts = {noremap = true, silent = true}
    -- Map(
    -- 	'n',
    -- 	'<space>wa',
    -- 	'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
    -- 	opts
    -- )
    -- Map(
    -- 	'n',
    -- 	'<space>wr',
    -- 	'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
    -- 	opts
    -- )
    -- Map(
    -- 	'n',
    -- 	'<space>wl',
    -- 	'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    -- 	opts
    -- )
    -- Map(
    -- 	'n',
    -- 	'<space>D',
    -- 	'<cmd>lua vim.lsp.buf.type_definition()<CR>',
    -- 	opts
    -- )
    -- Map(
    -- 	'n',
    -- 	'<space>rn',
    -- 	'<cmd>lua vim.lsp.buf.rename()<CR>',
    -- 	opts
    -- )
    -- Map(
    -- 	'n',
    -- 	'<space>le',
    -- 	'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    -- 	opts
    -- )
    Map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    Map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- Map(
    -- 	'n',
    -- 	'<space>q',
    -- 	'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
    -- 	opts
    -- )
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        Map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    elseif client.resolved_capabilities.document_range_formatting then
        Map('n', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
    end
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        Api.nvim_exec([[
        hi LspReferenceRead ctermbg=237 guibg=#464646
        hi LspReferenceText ctermbg=237 guibg=#464646
        hi LspReferenceWrite ctermbg=237 guibg=#464646
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false)
    end
end

--[[-----------------]]
--
--      LSP Setup      --
-- ]]-----------------[[--
-- https://github.com/kabouzeid/nvim-lspinstall#advanced-configuration-recommended
local function setup_servers()
    -- Provide the missing :LspInstall
    require('lspinstall').setup()
    local servers = require('lspinstall').installed_servers()
    for _, server in pairs(servers) do
        nvim_lsp[server].setup({on_attach = on_attach})
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function()
    setup_servers() -- reload installed servers
    Cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
--
