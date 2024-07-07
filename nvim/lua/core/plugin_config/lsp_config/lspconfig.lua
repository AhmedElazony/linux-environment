local lspconfig = require("lspconfig")

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
vim.keymap.set({ "n" }, "<space>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n" }, "<space>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<space>f", require("conform").format, {})

lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	flags = {
		debounce_text_changes = 150,
	},
})
lspconfig.csharp_ls.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	flags = {
		debounce_text_changes = 150,
	},
})
lspconfig.phpactor.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	flags = {
		debounce_text_changes = 150,
	},
})
lspconfig.intelephense.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	flags = {
		debounce_text_changes = 150,
	},
})
lspconfig.html.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	filetypes = { "blade", "html" },
	flags = {
		debounce_text_changes = 150,
	},
})
lspconfig.cssls.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	flags = {
		debounce_text_changes = 150,
	},
})
lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		local buf_set_option = vim.api.nvim_buf_set_option
		buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	flags = {
		debounce_text_changes = 150,
	},
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
