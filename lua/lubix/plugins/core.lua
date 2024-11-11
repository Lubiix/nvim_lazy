function ColorMyPencils(color)
color = color or "tokyonight"
vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

return {

  {"folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
		opts = {},
    config = function()
      -- load the colorscheme here
		ColorMyPencils()
    end,}
}
