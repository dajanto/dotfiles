return {
  -- JetBrains colorscheme (Darcula & co.) -- matches the IntelliJ look.
  -- https://github.com/nickkadutskyi/jb.nvim
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true,  -- uncomment for a transparent background
      -- colorblind = false,  -- colorblind-friendly light palette
    },
  },

  -- Make jb the active colorscheme. Light/dark follows `:set background=light|dark`.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "jb",
    },
  },
}
