vim.lsp.config("lua_ls", { settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } } })
-- not necessary because of mason-lspconfig
-- vim.lsp.enable({ "lua_ls", "pyright" })
