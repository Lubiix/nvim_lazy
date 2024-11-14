return {

	--[[  {"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			transparent = true
		},
	config = function()
			--local color = "tokyonight"
			--vim.cmd.colorscheme(color)
			vim.cmd [[colorscheme tokyonight-moon]]
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	--vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#FFFFFF' })
	--vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FFFFFF' })
	--vim.api.nvim_set_hl(0, 'cursorlineNr', { fg='#76ABFF', bold=true })
	--vim.opt.colorcolumn = "80"
	--vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#555555]]
	--end } 
	--]]
	"catppuccin/nvim", name = "catppuccin", priority = 1000, config = function ()
		require("catppuccin").setup(
			{flavor = "mocha"}
		)
		vim.cmd.colorscheme "catppuccin"
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#FFFFFF' })
		vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FFFFFF' })
		vim.api.nvim_set_hl(0, 'cursorlineNr', { fg='#76ABFF', bold=true })
	end,
}
