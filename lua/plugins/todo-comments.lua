return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    keywords = {
      NOTE = { icon = "📝", color = "hint", alt = { "INFO" } },
      PERF = { icon = "⚡️", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      HACK = { icon = "🚨", color = "warning" },
    },
  },
}
