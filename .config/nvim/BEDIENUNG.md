# Bedienungsanleitung — Neovim wie IntelliJ (Alltag)

Diese Config ist **LazyVim + eine JetBrains-Tastenebene**. Ziel: du arbeitest mit deinen
IntelliJ-Reflexen (Ctrl+B, Shift+F6, Alt+Enter, Ctrl+Shift+F …), bekommst aber Vim-Editing dazu.

> **Wichtigster Trick:** Wenn du eine Taste vergisst, drück **`Leertaste`** (= Leader) und warte —
> ein Menü (which-key) zeigt dir alle Befehle. So brauchst du nichts auswendig zu lernen.

---

## 1. Start

```sh
cd ~/mein/projekt
nvim .            # öffnet Explorer im Projekt
# oder direkt eine Datei:
nvim app/Models/User.php
```

Erststart lädt Plugins automatisch. Sprachserver/Formatter kommen über Mason (`:Mason`),
Treesitter-Parser über `:TSInstall` bzw. automatisch beim Öffnen der jeweiligen Dateityp.

**Speichern & Beenden** (die drei, die du sofort brauchst):
- Speichern: `:w` + Enter (oder `Leertaste w`)
- Beenden: `:q` + Enter — alles beenden: `:qa`
- Speichern **und** beenden: `ZZ` (Großbuchstaben, im Normal-Modus)

---

## 2. Vim-Grundlagen für IntelliJ-Umsteiger (2 Minuten)

Neovim ist **modal**. Du bist meistens im **Normal-Modus** (Tasten = Befehle, nicht Text).

| Modus | Wozu | Rein | Raus |
|---|---|---|---|
| **Normal** | Navigieren, Befehle | `Esc` | — |
| **Insert** | Text tippen | `i` (vor Cursor), `a` (nach), `o` (neue Zeile) | `Esc` |
| **Visual** | Markieren | `v` (Zeichen), `V` (Zeile), `Ctrl+v` (Block) | `Esc` |

**Das absolute Minimum an Motions** (im Normal-Modus):
- Bewegen: `h j k l` (←↓↑→), Wort `w`/`b`, Zeilenanfang `^`, Zeilenende `$`, Datei `gg`/`G`
- Löschen/Ändern: `dd` (Zeile löschen), `ciw` (Wort ersetzen), `x` (Zeichen), `u` (undo), `Ctrl+r` (redo)
- Kopieren/Einfügen: `yy` (Zeile yanken), `p` (einfügen)
- **`.`** wiederholt die letzte Änderung — extrem nützlich.

Du kannst die JetBrains-Tasten unten nutzen, ohne Vim zu „können" — aber diese Handvoll Motions
macht dich sofort schneller.

---

## 3. Der typische Arbeitstag

### Dateien & Suche
| Was | Taste (JetBrains) | Alternative (Leader) |
|---|---|---|
| Search Everywhere | `Leertaste Leertaste` | — |
| Datei öffnen (Go to File) | `Ctrl+Shift+N` | `Leertaste f f` |
| Im Projekt suchen (Find in Path) | `Ctrl+Shift+F` | `Leertaste /` |
| Zuletzt benutzte Dateien | `Ctrl+E` | `Leertaste f r` |
| Symbol in Datei (Go to Class) | `Ctrl+N` | `Leertaste s s` |
| Aktion/Befehl finden | `Ctrl+Shift+A` | `Leertaste :` |
| Projekt-Explorer (Tree) | `Alt+1` | `Leertaste e` |
| Ersetzen im Projekt | `Ctrl+Shift+R` | — |

> In der Suchliste: mit `Ctrl+j`/`Ctrl+k` (oder ↑↓) wählen, `Enter` öffnen, `Ctrl+v`/`Ctrl+s` in
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
| Kontextaktionen / Quick Fix | `Alt+Enter` oder `Ctrl+.` | (auch `Leertaste c a`) |
| Umbenennen (Rename) | `Shift+F6` | (auch `Leertaste c r`) |
| Code formatieren | `Ctrl+Alt+L` | (auch `Leertaste c f`) |
| Zeile aus-/einkommentieren | `Ctrl+/` | |
| Zeile verschieben | `Alt+Shift+↑` / `Alt+Shift+↓` | |
| Quick-Doku (Hover) | `Ctrl+Q` oder `K` | |
| Parameter-Info | `Ctrl+P` | |
| Autovervollständigung | tippen → Liste; `Enter` bestätigt, `Ctrl+Space` erzwingt | |

