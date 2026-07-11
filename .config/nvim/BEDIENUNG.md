# Bedienungsanleitung — Neovim wie IntelliJ (Alltag)

Diese Config ist **LazyVim + eine JetBrains-Tastenebene**: du arbeitest mit deinen IntelliJ-Reflexen
(Ctrl+B, Shift+F6, Alt+Enter, Ctrl+Shift+F …).

> **Zwei Tasten zum Merken:** **`Leertaste`** = Suche in der Datei (`/`, wie in deiner `.vimrc`).
> **`q`** = Leader (Befehlstaste): drück `q` und warte — das which-key-Menü zeigt dir alle Befehle.

---

## 1. Start

```sh
cd ~/mein/projekt
nvim .            # öffnet Explorer im Projekt
nvim app/Models/User.php
```

Erststart lädt Plugins automatisch. Sprachserver/Formatter kommen über Mason (`:Mason`),
Treesitter-Parser automatisch beim Öffnen des jeweiligen Dateityps.

---

## 2. Der typische Arbeitstag

### Dateien & Suche
| Was | Taste (JetBrains) | Alternative (Leader `q`) |
|---|---|---|
| In Datei suchen | `Leertaste` | — |
| Search Everywhere | `q` dann `Leertaste` | — |
| Datei öffnen (Go to File) | `Ctrl+Shift+N` | `q f f` |
| Im Projekt suchen (Find in Path) | `Ctrl+Shift+F` | `q /` |
| Zuletzt benutzte Dateien | `Ctrl+E` | `q f r` |
| Symbol in Datei (Go to Class) | `Ctrl+N` | `q s s` |
| Aktion/Befehl finden | `Ctrl+Shift+A` | `q :` |
| Projekt-Explorer (Tree) | `Alt+1` | `q e` |
| Ersetzen im Projekt | `Ctrl+Shift+R` | — |

> In der Auswahlliste: mit `Ctrl+j`/`Ctrl+k` (oder ↑↓) wählen, `Enter` öffnen, `Ctrl+v`/`Ctrl+s` in
> vertikalem/horizontalem Split öffnen, `Esc` schließen.

### Im Code navigieren
| Was | Taste | |
|---|---|---|
| Zur Definition | `Ctrl+B` | (auch `gd`) |
| Zur Implementierung | `Ctrl+Alt+B` | (auch `gI`) |
| Zum Typ | `Ctrl+Shift+B` | (auch `gy`) |
| Verwendungen (Find Usages) | `Alt+F7` | (auch `gr`) |
| Zurück / Vor (Cursor-History) | `Ctrl+Alt+←` / `Ctrl+Alt+→` | |
| Nächster/voriger Fehler | `]d` / `[d` | |

### Code ändern & refactoren
| Was | Taste | |
|---|---|---|
| Kontextaktionen / Quick Fix | `Alt+Enter` oder `Ctrl+.` | (auch `q c a`) |
| Umbenennen (Rename) | `Shift+F6` | (auch `q c r`) |
| Code formatieren | `Ctrl+Alt+L` | (auch `q c f`) |
| Zeile aus-/einkommentieren | `Ctrl+/` | |
| Zeile verschieben | `Alt+Shift+↑` / `Alt+Shift+↓` | |
| Quick-Doku (Hover) | `Ctrl+Q` oder `K` | |
| Parameter-Info | `Ctrl+P` | |
| Autovervollständigung | tippen → Liste; `Enter` bestätigt, `Ctrl+Space` erzwingt | |

### Diagnose / Fehler
- Fehlerliste (Trouble): `q x x`
- Fehler unter Cursor anzeigen: `q c d`
- Springen: `]d` / `[d` (Diagnose), `]e` / `[e` (nur Fehler)

### Git
- **lazygit** (volle Git-UI): `q g g`
- Zeilen-Blame: `q g b` · Datei-History: `q g f`
- Hunk vor/zurück: `]h` / `[h`

### Terminal
- Terminal auf/zu: `Alt+F12`

### Fenster, Tabs & Buffer
| Was | Taste |
|---|---|
| Zwischen Splits springen | `Ctrl+h/j/k/l` |
| Vertikal/horizontal teilen | `q \|` / `q -` |
| Nächster/voriger Buffer (Tab) | `Shift+l` / `Shift+h` |
| Buffer schließen | `q b d` |

