local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true,
    cwd = vim.fn.getcwd()
  }
end

require('formatter').setup({
  filetype = {
    javascript = {prettier},
    javascriptreact = {prettier},
    typescript = {prettier},
    typescriptreact = {prettier},
    go = {
      function()
        return {
          exe = "gofmt",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = "black",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = false
        }
      end
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = { "-style=llvm", vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true
        }
      end
    },
    sh = {
      function()
        return {
          exe = "beautysh",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = false
        }
      end
    },
  }
})
