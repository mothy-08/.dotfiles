-- lua/plugins.lua

local plugins = {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/mbbill/undotree" },

  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = "v2.4.1",
    data = {
      build = { "make", "install_jsregexp" },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },

  { src = "https://github.com/rafamadriz/friendly-snippets" },

  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1.8.0",
    data = {
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
}

-- install + register plugins
vim.pack.add(plugins)

-- helper: extract directory name from src
local function plugin_name_from_src(src)
  return src:match("/([^/]+)$")
end

-- 1. load dependencies explicitly
for _, spec in ipairs(plugins) do
  if spec.data and spec.data.dependencies then
    for _, dep in ipairs(spec.data.dependencies) do
      vim.cmd("packadd " .. vim.fn.fnamemodify(dep, ":t"))
    end
  end
end

-- 2. run build steps ONCE, correctly
for _, spec in ipairs(plugins) do
  if spec.data and spec.data.build then
    local name = plugin_name_from_src(spec.src)
    local plugs = vim.pack.get({ name })
    local plug = plugs[name]

    if plug then
      local path = plug.path
      local marker = path .. "/.built"

      if not vim.loop.fs_stat(marker) then
        vim.system(spec.data.build, { cwd = path }):wait()
        vim.fn.writefile({}, marker)
      end
    end
  end
end
