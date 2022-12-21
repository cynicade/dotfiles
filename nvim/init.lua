------------------------------------------------------------------------------
-- General
------------------------------------------------------------------------------
local set = vim.opt
local cmd = vim.cmd
local api = vim.api

set.backup = false
set.clipboard = "unnamedplus"
set.cmdheight = 0
set.completeopt = "menu,menuone,noselect"
set.cursorline = true
set.errorbells = false
set.expandtab = true
set.hidden = true
set.incsearch = true
set.list = true
set.listchars = "tab:▸ ,trail:·"
set.mouse = 'a'
set.number = true
set.redrawtime = 10000
set.relativenumber = true
set.ruler = true
set.scrolloff = 8
set.shiftwidth = 4
set.shortmess = set.shortmess + 'F'
set.showcmd = false
set.showmode = false
set.sidescrolloff = 2
set.signcolumn = "yes:2"
set.smartindent = true
set.softtabstop = 4
set.splitright = true
set.splitbelow = true
set.swapfile = false
set.tabstop = 4
set.termguicolors = true
set.undodir = vim.fn.stdpath('config') .. '/undodir'
set.undofile = true
set.updatetime = 300
set.wrap = false
set.exrc = true
set.secure = true

-- 2 spaces for selected filetypes
cmd([[ autocmd FileType json setlocal shiftwidth=2 tabstop=2 ]])

-- set cmdheight to 1 when recording a macro
api.nvim_create_autocmd("RecordingEnter", { command = "set cmdheight=1" })
api.nvim_create_autocmd("RecordingLeave", { command = "set cmdheight=0" })
------------------------------------------------------------------------------
-- Keymaps
------------------------------------------------------------------------------

require('maps')

------------------------------------------------------------------------------
-- Plugins
------------------------------------------------------------------------------

require('plugins')
