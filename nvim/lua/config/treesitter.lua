require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "astro",
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "go",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "tsx",
    "typescript",
  },
  highlight = {
    enable = true
  }
}

require('nvim-autopairs').setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add a pair on that treesitter node
    javascript = { 'template_string' },
    java = false, -- don't check treesitter on java
  },
  enable_check_bracket_line = true
})

require 'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
