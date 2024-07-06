local cmp = require("cmp")

local luasnip = require("luasnip")

-- loads vscode style snippets from installed plugins (e.g friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = { --confgure how nvim-cmp interacts with snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Tab>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({select = false}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim-lsp" },
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities
}

require('lspconfig')['intelephense'].setup {
  capabilities = capabilities
}

require('lspconfig')['csharp_ls'].setup {
  capabilities = capabilities
}
