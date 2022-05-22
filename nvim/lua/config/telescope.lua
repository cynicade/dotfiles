require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    },
    file_ignore_patterns = { "node_modules", "undodir" }
  }
}
