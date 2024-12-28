return {
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      { "nvim-telescope/telescope.nvim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true,        -- Enable debugging
      -- See Configuration section for rest
    },
    config = function()
      require("CopilotChat").setup({
        mappings = {
          reset = {
            normal = "<C-r>",
            insert = "<C-r>",
          },
        },
      })
    end,
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      -- Show help actions with telescope
      -- Show prompts actions with telescope
      {
        "<leader>ah",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>at",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "CopilotChat - Toggle",
      },
    },
  },
}