---

## 3. Pro Sprache/Framework

### PHP / Laravel
- **Intelephense** liefert Completion, Go-to-Definition, Hover, Diagnostics.
- **Rename (`Shift+F6`) & Code-Actions (`Alt+Enter`)** brauchen **Intelephense Premium**.
  Kostenlose Alternative: in `lua/config/lazy.lua` `vim.g.lazyvim_php_lsp = "phpactor"` setzen.
- **Formatieren** mit **Laravel Pint** (`Ctrl+Alt+L`) — legt eine `pint.json` ins Projekt, dann wird
  euer Team-Standard genutzt. Braucht ein `php`-Binary (`brew install php composer`).
- **Blade** (`*.blade.php`): eigenes Highlighting (Treesitter), Format via `blade-formatter`.
- **Artisan/Routes/Views** über `laravel.nvim`: `q L` (Menü), z.B. `q L a` (Artisan).

### Vue / Nuxt
- `.vue`-Dateien: **vtsls** (TypeScript-Intelligenz inkl. Komponenten) + **vue_ls** (Template/SFC).
- Nuxt braucht keinen eigenen Server — funktioniert über die Vue/TS-Server. Auto-Imports werden erkannt,
  sobald das Projekt einmal `npm install` gelaufen ist.
- Formatieren: **Prettier** (`Ctrl+Alt+L`).
- *Hinweis:* `vue_ls` wird automatisch repariert (es zieht sonst eine inkompatible TypeScript-7-Preview
  und stürzt ab). Beim allerersten Mal ggf. einmal `:VueFixTs` ausführen und Neovim neu starten.

### TypeScript / JavaScript
- **vtsls**: Completion, Typen, Go-to-Definition, Refactorings; **ESLint** als Linter, **Prettier** zum Formatieren.

### Tailwind / CSS
- **Tailwind**: Klassen-Autocomplete **mit Farb-Vorschau** — auch in Blade- und Vue-Dateien.
  Greift, sobald das Projekt eine Tailwind-Config hat.
- **CSS/SCSS/LESS**: `cssls` (Hover, Completion) + Prettier.

---

## 4. Wenn eine Taste nicht geht (Terminal-Protokoll)

Chords wie `Ctrl+.`, `Ctrl+Shift+F`, `Ctrl+Alt+L` brauchen das **kitty keyboard protocol**:
- **Ghostty** (macOS): läuft ✓
- **Windows Terminal** (WSL): ab **v1.25** ✓ — sonst nimm die `q`-Alternativen aus den Tabellen.

Schnelltest: `nvim` → `i` → `Ctrl+v` → dann `Ctrl+.` drücken.
- Erscheint etwas wie `^[[46;5u` → Protokoll aktiv ✓
- Kommt nur `.` → Terminal aktualisieren/wechseln, bis dahin die `q`-Wege nutzen.

---

## 5. Wartung & Hilfe

| Befehl | Zweck |
|---|---|
| `:Lazy` | Plugins (Status, Update mit `U`, Sync mit `S`) |
| `:Mason` | LSP-Server & Formatter installieren/prüfen |
| `:checkhealth` | Diagnose der ganzen Installation |
| `:LspInfo` | Welche Sprachserver hängen am aktuellen Buffer? |
| `q s k` | Alle Tastenkürzel durchsuchen |

**Anpassen:** Tasten in `lua/config/keymaps.lua`, Optionen (inkl. Leader) in `lua/config/options.lua`,
Sprachen in `lua/config/lazy.lua` (oder `:LazyExtras`), eigene Plugins in `lua/plugins/*.lua`.

---

## 6. Aktivieren (fest installieren)

Bisher läuft alles isoliert testbar über `NVIM_APPNAME=nvim-jb nvim` (verändert deine bestehende
`~/.config/nvim` nicht). Zum Standard machen:

```sh
cd ~/github/dotfiles
./install.sh      # kopiert nach ~/.config/nvim und sichert eine vorhandene Config als Backup
```

Danach startet `nvim` (bzw. dein Alias `vim`) direkt diese Config.
