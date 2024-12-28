return {
	{
		"git@github.com:nic-brc/rally.nvim.git",
    build = "./install.sh",
    config = function()
      require("rally").setup({})
      vim.keymap.set("n", "<leader>ry", "<cmd>RallyPromptSelector<cr>", {})
      vim.keymap.set("n", "<leader>ra", "<cmd>RallyOpenBranchArtifact<cr>", {})
    end
	},
  -- {
  --   dir = "~/projects/rally.nvim/",
  --   config = function()
  --     require("rally").setup()
  --     vim.keymap.set("n", "<leader>ry", "<cmd>RallyPromptSelector<cr>", {})
  --     vim.keymap.set("n", "<leader>ra", "<cmd>RallyOpenBranchArtifact<cr>", {})
  --   end
  -- }
}
