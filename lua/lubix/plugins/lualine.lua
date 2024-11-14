return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'ryanoasis/vim-devicons','nvim-tree/nvim-web-devicons' }, -- Ajoute les icônes
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto', -- Utilisez 'auto' ou un thème de votre choix
		  icons_enables = true,
          section_separators = '', -- Pas de séparateurs supplémentaires
          component_separators = '', -- Pas de séparateurs entre les composants
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end
  }
}

