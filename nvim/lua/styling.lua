
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
-- Line numbers and line endings
vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
vim.wo.number = true

require("tokyonight").setup({
	style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  	transparent = true, -- Enable this to disable setting the background color
  	terminal_colors = true,
	  styles = {
  	  -- Background styles. Can be "dark", "transparent" or "normal"
  	  sidebars = "transparent", -- style for sidebars, see below
  	  floats = "transparent", -- style for floating windows
  	},
})

-- Remove Background for NvimTree
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=none guifg=none")
vim.cmd[[colorscheme tokyonight]]
