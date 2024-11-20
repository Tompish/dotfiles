require("tdawg")

require("lazy").setup(
	{
		{'nvim-telescope/telescope.nvim',
			branch = '0.1.x' ,
			dependencies = { 'nvim-lua/plenary.nvim' },
			config = function()
				local builtin = require('telescope.builtin')
				vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
				vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			end
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function ()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "c_sharp", "lua", "vim", "query", "javascript", "html", "sql"},
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true }
				})
			end
		},
		{
			'preservim/nerdtree'
		},{
			'williamboman/mason.nvim',
		},
		{
			'williamboman/mason-lspconfig.nvim',
		},

		-- LSP
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
