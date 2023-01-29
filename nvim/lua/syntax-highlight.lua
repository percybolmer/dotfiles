require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "go", "lua", "rust", "toml", "svelte", "html", "javascript","scss","css", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    ident = { enable = true },
    rainbow = {
	enable = true,
	extended_mode = true,
	max_file_lines = nil,
    }
  },
}

-- Attach tree sitter folding to neovim
vim.opt.foldenable = false
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

