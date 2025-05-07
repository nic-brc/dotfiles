return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						hidden = true,
            theme = "ivy",
					},
				},
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"build",
						"dist",
						"yarn.lock",
						".git",
						".class",
					},
					path_display = {
						shorten = 2,
					},
					preview = {
						filesize_limit = 0.9999,
						timeout = 250,
					},
				},
			})

			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>pg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set("v", "<leader>pg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", { desc = "Search after seleciton" })

			keymap.set("n", "<leader>wd", require("telescope.builtin").diagnostics, { desc = "Show Workspace diagnostics" })
			keymap.set("n", "<leader>pw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
}
