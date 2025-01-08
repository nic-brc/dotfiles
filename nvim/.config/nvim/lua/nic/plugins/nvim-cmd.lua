return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = { preset = "default" },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				-- 					{ name = "nvim_lsp" },
				-- 					{ name = "copilot" },
				-- 					{ name = "luasnip" }, -- For luasnip users.
				-- 					{ name = "path" },
				default = { "lsp", "buffer", "copilot", "snippets", "path" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}

-- return {
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		event = "InsertEnter",
-- 		dependencies = {
-- 			"hrsh7th/cmp-path", -- source for file system paths
-- 			{
-- 				"L3MON4D3/LuaSnip",
-- 				-- follow latest release.
-- 				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 				-- install jsregexp (optional!).
-- 				build = "make install_jsregexp",
-- 			},
-- 			"saadparwaiz1/cmp_luasnip", -- for autocompletion
-- 			"rafamadriz/friendly-snippets", -- useful snippets
-- 			"onsails/lspkind.nvim", -- vs-code like pictograms
-- 		},
-- 		config = function()
-- 			local cmp = require("cmp")
-- 			local luasnip = require("luasnip")
-- 			local lspkind = require("lspkind")
-- 			require("luasnip.loaders.from_vscode").lazy_load()
--
-- 			cmp.setup({
-- 				completion = {
-- 					completeopt = "menu,menuone,preview,noselect",
-- 				},
-- 				snippet = {
-- 					expand = function(args)
-- 						luasnip.lsp_expand(args.body)
-- 					end,
-- 				},
-- 				window = {
-- 					completion = cmp.config.window.bordered(),
-- 					documentation = cmp.config.window.bordered(),
-- 				},
-- 				formatting = {
-- 					format = lspkind.cmp_format({
-- 						maxwidth = 50,
-- 						ellipsis_char = "...",
-- 					}),
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 					["<C-Space>"] = cmp.mapping.complete(),
-- 					["<C-e>"] = cmp.mapping.abort(),
-- 					["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 				}),
-- 				sources = cmp.config.sources({
-- 					{ name = "nvim_lsp" },
-- 					{ name = "copilot" },
-- 					{ name = "luasnip" }, -- For luasnip users.
-- 					{ name = "path" },
-- 				}),
-- 			})
-- 		end,
-- 	},
-- }
--
