return {
  "neovim/nvim-lspconfig",
  opts = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "intelephense" },
    })
    lspconfig.emmet_ls.setup({
      on_attach = function(client, bufnr)
        local buf_set_option = vim.api.nvim_buf_set_option
        buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end,
      filetypes = { "blade", "html", "css" },
      flags = {
        debounce_text_changes = 150,
      },
    })
  end,
}
