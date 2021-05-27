require'lspconfig'.dartls.setup {
    cmd = {"dart", "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot", "--lsp"},
    -- on_attach = require'lsp'.on_attach,
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = false,
        outline = true,
        suggestFromUnimportedLibraries = true
    }
}
