--                          _______           _
--                         (  ____ \|\     /|( (    /|
--                         | (    \/( \   / )|  \  ( |
--                         | |       \ (_) / |   \ | |
--                         | |        \   /  | (\ \) |
--                         | |         ) (   | | \   |
--                         | (____/\   | |   | )  \  |
--                         (_______/   \_/   |/    )_)
--

------------------------------------------------------------------------------
-- General
------------------------------------------------------------------------------
local set = vim.opt
local cmd = vim.cmd

set.backup = false
set.clipboard = "unnamedplus"
set.completeopt = "menu,menuone,noselect"
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
-- set.sidescrolloff = 8
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

cmd [[
    au! BufWritePost $MYVIMRC source %

    " filetype autocmd settings
    autocmd FileType python setlocal shiftwidth=4 softtabstop=4
    autocmd FileType python map <leader>br :up<CR>:execute 'silent !tmux select-pane -t {last} && tmux send-keys -R Up Enter && tmux select-pane -t {last}'<CR><CR>
    autocmd FileType sh map <leader>br :up<CR>:execute 'silent !tmux select-pane -t {last} && tmux send-keys -R Up Enter && tmux select-pane -t {last}'<CR><CR>
    autocmd FileType lua setlocal shiftwidth=2 softtabstop=2
    autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2
    autocmd FileType cpp map <leader>br :execute 'silent !tmux select-pane -t {last} && tmux send-keys -R Up Enter'<CR>
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType haskell map <buffer> <leader>br :w<CR>:terminal ghci<CR>
    autocmd FileType nusmv setlocal shiftwidth=2 softtabstop=2
    autocmd FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
]]
------------------------------------------------------------------------------
-- Keymaps
------------------------------------------------------------------------------

require('maps')

------------------------------------------------------------------------------
-- Plugins
------------------------------------------------------------------------------

require('plugins')

------------------------------------------------------------------------------
-- Hack kek
------------------------------------------------------------------------------
cmd [[
  let g:material_style = "palenight"
]]
