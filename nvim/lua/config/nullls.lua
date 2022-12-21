null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
  formatting.eslint_d,
  diagnostics.eslint_d,
  formatting.prettierd
}

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = function(client)
		-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		client.server_capabilities.document_formatting = true
	end,
})
-- null_ls.setup({
--   sources = {
--     -- lua
--     -- formatting.stylua,

--     -- js
--     formatting.eslint_d.with({ extra_args = { "--tab-width 2", "--arrow-parens avoid" } }),

--     -- python
--     formatting.black.with({ extra_args = { "--fast" } }),
--     diagnostics.flake8,

--     -- cpp
--     formatting.clang_format,

--     -- go
--     formatting.gofmt,
--   },
--   on_attach = function()
--     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--   end,
-- })
