vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	filters = { dotfiles = false, custom = { '^.git$' } },
	git = { enable = true, ignore = false, }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
