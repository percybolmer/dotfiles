lspconfig = require "lspconfig"
util = require "lspconfig/util"
local rt = require("rust-tools")

local function on_attach(client, buffer)
    local keymap_opts = { buffer = buffer }
    -- Code navigation and shortcuts
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "gK", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
    vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, keymap_opts)

    -- Show diagnostic popup on cursor hover
    local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
      group = diag_float_grp,
    })

    -- Goto previous/next diagnostic warning/error
    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)
end

local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
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
  

-- Setup functions goes below per language
require("rust-tools").setup(opts)

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    on_attach = on_attach,
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
	  nilness = true,
	  unusedparams = true,
	  usenay = true,
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
lspconfig.svelte.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
-- deprecated
--lspconfig.sumneko_lua.setup({
--	on_attach = on_attach,
--})
lspconfig.tsserver.setup({
	on_attach = on_attach,
})
lspconfig.tsserver.setup({
	on_attach = on_attach,
})
lspconfig.eslint.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.marksman.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.cssls.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
  -- rust


lspconfig.dockerls.setup({
	on_attach = on_attach,
})
lspconfig.intelephense.setup({
	on_attach = on_attach,
})
lspconfig.eslint.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.marksman.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.cssls.setup({
	on_attach = on_attach,
	
	-- flags = lsp_flags,
})
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = { kubernetes = "globPattern" }
		}
	}
})
lspconfig.intelephense.setup({
	on_attach = on_attach,
	settings = {
		intelephense = {
			environment = { phpVersion = "5.6.40"},
		},
	}
})
