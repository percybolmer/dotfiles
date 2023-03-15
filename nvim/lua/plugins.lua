return require('packer').startup(function(use)
	-- Configurations will go here
	use 'wbthomason/packer.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	-- Hrsh7th Code Completion Suite
    	use 'hrsh7th/nvim-cmp' 
    	use 'hrsh7th/cmp-nvim-lsp'
    	use 'hrsh7th/cmp-nvim-lua'
    	use 'hrsh7th/cmp-nvim-lsp-signature-help'
    	use 'hrsh7th/cmp-path'                              
    	use 'hrsh7th/cmp-buffer'                            
	  use {
    		'hrsh7th/cmp-vsnip',
    		after = 'nvim-cmp',
    		requires = {
      			'hrsh7th/vim-vsnip',
			
			'hrsh7th/vim-vsnip-integ',
      			{
        		'rafamadriz/friendly-snippets',
        		after = 'cmp-vsnip'
      			}
    		}
  	}
	-- vim-dadbod is for database handeling and ui --
	use 'tpope/vim-dadbod'
	use 'tpope/vim-dotenv'
	use 'kristijanhusak/vim-dadbod-completion'
	use 'kristijanhusak/vim-dadbod-ui'
	
	-- Harpoon for file navigation --
	use {
		'ThePrimeagen/harpoon',
		requires = "nvim-lua/plenary.nvim"
	}
	-- File explorer tree
    	use 'nvim-tree/nvim-web-devicons' -- optional, for file icons
	use 'nvim-tree/nvim-tree.lua'
	-- DAP for debugging
	use 'mfussenegger/nvim-dap'
	-- UI for DAP
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	-- themes for styling
	use 'Mofiqul/dracula.nvim'
	use 'folke/tokyonight.nvim'
	-- Treesitter
	use {
		-- recommended packer way of installing it is to run this function, copied from documentation
        	'nvim-treesitter/nvim-treesitter',
    		run = function()
            		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            		ts_update()
        	end,

	}
	use 'nvim-lua/plenary.nvim'
	-- Telescope used to fuzzy search files
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.0',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Lualine information / Status bar
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- Auto Pair to generate brackets etc
	use {
		"windwp/nvim-autopairs",
    		config = function() require("nvim-autopairs").setup {} end
	}
	-- Bufferline is a "header" with all opened buffers
	-- using packer.nvim
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	-- Indent guide
	use "lukas-reineke/indent-blankline.nvim"
	-- Floatterm to run lazygit
	use 'voldikss/vim-floaterm'
	-- Linter
	use 'mfussenegger/nvim-lint'

	-- Rust
	use 'simrat39/rust-tools.nvim'

	-- Trouble (VSCODE error bar)
	use 'folke/trouble.nvim'

	-- TODO comments
	use {
	  "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim",
	}
	-- Session to remember opened files and position in projects
	use {
	  'rmagatti/auto-session',
	  config = function()
	    require("auto-session").setup {
		log_level = "error",
		auto_session_enabled = true,
		auto_restore_enabled = true,
		auto_save_enabled = true,
	    }
	  end
	}

	-- Transparency without hassle
	use({
	  "xiyaowong/nvim-transparent",
	  config = function()
	    require("transparent").setup {
	      enable = true,
	    }
	  end
	})
	-- Tag bar for quick nav in large files
	use 'preservim/tagbar'
	use {
	  'lewis6991/gitsigns.nvim',
	  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	}
end)
