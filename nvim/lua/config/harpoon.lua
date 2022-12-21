local map = require('util').map

-- map {'n', 'ff', '<cmd>Telescope file_browser<CR>'}
map { 'n', '<leader>hm', '<cmd>lua require("harpoon.mark").add_file()<CR>' }
map { 'n', '<leader>hq', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>' }
map { 'n', '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>' }
map { 'n', '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>' }
map { 'n', '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>' }
map { 'n', '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>' }
map { 'n', '<leader>5', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>' }
map { 'n', '<leader>6', '<cmd>lua require("harpoon.ui").nav_file(6)<CR>' }
map { 'n', '<leader>7', '<cmd>lua require("harpoon.ui").nav_file(7)<CR>' }
map { 'n', '<leader>8', '<cmd>lua require("harpoon.ui").nav_file(8)<CR>' }

require("harpoon").setup({
    global_settings = {
        mark_branch = true,
    }
})
