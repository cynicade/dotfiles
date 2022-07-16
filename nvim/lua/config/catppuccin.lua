require('catppuccin').setup({
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = "italic",
    conditionals = "NONE",
    loops = "NONE",
    functions = "bold",
    keywords = "NONE",
    strings = "NONE",
    variables = "bold",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "italic",
    operators = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = false,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = true,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
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

vim.g.catppucin_flavour = "mocha"
vim.cmd [[colorscheme catppuccin]]
