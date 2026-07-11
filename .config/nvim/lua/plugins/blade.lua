return {
  -- Laravel Blade: filetype detection + treesitter grammar + formatter.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- *.blade.php -> filetype "blade"
      vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })
      -- "blade" ships in the nvim-treesitter parser registry, so we just request it
      -- (plus php_only for the embedded-PHP grammar). No custom parser registration
      -- needed on the current nvim-treesitter (main) branch.
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "blade", "php", "php_only", "html", "css", "javascript" })
    end,
  },

  -- Format Blade files with blade-formatter (installed via Mason in tooling.lua).
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.blade = { "blade-formatter" }
    end,
  },
}
