return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
			{ "nvim-lua/plenary.nvim" },
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = { "codecompanion" },
			},
			-- Test with blink.cmp
			{
				"saghen/blink.cmp",
			},
		},
		opts = {
			--Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
			strategies = {
				--NOTE: Change the adapter as required
				chat = { adapter = "gemini" },
				inline = { adapter = "gemini" },
			},
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					schema = {
						model = {
							default = "gemini-2.5-flash-preview-05-20",
						},
					},
					env = {
						api_key = "GEMINI_API_KEY",
					},
				})
			end,
			opts = {
				log_level = "DEBUG",
			},
			prompt_library = {
				["My New Prompt"] = {
					strategy = "chat",
					description = "Some cool custom prompt you can do",
					prompts = {
						{
							role = "system",
							content = "You are an experienced developer with Lua and Neovim",
						},
						{
							role = "user",
							content = "Can you explain why ...",
						},
					},
				},
			},
		},
		keys = {
			{
				"<leader>ah",
				"<cmd>CodeCompanionActions<cr>",
				mode = { "n", "v" },
				noremap = true,
				silent = true,
				desc = "CodeCompanion actions",
			},
			{
				"<leader>ac",
				"<cmd>CodeCompanionChat Toggle<cr>",
				mode = { "n", "v" },
				noremap = true,
				silent = true,
				desc = "CodeCompanion chat",
			},
		},
	},
}
