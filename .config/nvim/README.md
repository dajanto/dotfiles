# Neovim mit IntelliJ/JetBrains-Feeling (LazyVim)

Diese Neovim-Config ist [LazyVim](https://www.lazyvim.org) + eine eigene **JetBrains-Keymap-Ebene**.
Die JetBrains-Shortcuts zeigen auf echte IDE-Features (LSP, Snacks-Picker, conform, which-key), nicht
nur auf Tastenkombis.

## Voraussetzungen

| Tool | Zweck | Installation |
|---|---|---|
| Neovim ≥ 0.10 | Basis (kitty-Protokoll-Client) | linuxbrew: `brew install neovim` |
| ripgrep, fd | Find in Path / Dateisuche | `brew install ripgrep fd` |
| Node ≥ 18 (20+ empfohlen) | LSP-Server (intelephense, vue_ls, vtsls, …) | `brew install node` |
| php + composer | Laravel Pint (Format) & Artisan-Runtime | `brew install php composer` |

**Terminal:** Chords wie `Ctrl+.`, `Ctrl+Shift+F`, `Ctrl+Alt+L` brauchen das **kitty keyboard protocol**.
- **Ghostty** (macOS): standardmäßig aktiv ✓
- **Windows Terminal** (WSL): ab **v1.25** (März 2026) ✓ — vorher greifen die `q`-Fallbacks (Leader).

## Aktivierung

```sh
# Variante A: fest installieren (aus dem dotfiles-Repo). Sichert eine vorhandene
# ~/.config/nvim automatisch nach ~/.config/nvim.backup.<ts>
./install.sh

# Variante B: gefahrlos testen, ohne die bestehende Config anzufassen
ln -s ~/github/dotfiles/.config/nvim ~/.config/nvim-jb
NVIM_APPNAME=nvim-jb nvim
```

Beim ersten Start installiert LazyVim automatisch alle Plugins; die LSP-Server/Formatter kommen über
Mason (`:Mason`), Treesitter-Parser über `:TSInstall`.

## JetBrains-Tastenbelegung (Windows/Linux-Keymap, Ctrl-basiert)

**Leader = `q`**, **`Leertaste` = Suche** (`/`, wie in der alten `.vimrc`), Makro-Aufnahme ist aus.

`[proto]` = braucht kitty-Protokoll (Ghostty / Windows Terminal ≥ 1.25).

| Aktion | Shortcut | | Aktion | Shortcut |
|---|---|---|---|---|
| Search Everywhere | `q` `Space` | | Go to Definition | `Ctrl+B` |
| Find in Path (grep) | `Ctrl+Shift+F` `[proto]` | | Go to Implementation | `Ctrl+Alt+B` `[proto]` |
| Go to File | `Ctrl+Shift+N` `[proto]` | | Go to Type Definition | `Ctrl+Shift+B` `[proto]` |
| Go to Symbol (Datei) | `Ctrl+N` | | Find Usages | `Alt+F7` |
| Find Action | `Ctrl+Shift+A` `[proto]` | | Context Actions / Quick Fix | `Alt+Enter` / `Ctrl+.` |
| Recent Files | `Ctrl+E` | | Rename | `Shift+F6` |
| Project-Explorer | `Alt+1` | | Quick Documentation | `Ctrl+Q` (oder `K`) |
| Reformat Code | `Ctrl+Alt+L` `[proto]` | | Parameter Info | `Ctrl+P` (normal mode) |
| Comment Line | `Ctrl+/` | | Navigate Back / Forward | `Ctrl+Alt+←/→` `[proto]` |
| Replace in Path | `Ctrl+Shift+R` `[proto]` | | Move Line Up/Down | `Alt+Shift+↑/↓` |
| Terminal | `Alt+F12` | | Laravel-Menü | `q L` |

**Absichtlich Vim-typisch belassen** (nicht auf JetBrains gebogen): `Ctrl+R` = Redo, `Ctrl+W` = Fenster,
`Ctrl+D/U` = Scroll, `Ctrl+V` = Visual-Block. Alles ist zusätzlich über `q` (which-key) erreichbar.

## Sprachen & Frameworks

- **PHP**: intelephense (Completion/Navigation). *Rename & Code-Actions brauchen Intelephense Premium
  oder wechsle in `lua/config/lazy.lua` auf `vim.g.lazyvim_php_lsp = "phpactor"` (kostenlos).*
- **Laravel/Blade**: Blade-Filetype + Treesitter-Grammar + `blade-formatter`; `laravel.nvim` unter `q L`.
- **Vue/Nuxt**: vue_ls + vtsls (`<script setup lang="ts">` inkl. Nuxt-Auto-Imports). `vue_ls` zieht sonst
  die kaputte TypeScript-7-Preview — `lua/plugins/vue.lua` pinnt seine TS automatisch auf 5.x (bzw. `:VueFixTs`).
- **TypeScript/JavaScript**: vtsls; ESLint + Prettier.
- **Tailwind**: tailwindcss-LSP inkl. Blade-Dateien (Farb-Swatches in der Completion).
- **CSS/SCSS/LESS**: cssls + Prettier.

## Anpassen

- Keymaps: `lua/config/keymaps.lua`
- Optionen: `lua/config/options.lua`
- Extras (Sprachen): `lua/config/lazy.lua` bzw. `:LazyExtras`
- Eigene Plugins/Overrides: `lua/plugins/*.lua`
