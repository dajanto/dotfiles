return {
  -- Laravel helpers (Artisan runner, route/view navigation) -- closest thing to
  -- PhpStorm's Laravel plugin. Lazy-loaded on the :Laravel command / keys so it can
  -- never break startup. Most useful inside an actual Laravel project.
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>La", "<cmd>Laravel artisan<cr>", desc = "Laravel: Artisan" },
      { "<leader>Lr", "<cmd>Laravel routes<cr>", desc = "Laravel: Routes" },
      { "<leader>Lm", "<cmd>Laravel related<cr>", desc = "Laravel: Related" },
    },
    opts = {},
    config = true,
  },
}
