local telescope = require('telescope.builtin')

local M = {}

M.setup = function()
  vim.keymap.set("n", "<Leader>ff", telescope.find_files)
  vim.keymap.set("n", "<Leader>fg", telescope.live_grep)
  vim.keymap.set("n", "<Leader>fb", telescope.buffers)
      vim.keymap.set("n", "<Leader>fl", telescope.current_buffer_fuzzy_find)
end

return M
