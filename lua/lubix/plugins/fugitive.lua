return {
  "tpope/vim-fugitive",
  lazy = false, -- Load on startup, set to true if you want lazy loading
  cmd = { "Git", "G" }, -- Optionally, load only on specific commands
  keys = { -- Optionally, map specific keys for fugitive commands
    { "<leader>gs", ":Git<CR>", desc = "Git status" },
  },
  config = function()
    -- Any fugitive-specific settings can be added here
  end,
}

