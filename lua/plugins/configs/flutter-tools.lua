require("flutter-tools").setup {
    flutter_path = "/snap/bin/flutter",
    flutter_lookup_cmd = "dirname $(which flutter)",
    widget_guides = {enabled = true},
}
