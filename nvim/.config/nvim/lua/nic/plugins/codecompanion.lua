return {
	{
		"franco-ruggeri/codecompanion-spinner.nvim",
		dependencies = {
			"olimorris/codecompanion.nvim",
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
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
		config = function()
			local function read_system_prompt(filepath)
				local lines = vim.fn.readfile(filepath)
				return table.concat(lines, "\n")
			end

			local system_prompt_path = vim.fn.expand("~/.config/nvim/llm_prompts/code_companion.md")
			local system_prompt = read_system_prompt(system_prompt_path)

			require("codecompanion").setup({
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
					system_prompt = function(opts)
						local system_prompt = read_system_prompt(system_prompt_path)
						return system_prompt
					end,
				},
				prompt_library = {
					["My New Prompt"] = {
						strategy = "chat",
						description = "Some cool custom prompt you can do",
						prompts = {
							{
								role = "system",
								content = system_prompt,
							},
							{
								role = "user",
								content = system_prompt,
							},
						},
					},
				},
			})

			vim.keymap.set({ "v", "n" }, "<leader>aa", "<cmd>silent :CodeCompanionChat<CR>o", {})
			vim.keymap.set({ "v", "n" }, "<leader>ah", "<cmd>silent :CodeCompanionActions<CR>", {})
		end,
	},
}
