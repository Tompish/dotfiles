require("tdawg")

require("lazy").setup(
	{
		{'nvim-telescope/telescope.nvim',
			branch = 'master' ,
			dependencies = { 'nvim-lua/plenary.nvim' },
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function ()
				local configs = require("nvim-treesitter")

				configs.setup({
					ensure_installed = {"lua", "vim", "query", "javascript", "html"},
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true }
				})
			end
		},
		{
			'preservim/nerdtree'
		},
		--{
		--	'williamboman/mason.nvim',
		--},
		--{
		--	'williamboman/mason-lspconfig.nvim',
		--},

		--LSP
		{
			'neovim/nvim-lspconfig'
		},
		--Autocompletion
		'L3MON4D3/LuaSnip',
		 'hrsh7th/cmp-nvim-lsp',
		 'hrsh7th/cmp-buffer',
		 'hrsh7th/cmp-path',
		 'hrsh7th/cmp-cmdline',
		 'hrsh7th/nvim-cmp',
		--Function signature
		'hrsh7th/cmp-nvim-lsp-signature-help',

		--multi cursor
		'mg979/vim-visual-multi',
		--Color schemes
		'tjdevries/colorbuddy.vim',
		--SQL
		'ellisonleao/gruvbox.nvim',
		{
			'kristijanhusak/vim-dadbod-ui',
			dependencies = {
				{ 'tpope/vim-dadbod', lazy = true },
				{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
			},
			cmd = {
				'DBUI',
				'DBUIToggle',
				'DBUIAddConnection',
				'DBUIFindBuffer',
			},
			init = function()
				-- Your DBUI configuration
				vim.g.db_ui_use_nerd_fonts = 1
			end
		}
	})

require("mylspconfig")
