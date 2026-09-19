return {
    {
        "Olical/conjure",
        ft = { "clojure" },
        lazy = true,
        init = function()
            vim.g["conjure#mapping#doc_word"] = "K"
        end,
    },
    {
        "julienvincent/nvim-paredit",
        ft = { "clojure" },
        opts = {
            indent = { enabled = true },
        },
    },
}