### Diagnose / Fehler
- Fehlerliste (Trouble): `Leertaste x x`
- Fehler unter Cursor anzeigen: `Leertaste c d`
- Springen: `]d` / `[d` (Diagnose), `]e` / `[e` (nur Fehler)

### Git
- **lazygit** (volle Git-UI): `Leertaste g g`
- Zeilen-Blame: `Leertaste g b` · Datei-History: `Leertaste g f`
- Hunk vor/zurück: `]h` / `[h` · Hunk stagen: im Gitsigns-Menü `Leertaste g h`

### Terminal
- Terminal auf/zu: `Alt+F12`
- Aus dem Terminal zurück in Normal: `Ctrl+\` `Ctrl+n`

### Fenster, Tabs & Buffer
| Was | Taste |
|---|---|
| Zwischen Splits springen | `Ctrl+h/j/k/l` |
| Vertikal/horizontal teilen | `Leertaste \|` / `Leertaste -` |
| Nächster/voriger Buffer (Tab) | `Shift+l` / `Shift+h` |
| Buffer schließen | `Leertaste b d` |
| Suche-Highlight weg | `Esc` (oder `F9`) |

---

## 4. Pro Sprache/Framework

### PHP / Laravel
- **Intelephense** liefert Completion, Go-to-Definition, Hover, Diagnostics.
- **Rename (`Shift+F6`) & Code-Actions (`Alt+Enter`)** brauchen **Intelephense Premium**.
  Kostenlose Alternative: in `lua/config/lazy.lua` `vim.g.lazyvim_php_lsp = "phpactor"` setzen.
- **Formatieren** mit **Laravel Pint** (`Ctrl+Alt+L`) — legt eine `pint.json` ins Projekt, dann wird
  euer Team-Standard genutzt. Braucht ein `php`-Binary (`brew install php composer`).
- **Blade** (`*.blade.php`): eigenes Highlighting (Treesitter), Format via `blade-formatter`.
- **Artisan/Routes/Views** über `laravel.nvim`: `Leertaste L` (Menü), z.B. `Leertaste L a` (Artisan).

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

## 5. Wenn eine Taste nicht geht (Terminal-Protokoll)

Chords wie `Ctrl+.`, `Ctrl+Shift+F`, `Ctrl+Alt+L` brauchen das **kitty keyboard protocol**:
- **Ghostty** (macOS): läuft ✓
- **Windows Terminal** (WSL): ab **v1.25** ✓ — sonst nimm die `Leertaste`-Alternativen aus den Tabellen.

Schnelltest: `nvim` → `i` (Insert) → `Ctrl+v` → dann `Ctrl+.` drücken.
- Erscheint etwas wie `^[[46;5u` → Protokoll aktiv ✓
- Kommt nur `.` → Terminal aktualisieren/wechseln, bis dahin `Leertaste`-Wege nutzen.

---

## 6. Wartung & Hilfe

| Befehl | Zweck |
|---|---|
| `:Lazy` | Plugins (Status, Update mit `U`, Sync mit `S`) |
| `:Mason` | LSP-Server & Formatter installieren/prüfen |
| `:checkhealth` | Diagnose der ganzen Installation |
| `:LspInfo` | Welche Sprachserver hängen am aktuellen Buffer? |
| `Leertaste s k` | Alle Tastenkürzel durchsuchen |

**Anpassen:** Tasten in `lua/config/keymaps.lua`, Optionen in `lua/config/options.lua`,
Sprachen in `lua/config/lazy.lua` (oder `:LazyExtras`), eigene Plugins in `lua/plugins/*.lua`.

---

## 7. Aktivieren (fest installieren)

Bisher läuft alles isoliert testbar über `NVIM_APPNAME=nvim-jb nvim` (verändert deine bestehende
`~/.config/nvim` nicht). Wenn du es zum Standard machen willst:

```sh
cd ~/github/dotfiles
./install.sh      # kopiert nach ~/.config/nvim und sichert eine vorhandene Config als Backup
```

Danach startet `nvim` (bzw. dein Alias `vim`) direkt diese Config.
