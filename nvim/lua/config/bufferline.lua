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
    buffer_close_icon = "",
    close_command = "bdelete %d",
    close_icon = "",
    indicator = {
      icon = " ",
      style = "icon",
    },
    left_trunc_marker = "",
    modified_icon = "●",
    right_mouse_command = "bdelete! %d",
    right_trunc_marker = "",
    show_close_icon = false,
    show_tab_indicators = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
    highlights = {
        fill = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
            gui = "",
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        buffer_selected = {
            gui = "",
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        separator = {
            guifg = { attribute = "bg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
            guifg = { attribute = "fg", highlight = "Special" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        separator_visible = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        close_button = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
            guifg = { attribute = "fg", highlight = "normal" },
            guibg = { attribute = "bg", highlight = "normal" },
        },
        close_button_visible = {
            guifg = { attribute = "fg", highlight = "normal" },
            guibg = { attribute = "bg", highlight = "normal" },
        },
    },
  }
}
