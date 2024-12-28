return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = { additional_vim_regex_highlighting = { "markdown" }, enable = true },
				indent = { enable = true },
				autotag = {
					enable = true,
				},
			})
		end,
	},
}
