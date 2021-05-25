require("flutter-tools").setup {
    flutter_path = "/home/omar/snap/flutter/common/flutter/bin/flutter",
    flutter_lookup_cmd = "echo /home/omar/snap/flutter/common/flutter/",
    widget_guides = {enabled = true},
    -- dev_log = {
    --     open_cmd = "tabedit" -- command to use to open the log buffer
    -- },
    outline = {
        open_cmd = "30vnew" -- command to use to open the outline buffer
    },
    lsp = {on_attach = require('lspconfig').on_attach}
}
