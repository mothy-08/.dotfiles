local o = vim.opt

-- core
o.number = true
o.relativenumber = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.wrap = false
o.signcolumn = "yes"

-- search
o.smartcase = true
o.ignorecase = true

-- clipboard, swap, UI
o.clipboard = "unnamedplus"
o.swapfile = false
o.winborder = "rounded"
o.showmatch = true
o.completeopt = "menu,menuone,noselect"
o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo"
o.fillchars:append({ eob = " " })
