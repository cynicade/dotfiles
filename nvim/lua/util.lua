local function map(key)
  -- get the extra options
  local opts = { noremap = true }
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

local function switchBufNoTerm(dir)
  if dir == "next" then
    vim.cmd [[bnext]]
    if string.match(vim.fn.bufname(), "zsh") then
      vim.cmd [[bnext]]
    end
  else
    vim.cmd [[bprev]]
    if string.match(vim.fn.bufname(), "zsh") then
      vim.cmd [[bprev]]
    end
  end
end

return { map = map, eslint_config_exists = eslint_config_exists, switchBufNoTerm = switchBufNoTerm }
