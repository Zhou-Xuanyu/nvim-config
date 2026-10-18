return {
    "smart-splits-nvim/smart-splits.nvim",
    -- Not lazy: the tmux backend marks the pane as vim on load, which tmux.conf relies on.
    lazy = false,
    dependencies = {
        { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
    },
    config = function()
        local ss = require("smart-splits")
        -- at_edge defaults to 'wrap', matching the select-pane bindings in tmux.conf.
        ss.setup({ mux = { backend = "smart-splits-backend-tmux" } })

        -- Move between nvim splits and tmux panes with the same keys.
        vim.keymap.set("n", "<C-h>", ss.move_cursor_left, { desc = "Move to left split/pane" })
        vim.keymap.set("n", "<C-j>", ss.move_cursor_down, { desc = "Move to lower split/pane" })
        vim.keymap.set("n", "<C-k>", ss.move_cursor_up, { desc = "Move to upper split/pane" })
        vim.keymap.set("n", "<C-l>", ss.move_cursor_right, { desc = "Move to right split/pane" })

        vim.keymap.set("n", "<M-h>", ss.resize_left, { desc = "Resize split/pane left" })
        vim.keymap.set("n", "<M-j>", ss.resize_down, { desc = "Resize split/pane down" })
        vim.keymap.set("n", "<M-k>", ss.resize_up, { desc = "Resize split/pane up" })
        vim.keymap.set("n", "<M-l>", ss.resize_right, { desc = "Resize split/pane right" })
    end,
}
