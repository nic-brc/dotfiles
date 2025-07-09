return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	config = function()
		require("obsidian").setup({
      ui = {
          enable = false
      },
			completion = {
				nvim_cmp = false,
			},
			workspaces = {
				{
					name = "nic",
					path = "~/vaults/nic",
				},
			},
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M:%S",
			},
		})

		local cmp = require("cmp")
		cmp.register_source("obsidian", require("cmp_obsidian").new())
		cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
		cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
	end,
}
