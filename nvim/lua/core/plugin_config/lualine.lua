require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'onedark'
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 1,
			}
		}
	}
}
