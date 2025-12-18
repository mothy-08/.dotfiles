require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python" },
	highlight = { enable = true },
	modules = {},
	sync_install = false,
	ignore_install = {},
	auto_install = false,
})
