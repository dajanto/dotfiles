return {
  -- Format PHP with Laravel Pint instead of the php extra's default (php-cs-fixer).
  -- Pint auto-detects a project's pint.json. Requires a `php` binary + pint installed.
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "pint" }
    end,
  },
}
