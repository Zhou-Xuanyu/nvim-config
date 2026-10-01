return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
        -- paredit owns pair handling in lisps; both at once double-inserts
        disable_filetype = { "clojure", "fennel", "scheme", "lisp" },
    },
}
