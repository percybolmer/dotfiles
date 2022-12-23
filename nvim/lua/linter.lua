  local lint = require('lint')
  --lint.linters.cargo = {
  --  cmd = 'cargo check',
  --  stdin = true,
  --  args = {},
  --  stream = 'both',
  --  ignore_exitcode = false,
  --  env = nil,
  --}
  -- Add Linter by File type
  lint.linters_by_ft = {
    go = {'golangcilint', 'revive'},
    --rust = {'cargo'},
  }
  -- Get golangcilint to configure it
  local golangcilint = require("lint.linters.golangcilint")
  golangcilint.args = {
    'run',
    '--out-format',
    'json',
    }

-- Add TryLint on bufferwrite as a auto command
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
