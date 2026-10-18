return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    {
      "<leader>o",
      function()
        -- size the outline so the code window ends exactly at the colorcolumn
        local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff
        local code_width = textoff + tonumber(vim.o.colorcolumn)
        -- -1 for the vertical separator
        require("outline.config").o.outline_window.width =
          math.max(20, vim.o.columns - code_width - 1)
        vim.cmd("Outline")
      end,
      desc = "Toggle outline",
    },
  },
  opts = {
    outline_window = {
      relative_width = false,
    },
  },
}
