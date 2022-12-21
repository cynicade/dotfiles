local lualine = require 'lualine'

lualine.setup {
  options = {
    theme = 'catppuccin',
    -- theme = require('material.lualine'),
    icons_enabled = true,
    -- component_separators = { left = '', right = ''},
    component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'branch', icon = '' }, 'diff',
      { 'diagnostics', sources = { 'nvim_diagnostic' } } },
    lualine_c = { 'filename' },
    lualine_x = { 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
