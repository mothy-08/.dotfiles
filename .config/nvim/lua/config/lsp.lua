local config = vim.lsp.config
config("lua_ls", { settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } } })
config("ts_ls", { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } })
config(
	"eslint",
	{ filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro" } }
)
config("emmet_language_server", {
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"vue",
		"htmlangular",
	},
})
config("html", { filetypes = { "html" } })

-- not necessary because of mason-lspconfig
-- vim.lsp.enable({ "lua_ls", "pyright" })
