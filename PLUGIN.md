# 🛠️ Neovim Plugins Overview


<!-- FIX: Edit Plugins -->

This document explains the plugins used in my Neovim setup: what they do and where they’re configured.

---

## ✨ UI & Appearance

| Plugin                           | What it does                         | Location                  |
| :------------------------------- | :----------------------------------- | :------------------------ |
| `craftzdog/solarized-osaka.nvim` | Colorscheme (Solarized Osaka)        | `plugins/colorscheme.lua` |
| `nvim-lualine/lualine.nvim`      | Statusline at the bottom             | `plugins/editor.lua`      |
| `akinsho/bufferline.nvim`        | Tabline for buffers/tabs             | `plugins/editor.lua`      |
| `b0o/incline.nvim`               | Shows current filename & icon at top | `plugins/editor.lua`      |
| `folke/zen-mode.nvim`            | Distraction-free mode                | `plugins/editor.lua`      |

---

## 🔍 Navigation & Search

| Plugin                                       | What it does                              | Location                          |
| :------------------------------------------- | :---------------------------------------- | :-------------------------------- |
| `nvim-telescope/telescope.nvim`              | Fuzzy finder: search files, text, symbols | `plugins/editor.lua`              |
| `nvim-telescope/telescope-fzf-native.nvim`   | Faster sorting for telescope              | `plugins/editor.lua` (dependency) |
| `nvim-telescope/telescope-file-browser.nvim` | File browser inside telescope             | `plugins/editor.lua`              |
| ~~`folke/flash.nvim`~~                       | Quick jump to words/chars (disabled)      | `plugins/editor.lua`              |

---

## 🌳 Treesitter & Highlighting

| Plugin                            | What it does                                | Location                 |
| :-------------------------------- | :------------------------------------------ | :----------------------- |
| `nvim-treesitter/nvim-treesitter` | Better syntax highlighting, folding         | `plugins/treesitter.lua` |
| `nvim-treesitter/playground`      | Explore treesitter parse trees              | `plugins/treesitter.lua` |
| `echasnovski/mini.hipatterns`     | Dynamically highlight CSS `hsl(...)` colors | `plugins/editor.lua`     |

---

## 🧰 LSP & Development

| Plugin                                    | What it does                                | Location          |
| :---------------------------------------- | :------------------------------------------ | :---------------- |
| `williamboman/mason.nvim`                 | Install LSP servers & formatters            | `plugins/lsp.lua` |
| `neovim/nvim-lspconfig` _(commented out)_ | Configure LSP servers (tsserver, lua, etc.) | `plugins/lsp.lua` |

---

## 📄 Markdown

| Plugin                  | What it does                        | Location             |
| :---------------------- | :---------------------------------- | :------------------- |
| `ellisonleao/glow.nvim` | Preview markdown in floating window | `plugins/editor.lua` |

---

## 🧪 Optional / Disabled Plugins

| Plugin                 | What it does                             | Location                             |
| :--------------------- | :--------------------------------------- | :----------------------------------- |
| `dinhhuy258/git.nvim`  | Git blame & repo browser                 | `plugins/editor.lua` (commented out) |
| `render-markdown.nvim` | Alternative markdown renderer (disabled) | `plugins/editor.lua`                 |

---

## ⚙ Plugin Manager & Setup

| Plugin            | What it does                        | Location              |
| :---------------- | :---------------------------------- | :-------------------- |
| `folke/lazy.nvim` | Plugin manager (lazy-loads plugins) | `lua/config/lazy.lua` |
| `LazyVim/LazyVim` | Base LazyVim framework & extras     | `lua/config/lazy.lua` |

---

## 📂 Folder Structure

```text
.
├── init.lua                     → require("config.lazy")
└── lua
    ├── config
    │   └── lazy.lua             → Plugin setup with lazy.nvim
    └── plugins
        ├── colorscheme.lua      → Theme
        ├── editor.lua           → UI / UX plugins
        ├── lsp.lua              → LSP & tools
        └── treesitter.lua       → Treesitter configs
```
