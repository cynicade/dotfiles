require('catppuccin').setup({
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  },
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = { "bold" },
    keywords = {},
    strings = {},
    variables = { "bold" },
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = {"italic"},
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = true,
    gitsigns = true,
    telescope = {
      enabled = true,
      transparent_panel = false,
    },
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = false,
  }
})

vim.g.catppuccin_flavour = "mocha"
vim.cmd [[colorscheme catppuccin]]
