-- Add Linter by file type
require('lint').linters_by_ft = {
	go = {golangcilint}
}
-- Add TryLint on bufferwrite as a auto command
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
