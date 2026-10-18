return {
    "stevearc/oil.nvim",
    -- Not lazy: it replaces netrw, so `nvim .` and `:e dir/` open oil.
    lazy = false,
    keys = {
        -- { "-", "<cmd>Oil<cr>", desc = "Open parent directory (oil)" },
        { "<leader>l", "<cmd>Oil<cr>", desc = "Open file explorer (oil)" },
    },
    opts = {
        default_file_explorer = true,
        -- No icon plugin installed; show permissions and size instead.
        columns = { "permissions", "size" },
        view_options = { show_hidden = true },
        -- Preview follows 'splitright' (off), which puts it on the left.
        keymaps = {
            ["<C-p>"] = { "actions.preview", opts = { split = "belowright" } },
        },
        -- Ask before applying edits, even simple ones.
        skip_confirm_for_simple_edits = false,
    },
    -- config = function(_, opts)
    --     local oil = require("oil")
    --     oil.setup(opts)
    --
    --     -- Open the preview whenever an oil buffer is entered.
    --     vim.api.nvim_create_autocmd("User", {
    --         pattern = "OilEnter",
    --         callback = vim.schedule_wrap(function(args)
    --             if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
    --                 oil.open_preview({ split = "belowright" })
    --             end
    --         end),
    --     })
    -- end,
}
