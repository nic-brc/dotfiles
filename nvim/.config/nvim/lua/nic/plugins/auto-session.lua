return {
	{
		"rmagatti/auto-session",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local autosession = require("auto-session")


			autosession.setup({
				auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
        auto_clean_after_session_restore = true,
			})

			-- Session Manager Searches
			vim.keymap.set("n", "<leader><C-s>", "<cmd>SessionSearch<CR>")
		end,
	},
}
