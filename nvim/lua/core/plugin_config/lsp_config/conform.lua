require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "pint" },
    html = { "prettier" },
    css = { "prettier" },
    blade = { "prettier" },
    cs = { "csharpier" },
    ["*"] = { "codespell" },
  }
})
