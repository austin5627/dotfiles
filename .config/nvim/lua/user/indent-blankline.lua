local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    vim.notify("Indent Blankline Not Found")
    return
end

indent_blankline.setup {
    filetype_exclude = {'dashboard'},
}
