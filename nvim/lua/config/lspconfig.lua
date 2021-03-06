local nvim_lsp = require("lspconfig")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- disable tsserver formatting
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end

  -- disable gopls formatting
  if client.name == "gopls" then
    client.resolved_capabilities.document_formatting = false
  end

  -- disable clang formatting
  if client.name == "clangd" then
    client.resolved_capabilities.document_formatting = false
  end

  -- disable prisma formatting
  if client.name == "prismals" then
    client.resolved_capabilities.document_formatting = false
  end

  -- disable sumneko lua formatting
  -- if client.name == "sumneko_lua" then
  -- 	client.resolved_capabilities.document_formatting = false
  -- end

  -- format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.formatting_sync()
      end,
    })
  end

  -- format on save
  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
  --   -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  --   vim.api.nvim_command [[augroup END]]
  -- end

  -- vim.api.nvim_exec([[
  -- augroup FormatAutogroup
  -- autocmd!
  -- autocmd BufWritePost <buffer> FormatWrite
  -- augroup END
  -- ]], true)

  local lsp = vim.lsp
  local handlers = lsp.handlers

  -- Hover doc popup
  local pop_opts = { border = "rounded", max_width = 80 }
  handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
  handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

  -- completion icons
  vim.lsp.protocol.CompletionItemKind = {
    "???", -- Text
    "???", -- Method
    "???", -- Function
    "???", -- Constructor
    "???", -- Field
    "???", -- Variable
    "???", -- Class
    "???", -- Interface
    "???", -- Module
    "???", -- Property
    "???", -- Unit
    "???", -- Value
    "???", -- Enum
    "???", -- Keyword
    "???", -- Snippet
    "???", -- Color
    "???", -- File
    "???", -- Reference
    "???", -- Folder
    "???", -- EnumMember
    "???", -- Constant
    "???", -- Struct
    "???", -- Event
    "???", -- Operator
    "???", -- TypeParameter
  }

  -- Diagnostic signs
  local signs = {
    Error = "??? ",
    Warning = "??? ",
    Hint = "??? ",
    Information = "??? ",
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "L", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "J", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver", "gopls", "clangd", "sumneko_lua", "astro", "tailwindcss",
  "prismals" }
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" },
        },
      },
    },
  })
end
