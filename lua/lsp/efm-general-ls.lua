local python_arguments = {formatCommand = "yapf --quiet", formatStdin = true}

local lua_arguments = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

local sh_arguments = {}

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local tsserver_args = {prettier}

local markdownPandocFormat = {}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        "lua", "python", "javascriptreact", "javascript", "typescript", "typescriptreact", "sh", "html", "css", "json",
        "yaml", "markdown", "vue"
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = python_arguments,
            lua = lua_arguments,
            sh = sh_arguments,
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
            typescript = tsserver_args,
            typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            markdown = {markdownPandocFormat}
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
        }
    }
}
