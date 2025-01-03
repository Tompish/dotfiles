require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls"}
})

local cmp = require("cmp")

local function up(fallback)
if cmp.visible() then
	cmp.select_next_item()
else
fallback()
end
end
local function down(fallback)
if cmp.visible() then
	cmp.select_prev_item()
else
fallback()
end
end

local function confirm(fallback)
if cmp.visible() then
	cmp.confirm()
else
fallback()
end
end

local function abort(fallback)
if cmp.visible() then
	cmp.abort()
else
	cmp.complete()
end
end

local function scroll_up(fallback)
if cmp.visible() then
	cmp.scroll_docs(-4)
else
fallback()
end
end

local function scroll_down(fallback)
if cmp.visible() then
	cmp.scroll_docs(4)
else
fallback()
end
end

local cmp_mappings = {
	['<C-j>'] = up,
	['<C-k>'] = down,
	['<C-f>'] = scroll_up,
	['<C-d>'] = scroll_down,
	['<Tab>'] = confirm,
	['<C-Space>'] = abort,
}

local cmp_cmd_mappings = {
	['<C-j>'] = cmp.mapping(up, { 'c' }),
	['<C-k>'] = cmp.mapping(down, { 'c' }),
	['<Tab>'] = cmp.mapping(confirm, { 'c' }),
	['<C-Space>'] = cmp.mapping(abort, { 'c' })
}
cmp.setup({
	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
	mapping = cmp_mappings,
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
	mapping = cmp_cmd_mappings,
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

