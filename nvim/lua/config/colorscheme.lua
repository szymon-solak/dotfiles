local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

local theme = {}

theme.should_use_light_mode = false -- tonumber(os.date("%H")) < 16

if theme.should_use_light_mode then
	-- vim.cmd [[set background=light]]
	vim.g.catppuccin_flavour = 'latte'
else
-- 	vim.cmd [[set background=dark]]
	vim.g.catppuccin_flavour = 'frappe'
end

catppuccin.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

vim.cmd [[colorscheme catppuccin]]

return theme
