require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "csharp_ls", "lua_ls" }
})
require("lspconfig").csharp_ls.setup{}
