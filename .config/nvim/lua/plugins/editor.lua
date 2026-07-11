return {
  -- Replace in Path (JetBrains Ctrl+Shift+R). grug-far gives a project-wide
  -- search & replace UI. Lazy-loaded on the :GrugFar command.
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = {},
    keys = {
      { "<C-S-r>", "<cmd>GrugFar<cr>", desc = "Replace in Path" },
    },
  },
}
