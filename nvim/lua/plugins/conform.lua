return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      php = { "php-cs-fixer" },
      html = { "prettier" },
      css = { "prettier" },
      blade = { "tlint" },
      cs = { "csharpier" },
      ["*"] = { "codespell" },
    },
  },
}
