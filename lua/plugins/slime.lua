return {
    "jpalardy/vim-slime",
    init = function()
        vim.g.slime_target = "tmux"
        -- Send to the tmux window named "repl" in this session; <C-c>v changes it.
        vim.g.slime_default_config = { socket_name = "default", target_pane = ":repl" }
        vim.g.slime_dont_ask_default = 1
        -- Paste multi-line blocks as one unit (IPython handles this well).
        vim.g.slime_bracketed_paste = 1
    end,
}
