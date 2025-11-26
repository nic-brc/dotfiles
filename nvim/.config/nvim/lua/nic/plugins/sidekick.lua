local connectall_sqlbuilder =
  "Can you refactor this selection ```" ..
  "{selection}" ..
  "``` in {file} - {line} " ..
  "to use @dependent-models/config-util/src/main/java/com/go2group/connectall/config/dao/SqlBuilder.java Pattern. " ..
  "Also it have a look at @dependent-models/config-util/src/main/java/com/go2group/connectall/config/dao/DatabasePersistence.java to understand the usage. " ..
  "Feel free to edit directly to the file."

return {
  "folke/sidekick.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  ---@class sidekick.Config
  opts = {
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
      prompts = {
        maintain = "Can you refactor this function {file}-{line} to make it more maintainable and readable?",
        refactor = "Can you refactor this selection {selection} in {file} to make it more maintainable and readable?",
        connectall_sqlbuilder = connectall_sqlbuilder,
      },
    },
    nex = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}
