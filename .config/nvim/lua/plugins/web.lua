return {
  -- CSS / SCSS / LESS language server (no dedicated LazyVim extra) + Tailwind tweak.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {}, -- Mason installs "css-lsp" automatically
        tailwindcss = {
          -- Enable Tailwind IntelliSense inside Blade files. Vue/JS/TS are included
          -- by the tailwind extra already.
          filetypes_include = { "blade" },
        },
      },
    },
  },
  -- Treesitter parsers for stylesheets.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css", "scss" })
    end,
  },
}
