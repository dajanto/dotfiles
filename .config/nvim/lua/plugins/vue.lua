-- Vue / Nuxt fix.
--
-- @vue/language-server (vue_ls) 3.x does a hard `require("typescript")` from its own
-- node_modules. Because it declares `typescript: "*"` as a peer dep, npm installs the
-- native TypeScript 7 preview there, which lacks the classic `ts.server.protocol` API
-- and crashes vue_ls on startup:
--   TypeError: Cannot read properties of undefined (reading 'protocol')
-- Setting init_options.typescript.tsdk does NOT help (the crash is in the hard require).
-- The reliable fix is to pin the TypeScript *inside vue_ls's own package* to 5.x.
--
-- This file self-heals that (idempotent: only acts when TS major >= 6) and also exposes
-- :VueFixTs. Once upstream ships a TS7-compatible vue_ls, this whole file can be deleted.

local function pin_vue_typescript(notify)
  local dir = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server"
  local pj = dir .. "/node_modules/typescript/package.json"
  if vim.fn.filereadable(pj) == 0 then
    return
  end
  local content = table.concat(vim.fn.readfile(pj), "\n")
  local major = tonumber(content:match('"version"%s*:%s*"(%d+)'))
  if not major or major < 6 then
    return -- already on TS 5.x (or older) -> nothing to do
  end
  if notify then
    vim.notify("vue_ls: pinning bundled TypeScript to 5.x …", vim.log.levels.INFO)
  end
  vim.fn.jobstart({ "npm", "install", "typescript@5", "--silent", "--no-audit", "--no-fund" }, {
    cwd = dir,
    on_exit = function(_, code)
      vim.schedule(function()
        if code == 0 then
          vim.notify("vue_ls: TypeScript pinned to 5.x — restart Neovim.", vim.log.levels.INFO)
        else
          vim.notify("vue_ls: TS pin failed; run :VueFixTs manually.", vim.log.levels.WARN)
        end
      end)
    end,
  })
end

return {
  -- Point vue_ls at a stable TS 5.x tsdk too (harmless; helps project TS resolution).
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local hits =
        vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/vtsls/**/node_modules/typescript/lib", true, true)
      local tsdk = hits and hits[1]
      if tsdk and tsdk ~= "" then
        opts.servers = opts.servers or {}
        opts.servers.vue_ls = opts.servers.vue_ls or {}
        opts.servers.vue_ls.init_options = vim.tbl_deep_extend(
          "force",
          opts.servers.vue_ls.init_options or {},
          { typescript = { tsdk = tsdk } }
        )
      end
    end,
  },

  -- Register the self-heal (command + on startup + after any mason (re)install).
  {
    "mason-org/mason.nvim",
    opts = function()
      vim.api.nvim_create_user_command("VueFixTs", function()
        pin_vue_typescript(true)
      end, { desc = "Pin vue_ls's TypeScript to 5.x (fixes TS7 crash)" })

      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          pin_vue_typescript(false)
        end,
      })

      pcall(function()
        require("mason-registry"):on(
          "package:install:success",
          vim.schedule_wrap(function(pkg)
            if pkg and pkg.name == "vue-language-server" then
              vim.defer_fn(function()
                pin_vue_typescript(false)
              end, 500)
            end
          end)
        )
      end)
    end,
  },
}
