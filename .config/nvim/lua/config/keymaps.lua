-- JetBrains / IntelliJ-style keymaps layered on top of LazyVim.
--
-- Design notes:
--  * Uses the JetBrains **Windows/Linux** keymap (Ctrl-based) so a single set of
--    bindings works in Windows Terminal (WSL) and Ghostty (macOS). The Cmd key is
--    never used because a terminal does not deliver it to Neovim.
--  * Chords marked "[proto]" (Ctrl+Shift+..., Ctrl+., Ctrl+Alt+...) need Neovim >= 0.10
--    and a terminal that speaks the kitty keyboard protocol (Ghostty, or Windows
--    Terminal >= 1.25). If your terminal can't deliver them, LazyVim's <leader> maps
--    are the always-working fallback -- press <space> to discover them via which-key.
--  * We deliberately do NOT clobber load-bearing Vim keys: Ctrl+R (redo),
--    Ctrl+W (windows), Ctrl+D/Ctrl+U (scroll), Ctrl+V (visual block).

local map = vim.keymap.set

--------------------------------------------------------------------------------
-- Search / navigation (pickers) -- Snacks is LazyVim's built-in picker
--------------------------------------------------------------------------------

-- Search Everywhere: double-Shift is not mappable in a terminal, so Space Space.
map("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Search Everywhere (Smart)" })

-- Find in Path / grep across the project (Ctrl+Shift+F)                     [proto]
map({ "n", "x" }, "<C-S-f>", function() Snacks.picker.grep() end, { desc = "Find in Path (grep)" })

-- Go to File (Ctrl+Shift+N)                                                 [proto]
map("n", "<C-S-n>", function() Snacks.picker.files() end, { desc = "Go to File" })

-- Go to Symbol in file (Ctrl+N; JetBrains "Go to Class")
map("n", "<C-n>", function() Snacks.picker.lsp_symbols() end, { desc = "Go to Symbol (document)" })

-- Find Action / command palette (Ctrl+Shift+A)                             [proto]
map("n", "<C-S-a>", function() Snacks.picker.commands() end, { desc = "Find Action" })

-- Recent Files (Ctrl+E) -- overrides Vim's scroll-one-line
map("n", "<C-e>", function() Snacks.picker.recent() end, { desc = "Recent Files" })

-- Project tool window (Alt+1) -- reuse LazyVim's explorer toggle
map("n", "<M-1>", "<leader>e", { remap = true, desc = "Project Explorer" })

--------------------------------------------------------------------------------
-- Editing / code
--------------------------------------------------------------------------------

-- Reformat Code (Ctrl+Alt+L) -- conform (pint/prettier/...) with LSP fallback   [proto]
map({ "n", "x" }, "<C-A-l>", function()
  local ok = pcall(function() LazyVim.format({ force = true }) end)
  if not ok then
    pcall(function() require("conform").format({ async = true, lsp_format = "fallback" }) end)
  end
end, { desc = "Reformat Code" })

-- Comment line / selection (Ctrl+/). This overrides LazyVim's terminal toggle on
-- Ctrl+/, so the terminal moves to Alt+F12 (JetBrains) below. <C-_> is what older
-- terminals send for Ctrl+/.
map("n", "<C-/>", "gcc", { remap = true, desc = "Comment Line" })
map("x", "<C-/>", "gc", { remap = true, desc = "Comment Selection" })
map("n", "<C-_>", "gcc", { remap = true, desc = "Comment Line" })
map("x", "<C-_>", "gc", { remap = true, desc = "Comment Selection" })

-- Terminal (Alt+F12) -- since Ctrl+/ is now "comment"
map("n", "<M-F12>", function() Snacks.terminal() end, { desc = "Terminal" })
map("t", "<M-F12>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Move line / selection up & down (Alt+Shift+Up/Down)
map("n", "<M-S-Down>", "<cmd>execute 'move .+1'<cr>==", { desc = "Move Line Down" })
map("n", "<M-S-Up>", "<cmd>execute 'move .-2'<cr>==", { desc = "Move Line Up" })
map("i", "<M-S-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Line Down" })
map("i", "<M-S-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Line Up" })
map("x", "<M-S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Selection Down" })
map("x", "<M-S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Selection Up" })

