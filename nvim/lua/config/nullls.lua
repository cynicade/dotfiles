null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- lua
    -- formatting.stylua,

    -- js
    formatting.prettier.with({ extra_args = { "--tab-width 2", "--arrow-parens avoid" } }),

    -- python
    formatting.black.with({ extra_args = { "--fast" } }),
    diagnostics.flake8,

    -- cpp
    formatting.clang_format,

    -- go
    formatting.gofmt,
  },
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end,
})
