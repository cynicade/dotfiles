require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    custom_filter = function(buf_number, buf_numbers)
      if not string.match(vim.fn.bufname(buf_number), "zsh") then
        return true
      end
    end,
    color_icons = true,
    show_buffer_icons = true,
    separator_style = "thin",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
  }
}
