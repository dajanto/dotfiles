return {
  -- Our leader is `q`. which-key's default `<auto>` triggers deliberately skip `q`
  -- (to preserve macro recording), so pressing `q` would record a macro instead of
  -- opening the menu. Registering `q` as an explicit trigger makes which-key intercept
  -- it (per buffer): `q` opens the menu and can't start a macro, while `q…` combos work.
  {
    "folke/which-key.nvim",
    opts = {
      triggers = {
        { "<auto>", mode = "nxso" },
        { "q", mode = "n" },
      },
    },
  },
}
