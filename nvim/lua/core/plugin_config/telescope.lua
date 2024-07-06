local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
     file_ignore_patterns = {
        "node_modules", "build", "dist", "yarn.lock",
     },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "*" }
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}

require("telescope").load_extension("ui-select")

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
