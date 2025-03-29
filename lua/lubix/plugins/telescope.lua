return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		require('telescope').setup({
			defaults = {
				mappings = {
					i = {
						["<Up>"] = false,
						["<Down>"] = false,
					},
					n = {
						["<Up>"] = false,
						["<Down>"] = false,
					},
				},
				preview = false,
				layout_config = {
					width = 0.53,
					height = 0.6,
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
					}
				},
			},
		})
		local builtin = require('telescope.builtin')
		--vim.keymap.set('n', '<leader>ff', builtin.find_files(), {})
		vim.keymap.set('n', '<leader>ff', function()
			require('telescope.builtin').find_files({ no_ignore = true })
		end, { desc = "Find files ignored" })
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>pws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>pWs', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
	end
}
