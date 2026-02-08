require("oil").setup({
	use_default_keymaps = false,
	keymaps = {
		["<CR>"] = "actions.select",
		["-"] = { "actions.parent", mode = "n" },
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["g?"] = { "actions.show_help", mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
	},
})
