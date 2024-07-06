local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.intelephense.setup({})
lspconfig.csharp_ls.setup({})
lspconfig.psalm.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n' }, '<space>ca', vim.lsp.buf.code_action, {})
