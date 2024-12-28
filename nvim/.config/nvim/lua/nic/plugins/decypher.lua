return {
	{
		"MisanthropicBit/decipher.nvim",
		config = function()
			require("decipher").setup()

			vim.keymap.set({ "n", "v" }, "<leader>enc", function()
				require("decipher").encode_selection_prompt()
			end)

			vim.keymap.set({ "n", "v" }, "<leader>dec", function()
				require("decipher").decode_selection_prompt()
			end)
		end,
	},
}
