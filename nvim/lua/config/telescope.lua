require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"
require("telescope").load_extension "projects"

require('telescope').setup {
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
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = require('telescope.actions').delete_buffer + require('telescope.actions').move_to_top,
        },
        n = {
          ["d"] = require('telescope.actions').delete_buffer + require('telescope.actions').move_to_top,
        }
      }
    }
  }
}
