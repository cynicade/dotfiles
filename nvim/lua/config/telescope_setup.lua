local map = require('util').map

map { 'n', '<leader>ff', '<cmd>Telescope find_files<CR>' }
map { 'n', '<leader>fg', '<cmd>Telescope live_grep<CR>' }
map { 'n', '<leader>fb', '<cmd>Telescope buffers<CR>' }
map { 'n', '<leader>fh', '<cmd>Telescope help_tags<CR>' }
map { 'n', '<leader>fp', '<cmd>lua require("telescope").extensions.projects.projects{}<CR>' }
