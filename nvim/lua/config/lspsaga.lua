local saga = require 'lspsaga'
local map = require('util').map

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

map {'n', 'K', '<silent>:Lspsaga hover_doc<CR>'}
