local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
On_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local lsp = vim.lsp
  local handlers = lsp.handlers

  -- Hover doc popup
  local pop_opts = { border = "rounded", max_width = 80 }
  handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
  handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

  -- completion icons
  vim.lsp.protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "", -- TypeParameter
  }

  -- Diagnostic signs
  local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Information = " ",
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
    command = 'silent! EslintFixAll',
    group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
  })

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gvd", "<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- clash with pane navigation
  -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "L", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "J", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>Trouble document_diagnostics<CR>", opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
end
