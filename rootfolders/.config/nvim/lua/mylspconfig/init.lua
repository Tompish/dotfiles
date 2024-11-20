require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "csharp_ls", "lua_ls"}
})


local cmp = require("cmp")
cmp.setup({
	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
	mapping = {
		['<C-j>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
			fallback()
			end
		end,
		['<C-k>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
			fallback()
			end
		end,
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.confirm()
			else
			fallback()
			end
		end,
		['<C-Space>'] = function(fallback)
			if cmp.visible() then
				cmp.abort()
			else
				cmp.complete()
			end
		end
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{
			name = 'nvim_lsp_signature_help'
		}
		},
		{
			{name = "buffer" }
		}
	)
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

-- Setup up vim-dadbod
cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})

local on_attach = function(_, _)
local map = function(key, command, desc)
	vim.keymap.set('n', key, command, {desc = "LSP: " .. desc})
end
	map('gd', require('telescope.builtin').lsp_definitions, 'Go To Definition')
	map('gr', require('telescope.builtin').lsp_references, 'Go To references')
	map('gI', require('telescope.builtin').lsp_implementations, 'Go To implementation')
	map('K', vim.lsp.buf.hover, 'Hover documentation')
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local omnisharp_bin = "Programming/LanguageServers/omnisharp-osx-arm64-net6.0/OmniSharp"
require("lspconfig").omnisharp_mono.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	{
		cmd = omnisharp_bin
	}
}

require("lspconfig").lua_ls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").rust_analyzer.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").angularls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").sqlls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

