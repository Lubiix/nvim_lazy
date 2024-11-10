return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
				"roxma/LanguageServer-php-neovim",
        "saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
        "j-hui/fidget.nvim",
    },

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())
		require("luasnip.loaders.from_vscode").lazy_load({ include = { "php", "javascript" } })
		-- Définition de la fonction on_attach pour les keybindings
		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true }
			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

            -- Keybindings pour les fonctionnalités LSP
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
								--"phpactor",
								"ts_ls",
								"intelephense",
            },
            handlers = {
                function(server_name) -- default handler (optional)

                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,


				["ts_ls"] = function ()
					local lspconfig = require("lspconfig")
					lspconfig.ts_ls.setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}
				end,

				["intelephense"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.intelephense.setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							intelephense = {
								files = {
									maxSize = 5000000, -- Limite de taille de fichier pour l'analyse
								},
							},
						},
					}
				end,

			}
		})

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
			}, {
					{ name = 'buffer' },
				}),
			experimental = {
				native_menu = false,
				ghost_text = true,  -- Essayez d'activer `ghost_text` pour voir si cela aide.
			}
		})

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

