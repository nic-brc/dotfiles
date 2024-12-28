vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "J", "mzJ`z")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Jump to previous/next item in quickfix/location list
vim.keymap.set('n', '<leader>k', '<cmd>lprev<cr>zz', { desc = 'Previous item in location list' })
vim.keymap.set('n', '<leader>j', '<cmd>lnext<cr>zz', { desc = 'Next item in location list' })
vim.keymap.set('n', '<leader>k', '<cmd>cprev<cr>zz', { desc = 'Previous item in qfixlist' })
vim.keymap.set('n', '<leader>j', '<cmd>cnext<cr>zz', { desc = 'Next item in qfixlist' })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Session Manager Searches
vim.keymap.set("n", "<leader><C-s>", "<cmd>SessionSearch<CR>")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<leader>64", "y:let @0=system('base64', @0)<cr>gvP")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>db", "<cmd>:tabnew<CR><cmd>:DBUI<CR>")

-- Obsidian Vault Keymaps
vim.keymap.set("n", "<leader>oo", ":SessionRestore ".. vim.env.HOME .. "/vaults/nic<cr>")
vim.keymap.set("n", "<leader>oat", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
vim.keymap.set("n", "<leader>on", function ()
  local test = vim.fn.input("Enter new inbox note name: ")
  vim.cmd("!.bin/on.sh " .. test)
end)

-- Obsidian Review Process
vim.keymap.set("n", "<leader>or", function ()
  vim.cmd("args inbox/*.md")
  vim.cmd("argdo tabe")
end)

vim.keymap.set("n", "<leader>ok", ":!mv '%:p' " .. vim.env.HOME .. "/vaults/nic/reviewed<cr>:bd<cr>")
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")