-- Navigate Back / Forward (Ctrl+Alt+Left/Right -> jumplist)                 [proto]
map("n", "<C-A-Left>", "<C-o>", { desc = "Navigate Back" })
map("n", "<C-A-Right>", "<C-i>", { desc = "Navigate Forward" })

--------------------------------------------------------------------------------
-- LSP-dependent JetBrains keys -- set per-buffer once a language server attaches
--------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("jetbrains_lsp_keys", { clear = true }),
  callback = function(ev)
    local buf = ev.buf
    local function bmap(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc, silent = true })
    end

    -- Go to Declaration / Definition (Ctrl+B; gd also works in LazyVim)
    bmap("n", "<C-b>", function() Snacks.picker.lsp_definitions() end, "Go to Definition")
    -- Go to Implementation (Ctrl+Alt+B)                                     [proto]
    bmap("n", "<C-A-b>", function() Snacks.picker.lsp_implementations() end, "Go to Implementation")
    -- Go to Type Definition (Ctrl+Shift+B)                                  [proto]
    bmap("n", "<C-S-b>", function() Snacks.picker.lsp_type_definitions() end, "Go to Type Definition")
    -- Find Usages (Alt+F7)
    bmap("n", "<M-F7>", function() Snacks.picker.lsp_references() end, "Find Usages")
    -- Context Actions (Alt+Enter) & Quick Fix (Ctrl+.)                      [proto for Ctrl+.]
    bmap({ "n", "x" }, "<M-CR>", vim.lsp.buf.code_action, "Context Actions")
    bmap({ "n", "x" }, "<C-.>", vim.lsp.buf.code_action, "Quick Fix / Code Action")
    -- Rename (Shift+F6)
    bmap("n", "<S-F6>", vim.lsp.buf.rename, "Rename")
    -- Quick Documentation (Ctrl+Q; K also works)
    bmap("n", "<C-q>", function() vim.lsp.buf.hover() end, "Quick Documentation")
    -- Parameter Info (Ctrl+P in normal mode; insert-mode Ctrl+P stays completion)
    bmap("n", "<C-p>", function() vim.lsp.buf.signature_help() end, "Parameter Info")
  end,
})

--------------------------------------------------------------------------------
-- Ergonomics carried over from the old .vimrc
--------------------------------------------------------------------------------

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
map("n", "Y", "yg_", { desc = "Yank to end of line" })
map("x", "p", '"_dP', { desc = "Paste without yanking selection" })
map("n", "#", "*N", { desc = "Search word under cursor (forward)" })

-- German-keyboard ergonomics
map("n", "ö", "viB", { desc = "Select inside {}" })
map("n", "ä", "^", { desc = "First non-blank char" })

-- Ergodox half-page scroll
map("", "<PageUp>", "<C-u>", { desc = "Half page up" })
map("", "<PageDown>", "<C-d>", { desc = "Half page down" })

-- Misc utilities from .vimrc
map("n", "<F9>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<F2>", "<cmd>set spell<cr>", { desc = "Spell on" })
map("n", "<F3>", "<cmd>set nospell<cr>", { desc = "Spell off" })
map("n", "<F4>", "A✔️<esc>j^", { desc = "Append checkmark" })
map("n", "<F5>", '"=strftime("%c")<cr>P', { desc = "Insert date/time" })
map("n", "<F6>", ":s/", { desc = "Substitute (line)" })
map("n", "<F7>", ":%s/", { desc = "Substitute (file)" })

-- NOTE: intentionally NOT migrated (they conflict with the new space-leader /
-- LazyVim, or are rarely useful):
--  * `<space>` -> `/`   (space is now the leader key; use `/` to search)
--  * leader Y/X leetcode copy helpers (old leader was `q`)
--  * Q/q macro swap (LazyVim uses `q` to close special windows)
