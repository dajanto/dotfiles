-- LazyVim already sets sensible defaults (relativenumber, cursorline, undofile,
-- ignorecase+smartcase, termguicolors, ...). Here we only add personal
-- preferences carried over from the old .vimrc.

local opt = vim.opt

-- German + English spell checking (toggle with F2/F3, see keymaps.lua). Spell is
-- kept OFF in code by default (LazyVim enables it for text/markdown). To force it
-- everywhere like the old .vimrc, set: opt.spell = true
opt.spelllang = { "de_de", "en_us" }

-- Keep more context around the cursor when scrolling (old .vimrc used 8).
opt.scrolloff = 8

-- NOTE on indentation: the old .vimrc used real tabs (noexpandtab, width 4).
-- For PHP/Laravel (Pint / PSR-12 = 4 spaces) and Vue/Nuxt/JS (Prettier = 2 spaces),
-- indentation is decided per project by the formatter and .editorconfig, so we keep
-- LazyVim's defaults (expandtab, shiftwidth=2). To force tabs again, uncomment:
-- opt.expandtab = false
-- opt.tabstop = 4
-- opt.shiftwidth = 4
