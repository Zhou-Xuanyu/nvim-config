return {
    "jpalardy/vim-slime",
    init = function()
        vim.g.slime_target = "tmux"
        -- Send to the previously active tmux pane; <C-c>v changes it.
        vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
        -- Paste multi-line blocks as one unit (IPython handles this well).
        vim.g.slime_bracketed_paste = 1
    end,
}
