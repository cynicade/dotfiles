require("nvim-lsp-installer").setup({
  ensure_installed = { "pyright", "rust_analyzer", "tsserver", "gopls", "clangd", "sumneko_lua" },
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})
require('config.lspconfig')
