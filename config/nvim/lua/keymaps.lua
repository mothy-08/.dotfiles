local map = vim.keymap.set

-- basics
map("n", "<ESC>", ":nohlsearch<CR>", { silent = true })

-- navigation
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")

-- file/explorer & undo tree
map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>g", ":Pick grep_live<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- diagnostics
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<leader>l", vim.diagnostic.setloclist)
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
