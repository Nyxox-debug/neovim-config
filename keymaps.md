# Neovim Keymaps

This document outlines all custom keymaps configured in this LazyVim setup. These keymaps are loaded automatically on the VeryLazy event.

> **Note**: Default LazyVim keymaps are always available. See [LazyVim default keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua) for reference.

## Table of Contents

- [Register-Safe Operations](#register-safe-operations)
- [Navigation and Movement](#navigation-and-movement)
- [Text Manipulation](#text-manipulation)
- [Window Management](#window-management)
- [Tab Management](#tab-management)
- [Diagnostics](#diagnostics)
- [LSP Functions](#lsp-functions)
- [Completion](#completion)
- [Telescope](#telescope)
- [File Browser](#file-browser)
- [Buffer Management](#buffer-management)
- [UI Controls](#ui-controls)
- [Plugin-Specific Keymaps](#plugin-specific-keymaps)

---

## Register-Safe Operations

These keymaps perform operations without affecting the default registers:

| Mode | Keymap      | Action | Description                           |
| ---- | ----------- | ------ | ------------------------------------- |
| `n`  | `x`         | `"_x`  | Delete character without yanking      |
| `n`  | `<Leader>p` | `"3p`  | Paste from register 3                 |
| `n`  | `<Leader>P` | `"3P`  | Paste before cursor from register 3   |
| `v`  | `<Leader>p` | `"3p`  | Paste from register 3 (visual)        |
| `n`  | `<Leader>c` | `"_c`  | Change without yanking                |
| `n`  | `<Leader>C` | `"_C`  | Change to end of line without yanking |
| `v`  | `<Leader>c` | `"_c`  | Change without yanking (visual)       |
| `v`  | `<Leader>C` | `"_C`  | Change without yanking (visual)       |
| `n`  | `<Leader>d` | `"_d`  | Delete without yanking                |
| `n`  | `<Leader>D` | `"_D`  | Delete to end of line without yanking |
| `v`  | `<Leader>d` | `"_d`  | Delete without yanking (visual)       |
| `v`  | `<Leader>D` | `"_D`  | Delete without yanking (visual)       |

## Navigation and Movement

| Mode | Keymap  | Action                       | Description              |
| ---- | ------- | ---------------------------- | ------------------------ |
| `n`  | `<C-m>` | `<C-i>`                      | Jump forward in jumplist |
| `n`  | `<C-j>` | `vim.diagnostic.goto_next()` | Go to next diagnostic    |
| `i`  | `jj`    | `<Esc>`                      | Exit insert mode         |

## Text Manipulation

| Mode | Keymap      | Action      | Description                            |
| ---- | ----------- | ----------- | -------------------------------------- |
| `n`  | `+`         | `<C-a>`     | Increment number                       |
| `n`  | `-`         | `<C-x>`     | Decrement number                       |
| `n`  | `dw`        | `vb"_d`     | Delete word backwards                  |
| `n`  | `<C-a>`     | `gg<S-v>G`  | Select all text                        |
| `n`  | `<Leader>o` | `o<Esc>^Da` | Insert line below without continuation |
| `n`  | `<Leader>O` | `O<Esc>^Da` | Insert line above without continuation |

## Window Management

| Mode | Keymap | Action            | Description               |
| ---- | ------ | ----------------- | ------------------------- |
| `n`  | `ss`   | `:split<Return>`  | Split window horizontally |
| `n`  | `sv`   | `:vsplit<Return>` | Split window vertically   |
| `n`  | `sh`   | `<C-w>h`          | Move to left window       |
| `n`  | `sk`   | `<C-w>k`          | Move to upper window      |
| `n`  | `sj`   | `<C-w>j`          | Move to lower window      |
| `n`  | `sl`   | `<C-w>l`          | Move to right window      |

### Window Resizing

| Mode | Keymap         | Action   | Description            |
| ---- | -------------- | -------- | ---------------------- |
| `n`  | `<C-w><left>`  | `<C-w><` | Decrease window width  |
| `n`  | `<C-w><right>` | `<C-w>>` | Increase window width  |
| `n`  | `<C-w><up>`    | `<C-w>+` | Increase window height |
| `n`  | `<C-w><down>`  | `<C-w>-` | Decrease window height |

## Tab Management

| Mode | Keymap    | Action                         | Description               |
| ---- | --------- | ------------------------------ | ------------------------- |
| `n`  | `te`      | `:tabedit`                     | Create new tab            |
| `n`  | `<tab>`   | `:tabnext<Return>`             | Next tab                  |
| `n`  | `<s-tab>` | `:tabprev<Return>`             | Previous tab              |
| `n`  | `<Tab>`   | `<Cmd>BufferLineCycleNext<CR>` | Next tab (BufferLine)     |
| `n`  | `<S-Tab>` | `<Cmd>BufferLineCyclePrev<CR>` | Previous tab (BufferLine) |

## Diagnostics

| Mode | Keymap  | Action                       | Description           |
| ---- | ------- | ---------------------------- | --------------------- |
| `n`  | `<C-j>` | `vim.diagnostic.goto_next()` | Go to next diagnostic |

## LSP Functions

| Mode | Keymap      | Action                                         | Description                 |
| ---- | ----------- | ---------------------------------------------- | --------------------------- |
| `n`  | `<leader>r` | `require("craftzdog.hsl").replaceHexWithHSL()` | Replace hex colors with HSL |
| `n`  | `<leader>i` | `require("craftzdog.lsp").toggleInlayHints()`  | Toggle inlay hints          |

### Commands

| Command             | Action                                        | Description            |
| ------------------- | --------------------------------------------- | ---------------------- |
| `:ToggleAutoformat` | `require("craftzdog.lsp").toggleAutoformat()` | Toggle auto-formatting |

## Completion

Smart tab completion that handles snippets and popup menus:

| Mode | Keymap    | Action                     | Description                              |
| ---- | --------- | -------------------------- | ---------------------------------------- |
| `i`  | `<Tab>`   | Smart tab completion       | Next completion item or snippet jump     |
| `i`  | `<S-Tab>` | Smart shift-tab completion | Previous completion item or snippet jump |

### Blink.cmp Keymaps

| Mode | Keymap      | Action                      | Description                     |
| ---- | ----------- | --------------------------- | ------------------------------- |
| `i`  | `<Tab>`     | `select_next`               | Select next completion item     |
| `i`  | `<S-Tab>`   | `select_prev`               | Select previous completion item |
| `i`  | `<CR>`      | `accept`                    | Accept completion               |
| `i`  | `<C-Space>` | `show`                      | Show completion menu            |
| `i`  | `<C-e>`     | `hide`                      | Hide completion menu            |
| `i`  | `<C-n>`     | `select_next`               | Select next completion item     |
| `i`  | `<C-p>`     | `select_prev`               | Select previous completion item |
| `i`  | `<C-b>`     | `scroll_documentation_up`   | Scroll documentation up         |
| `i`  | `<C-f>`     | `scroll_documentation_down` | Scroll documentation down       |

## Telescope

| Mode | Keymap       | Action                         | Description                                    |
| ---- | ------------ | ------------------------------ | ---------------------------------------------- |
| `n`  | `<leader>fP` | Find plugin files              | Find files in LazyVim plugin directory         |
| `n`  | `;f`         | `builtin.find_files()`         | Find files (respects .gitignore, shows hidden) |
| `n`  | `;r`         | `builtin.live_grep()`          | Live grep search (includes hidden files)       |
| `n`  | `\\`         | `builtin.buffers()`            | List open buffers                              |
| `n`  | `;t`         | `builtin.help_tags()`          | Search help tags                               |
| `n`  | `;;`         | `builtin.resume()`             | Resume previous telescope picker               |
| `n`  | `;e`         | `builtin.diagnostics()`        | List diagnostics                               |
| `n`  | `;s`         | `builtin.treesitter()`         | List treesitter symbols                        |
| `n`  | `;c`         | `builtin.lsp_incoming_calls()` | List LSP incoming calls                        |

## File Browser

| Mode | Keymap | Action            | Description                                             |
| ---- | ------ | ----------------- | ------------------------------------------------------- |
| `n`  | `sf`   | Open file browser | Open telescope file browser in current buffer directory |

### File Browser Navigation

| Mode | Keymap       | Action                           | Description            |
| ---- | ------------ | -------------------------------- | ---------------------- |
| `n`  | `N`          | `fb_actions.create`              | Create new file/folder |
| `n`  | `h`          | `fb_actions.goto_parent_dir`     | Go to parent directory |
| `n`  | `/`          | Enter insert mode                | Start searching        |
| `n`  | `<C-u>`      | Move up 10 items                 | Quick navigation up    |
| `n`  | `<C-d>`      | Move down 10 items               | Quick navigation down  |
| `n`  | `<PageUp>`   | `actions.preview_scrolling_up`   | Scroll preview up      |
| `n`  | `<PageDown>` | `actions.preview_scrolling_down` | Scroll preview down    |

## Buffer Management

Buffers are managed through BufferLine plugin with tab-like navigation.

## UI Controls

| Mode | Keymap      | Action             | Description     |
| ---- | ----------- | ------------------ | --------------- |
| `n`  | `<leader>z` | `<cmd>ZenMode<cr>` | Toggle Zen Mode |

## Plugin-Specific Keymaps

### Dial.nvim (Better Increment/Decrement)

| Mode | Keymap  | Action                             | Description     |
| ---- | ------- | ---------------------------------- | --------------- |
| `n`  | `<C-a>` | `require("dial.map").inc_normal()` | Smart increment |
| `n`  | `<C-x>` | `require("dial.map").dec_normal()` | Smart decrement |

### Inc-rename.nvim

Available through `:IncRename` command for incremental renaming.

### Mini.bracketed

Provides bracket-based navigation for various objects with customized suffixes:

- Treesitter: `]n` and `[n`
- Other objects use default LazyVim keymaps

---

## Notes

- **Leader key**: Default is `<space>` in LazyVim
- **Discipline**: Uses `craftzdog.discipline.cowboy()` for improved workflow
- **Register 3**: Used for special paste operations to avoid conflicts
- **Silent operations**: Most keymaps use `{ noremap = true, silent = true }`
- **Telescope theme**: Diagnostics use "ivy" theme, file browser uses "dropdown" theme

## Disabled Features

- Flash.nvim motion plugin is disabled
- Some completion tab navigation options are commented out
- Git.nvim keymaps are commented out
- Close-buffers.nvim keymaps are commented out
- Copilot keymaps are commented out
- Snacks scroll is disabled

---

_This configuration extends LazyVim's default keymaps. For a complete list of available keymaps, also refer to the [LazyVim documentation](https://github.com/LazyVim/LazyVim)._
