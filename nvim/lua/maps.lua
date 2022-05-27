local map = require('util').map

-- set space as leader key
vim.g.mapleader = ' '

-- jump between spelits with C-hjkl
map { 'n', '<C-h>', ':wincmd h<CR>' }
map { 'n', '<C-j>', ':wincmd j<CR>' }
map { 'n', '<C-k>', ':wincmd k<CR>' }
map { 'n', '<C-l>', ':wincmd l<CR>' }

-- jk escape
map { 'i', 'jk', '<Esc>' }

-- tab scroll through buffers
-- map {'n', '<TAB>', ':bnext<CR>'}
map { 'n', '<TAB>', '<cmd>lua require("util").switchBufNoTerm("next")<CR>' }
-- map {'n', '<S-TAB>', ':bprevious<CR>'}
map { 'n', '<S-TAB>', '<cmd>lua require("util").switchBufNoTerm("prev")<CR>' }

-- better tabbing
map { 'v', '<', '<gv' }
map { 'v', '>', '>gv' }

-- gf opens non-existent files
map { 'n', 'gf', ':e <cfile><CR>' }

-- maintain the cursor position when yanking a visual selection
map { 'v', 'y', 'myy`y' }
map { 'v', 'Y', 'myY`y' }

-- paste replace visual selection without copying it
map { 'v', '<leader>p', '"_dP' }

-- make Y behave like the other capitals
map { 'n', 'Y', 'y$' }

--keep it centered
map { 'n', 'n', 'nzzzv' }
map { 'n', 'N', 'Nzzzv' }
map { 'n', 'J', 'mzJ`z' }

-- easy insertion of a trailing ; or , from insert mode
map { 'i', ';;', '<Esc>A;<Esc>' }
map { 'i', ',,', '<Esc>A,<Esc>' }

-- open and reload init.lua
map { 'n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>' }
map { 'n', '<leader>vr', ':source ~/.config/nvim/init.lua<CR>' }

-- nvimtree
map { 'n', '<leader>e', ':NvimTreeToggle<CR>' }
