return {
  "EdenEast/nightfox.nvim",
  lazy = false,  -- colorschemes should load eagerly
  config = function()
    local nightfox = require("nightfox")

    nightfox.setup({
      options = {
        styles = {
          comments = "italic",
          functions = "italic",
        },
      },
    })

    nightfox.load()
    vim.cmd("colorscheme nordfox")
  end,
}
