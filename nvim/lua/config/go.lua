require('go').setup({
  goimport = 'gopls',
  gofmt = 'gopls',
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
  -- was true before, in case something breaks
  lsp_cfg = true, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  dap_debug = true,
})

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
