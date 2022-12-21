local function dumb_fix()
  vim.bo.filetype = 'toggleterm'
end

require('toggleterm').setup {
  size = 40,
  open_mapping = [[<c-\>]],
  on_open = dumb_fix,
  hide_numbers = true,
  shade_terminals = false,
  -- shade_filetypes = { "none" },
  -- shading_factor = 2,
  start_in_insert = true,
  terminal_mappings = true,
  direction = 'float',
  close_on_exit = true,
  float_opts = {
    border = "single",
    winblend = 0,
  },
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
