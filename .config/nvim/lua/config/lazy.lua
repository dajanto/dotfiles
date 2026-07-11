-- Set leader keys and LazyVim toggles BEFORE lazy starts, so plugins/extras
-- pick them up correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- The LazyVim `lang.php` extra defaults to phpactor. Use Intelephense instead
-- (stronger completion/navigation). NOTE: rename & code-actions need Intelephense
-- Premium; for free refactoring switch this to "phpactor".
vim.g.lazyvim_php_lsp = "intelephense"

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
    -- LazyVim core + its default plugins (LSP via mason, Snacks picker,
    -- conform, blink.cmp, which-key, treesitter, ...)
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Language & tooling extras. Mason installs the servers automatically.
    -- IMPORTANT: typescript must be imported before vue (vtsls would otherwise crash).
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.vue" },
    { import = "lazyvim.plugins.extras.lang.php" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- Your own plugin specs / overrides (lua/plugins/*.lua)
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  install = { colorscheme = { "gruvbox", "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})
