return {
  -- Extra Mason tools not covered by any LazyVim extra.
  -- (Intelephense, prettierd, eslint_d, css-lsp are installed automatically by the
  -- php / prettier / eslint extras and the cssls server.)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "pint", -- Laravel Pint (PHP formatter) -- needs a `php` binary at runtime
        "blade-formatter", -- Blade template formatter
      })
    end,
  },
}
