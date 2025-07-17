local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "solarized-osaka",
      },
    },

    -- Language support
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.lang.cpp" },

    -- Formatting & Linting
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- { import = "lazyvim.plugins.extras.linting.eslint" },

    -- Custom plugins
    { import = "plugins" },
  },

  defaults = {
    lazy = true, -- Enable lazy loading for better performance
    version = "*", -- Use stable versions when available
  },

  install = {
    colorscheme = { "solarized-osaka", "tokyonight", "habamax" },
  },

  checker = {
    enabled = true,
    notify = false, -- Disable notifications to avoid spam
    frequency = 3600, -- Check every hour instead of default
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit", -- Disable if you don't use % matching
        "matchparen", -- Disable if you don't want bracket highlighting
        "netrwPlugin", -- Disable if using telescope file browser
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
