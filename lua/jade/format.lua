vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer (LSP)" })
