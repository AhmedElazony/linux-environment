require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "php", "python", "c_sharp", "vim", "html", "css", "javascript"},

	-- Install parsers synchronously (only applied to 'enusre installed')
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
