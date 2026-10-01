return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        delay = 400,
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "buffer-local keymaps",
        },
    },
}
