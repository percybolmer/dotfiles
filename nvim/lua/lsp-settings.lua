  lspconfig = require "lspconfig"
  util = require "lspconfig/util"

  lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
	  nilness = true,
	  unusedparams = true,
	  usenay = true,
          unusedparams = true,
        },
        staticcheck = true,
	gofumpt = true,
	usePlaceholders = true,
	experimentalPostfixCompletions = true,
      },
    },
  }

lspconfig.rust_analyzer.setup{}
-- Svelte
lspconfig.svelte.setup{}
lspconfig.eslint.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.marksman.setup{}
lspconfig.cssls.setup{}
  -- rust
  -- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
