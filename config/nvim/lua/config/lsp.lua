local filetypes = {
	"html",
	"css",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}

local config = vim.lsp.config

config("lua_ls", { settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } } })
config("emmet_language_server", { filetypes = filetypes })
config("tailwindcss", { filetypes = filetypes })
config("html", { filetypes = { "html" } })
config("vtsls", { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } })

-- NOTE: I don't understand this for now, so I'll just comment it out
-- config(
-- 	"eslint_d",
-- 	{ filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro" } }
-- )

-- not necessary because of mason-lspconfig
-- vim.lsp.enable({ "lua_ls", "pyright" })
