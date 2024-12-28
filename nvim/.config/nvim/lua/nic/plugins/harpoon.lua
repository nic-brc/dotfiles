return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    -- stylua: ignore
    keys = {
      { '<leader>ha', function() require('harpoon'):list():add() end,  desc = 'Add Location' },
      { '<C-s>',      function() require('harpoon'):list():next() end, desc = 'Next Location' },
      { '<C-p>',      function() require('harpoon'):list():prev() end, desc = 'Previous Location' },
      {
        '<Leader>hl',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'List locations'
      },
      { '<leader>1', ":lua require('harpoon.ui').nav_file(1)<CR>", },
      { '<leader>2', ":lua require('harpoon.ui').nav_file(2)<CR>", },
      { '<leader>3', ":lua require('harpoon.ui').nav_file(3)<CR>", },
      { '<leader>4', ":lua require('harpoon.ui').nav_file(4)<CR>", }
    },
  },
}
