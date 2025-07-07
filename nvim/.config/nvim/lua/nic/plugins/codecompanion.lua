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
		},
	},
}
