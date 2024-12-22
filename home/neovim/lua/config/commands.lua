vim.api.nvim_create_user_command("T", "split | resize 30 | term <args>", {
    complete = "shellcmd",
    force = true,
    nargs = "*",
})
