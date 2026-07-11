return {
  -- Keep the Gruvbox look from the old setup. Swap `colorscheme` below for
  -- "tokyonight" (LazyVim default) or add a Darcula theme for a PhpStorm vibe.
  { "ellisonleao/gruvbox.nvim", lazy = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
