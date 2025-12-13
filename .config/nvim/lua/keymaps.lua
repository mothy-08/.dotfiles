local map = vim.keymap.set

-- basics
map("n", "<ESC>", ":nohlsearch<CR>", { silent = true })
map("n", "<leader>o", ":update | :source<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>w", ":write<CR>")

-- map("n", "<leader>w", function()
-- 	vim.lsp.buf.format()
-- 	vim.cmd("write")
-- end)

-- navigation
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")

-- file/explorer
map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>g", ":Pick grep_live<CR>")
map("n", "<leader>h", ":Pick help<CR>")

-- diagnostics
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<leader>l", vim.diagnostic.setloclist)
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
