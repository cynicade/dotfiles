local neotest = require("neotest")
local map = require('util').map

neotest.setup({
    adapters = {
        require("neotest-mocha")({
            -- command = "npx mocha src/**/*.spec.js",
            command = "npx mocha --ui bdd --",
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        }),
        -- require("neotest-vim-test")({
        --     allow_file_types = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
        -- }),
    },
    icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "",
        running = "",
        running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        skipped = "",
        unknown = ""
    },
    discovery = {
      concurrent = 0,
      enabled = true
    },
})

-- keybinds
map { 'n', '<leader>tt', '<cmd>lua require("neotest").run.run()<CR>' } -- run nearest
map { 'n', '<leader>tr', '<cmd>lua require("neotest").run.run_last()<CR>' } -- run last
map { 'n', '<leader>tc', '<cmd>lua require("neotest").run.stop()<CR>' } -- stop
map { 'n', '<leader>ta', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>' } -- run current file
map { 'n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<CR>' } -- toggle sidebar
map { 'n', '<leader>to', '<cmd>lua require("neotest").output.open()<CR>' } -- toggle sidebar
