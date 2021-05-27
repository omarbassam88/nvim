require("flutter-tools").setup {
--     experimental = { -- map of feature flags
-- 
--         lsp_derive_paths = true -- experimental: Attempt to find the user's flutter SDK
--     },
    flutter_path = "/home/omar/snap/flutter/common/flutter/bin/flutter",
    -- flutter_lookup_cmd = "echo /home/omar/snap/flutter/common/flutter/",
    widget_guides = {enabled = true},
    -- dev_log = {
    --     open_cmd = "tabedit" -- command to use to open the log buffer
    -- },
    outline = {
        open_cmd = "30vnew" -- command to use to open the outline buffer
    },
    closing_tags = {
        -- highlight = "ErrorMsg", -- highlight for the closing tag
        -- prefix = ">", -- character to use for close tag e.g. > Widget
        enabled = true -- set to false to disable
    },
    -- lsp = {on_attach = require('lsp').on_attach}
}
