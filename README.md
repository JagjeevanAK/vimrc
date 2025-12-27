# Neovim Configuration - Keybindings Reference

> **Leader Key**: `<Space>` (spacebar)

---

## Table of Contents
- [Core Keybindings](#core-keybindings)
- [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
- [Harpoon (File Navigation)](#harpoon-file-navigation)
- [LSP (Language Server)](#lsp-language-server)
- [Git (Fugitive)](#git-fugitive)
- [Terminal (ToggleTerm)](#terminal-toggleterm)
- [Trouble (Diagnostics)](#trouble-diagnostics)
- [Testing (Neotest)](#testing-neotest)
- [Copilot (AI Assistance)](#copilot-ai-assistance)
- [Zen Mode](#zen-mode)
- [Leap (Motion)](#leap-motion)
- [Undo Tree](#undo-tree)
- [Basic Vim/Netrw](#basic-vim-shortcuts)
- [Tmux Commands](#basic-tmux-commands)

---

## Core Keybindings

### File and Navigation
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>pv` | Normal | Open file explorer (netrw) |
| `<leader>w` | Normal | Search for words (forward) |
| `<leader>W` | Normal | Search for words (backward) |
| `<C-f>` | Normal | Open tmux sessionizer |

### Clipboard Operations
| Keybinding | Mode | Description |
|------------|------|-------------|
| `yyy` | Visual | Yank selection to system clipboard |
| `<leader>p` | Visual | Paste without losing clipboard content |
| `<leader>y` | Normal/Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank entire line to system clipboard |
| `<leader>d` | Normal/Visual | Delete without affecting clipboard |

### Line Movement
| Keybinding | Mode | Description |
|------------|------|-------------|
| `J` | Visual | Move selected lines down |
| `K` | Visual | Move selected lines up |
| `J` | Normal | Join lines (keeps cursor position) |

### Enhanced Navigation
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-d>` | Normal | Scroll down half page (centered) |
| `<C-u>` | Normal | Scroll up half page (centered) |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |

### Text Manipulation
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>s` | Normal | Search and replace word under cursor |
| `<leader>x` | Normal | Make current file executable |
| `<leader>ee` | Normal | Insert Go error handling block |

### Configuration
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>vpp` | Normal | Open lazy configuration file |
| `<leader>mr` | Normal | Trigger cellular automaton animation |
| `<leader><leader>` | Normal | Source/reload current config |

---

## Telescope (Fuzzy Finder)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>pf` | Normal | Find files in project |
| `<C-p>` | Normal | Find git-tracked files |
| `<leader>pus` | Normal | Search for word under cursor |
| `<leader>pws` | Normal | Search for WORD under cursor (includes special chars) |
| `<leader>ps` | Normal | Grep search with custom input |
| `<leader>vh` | Normal | Search help documentation |

---

## Harpoon (File Navigation)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>a` | Normal | Add current file to Harpoon list |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<leader>hr` | Normal | Remove current file from Harpoon |
| `<leader>hc` | Normal | Clear all files from Harpoon |
| `<C-h>` | Normal | Navigate to file 1 |
| `<C-j>` | Normal | Navigate to file 2 |
| `<C-n>` | Normal | Navigate to file 3 |
| `<C-m>` | Normal | Navigate to file 4 |

---

## LSP (Language Server)

### Navigation
| Keybinding | Mode | Description |
|------------|------|-------------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Show references |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Show hover information |
| `<C-k>` | Normal | Show signature help |

### Actions
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Show code actions |
| `<leader>f` | Normal | Format current buffer |
| `<leader>zig` | Normal | Restart LSP server |

### Diagnostics
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>e` | Normal | Show diagnostic in floating window |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |

### React/TypeScript Specific
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>rf` | Normal | ESLint auto-fix all |
| `<leader>ri` | Normal | Organize imports |
| `<leader>ra` | Normal | Add missing imports |

### Completion (nvim-cmp)
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-p>` | Insert | Select previous completion item |
| `<C-n>` | Insert | Select next completion item |
| `<C-y>` | Insert | Confirm selected completion |
| `<C-Space>` | Insert | Open completion menu |

### Quickfix & Location List
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-n>` | Normal | Next quickfix item (centered) |
| `<C-p>` | Normal | Previous quickfix item (centered) |
| `<leader>k` | Normal | Next location list item (centered) |
| `<leader>j` | Normal | Previous location list item (centered) |

---

## Git (Fugitive)

### Main Commands
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gs` | Normal | Open Git status |
| `gu` | Normal | Get changes from left (target branch) |
| `gh` | Normal | Get changes from right (merge branch) |

### In Fugitive Buffer
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>p` | Normal | Git push |
| `<leader>P` | Normal | Git pull with rebase |
| `<leader>t` | Normal | Set upstream and push |
| `<leader>ga` | Normal | Git add all changes |
| `<leader>gc` | Normal | Git commit with message prompt |

---

## Terminal (ToggleTerm)

### Opening Terminals
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>tf` | Normal | Open floating terminal |
| `<leader>th` | Normal | Open horizontal terminal |
| `<leader>tv` | Normal | Open vertical terminal |

### Inside Terminal
| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Esc>` | Terminal | Exit terminal mode |
| `jk` | Terminal | Exit terminal mode |
| `<C-h>` | Terminal | Navigate to left window |
| `<C-j>` | Terminal | Navigate to bottom window |
| `<C-k>` | Terminal | Navigate to top window |
| `<C-l>` | Terminal | Navigate to right window |
| `<C-w>` | Terminal | Window command mode |

---

## Trouble (Diagnostics)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>tt` | Normal | Toggle Trouble diagnostics window |
| `[t` | Normal | Jump to next Trouble item |
| `]t` | Normal | Jump to previous Trouble item |

---

## Testing (Neotest)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>tc` | Normal | Run current test or test file |

---

## Copilot (AI Assistance)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Tab>` | Insert | Accept Copilot suggestion |
| `<C-]>` | Insert | Next Copilot suggestion |

---

## Zen Mode

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>zz` | Normal | Zen mode (minimal, no line numbers) |
| `<leader>zZ` | Normal | Zen mode (with line numbers) |

---

## Leap (Motion)

Leap provides quick navigation using 2-character searches. Default mappings:
- `s{char}{char}` - Jump forward to match
- `S{char}{char}` - Jump backward to match
- `gs{char}{char}` - Jump from windows

---

## Undo Tree

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>u` | Normal | Toggle undo tree window |

---

## Basic Vim Shortcuts

### Movement
| Keybinding | Mode | Description |
|------------|------|-------------|
| `h/j/k/l` | Normal | Move cursor left/down/up/right |
| `gg` | Normal | Go to top of file |
| `G` | Normal | Go to bottom of file |
| `/` | Normal | Forward search |
| `?` | Normal | Backward search |

### Mode Switching
| Keybinding | Mode | Description |
|------------|------|-------------|
| `i` | Normal | Enter insert mode |
| `v` | Normal | Enter visual mode |

### File Operations
| Keybinding | Mode | Description |
|------------|------|-------------|
| `:w` | Normal | Save buffer |
| `:q` | Normal | Quit buffer |
| `:wq` | Normal | Save and quit |
| `:qa` | Normal | Quit all buffers |

### Undo/Redo
| Keybinding | Mode | Description |
|------------|------|-------------|
| `u` | Normal | Undo |
| `<C-r>` | Normal | Redo |

### Clipboard (Visual Mode)
| Keybinding | Mode | Description |
|------------|------|-------------|
| `y` | Visual | Yank (copy) |
| `d` | Visual | Delete |

---

## Netrw (File Explorer)

| Command | Description |
|---------|-------------|
| `:Ex` or `<leader>pv` | Open file explorer |
| `-` | Go up one directory |
| `Enter` | Open file/directory |
| `%` | Create new file |
| `d` | Create new directory |
| `D` | Delete file |
| `R` | Rename file |

---

## Basic Tmux Commands

> **Prefix key**: `Ctrl + s`

### Session Management
| Keybinding | Description |
|------------|-------------|
| `Prefix + d` | Detach session |
| `Prefix + s` | List sessions |
| `Prefix + $` | Rename session |

### Window Management
| Keybinding | Description |
|------------|-------------|
| `Prefix + c` | New window |
| `Prefix + n/p` | Next/Previous window |
| `Prefix + [0-9]` | Switch to window number |

### Pane Management
| Keybinding | Description |
|------------|-------------|
| `Prefix + "` | Split horizontally |
| `Prefix + %` | Split vertically |
| `Prefix + arrow` | Navigate/Resize panes |
| `Prefix + o` | Cycle through panes |
| `Prefix + x` | Close pane |
| `Prefix + {/}` | Swap panes |

### Copy Mode
| Keybinding | Description |
|------------|-------------|
| `Prefix + [` | Enter copy mode |
| `q` | Exit copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |

---

## Editor Settings

- **Line Numbers**: Relative line numbers enabled
- **Tab Width**: 2 spaces (expandtab)
- **Auto-format**: On save for JS/TS/React files
- **Auto-organize imports**: On save for TypeScript files
- **Spell Check**: Enabled for markdown and git commits
- **Yank Highlight**: 200ms visual feedback

---

## Installed Plugins

| Plugin | Purpose |
|--------|---------|
| telescope.nvim | Fuzzy finder |
| harpoon | Quick file navigation |
| nvim-lspconfig | LSP support |
| mason.nvim | LSP/DAP installer |
| nvim-cmp | Autocompletion |
| vim-fugitive | Git integration |
| toggleterm.nvim | Terminal integration |
| trouble.nvim | Diagnostics list |
| neotest | Test runner |
| copilot.vim | AI code completion |
| zen-mode.nvim | Distraction-free writing |
| leap.nvim | Quick motion |
| undotree | Undo history visualization |
| treesitter | Syntax highlighting |
| lualine.nvim | Status line |
| cloak.nvim | Hide sensitive data |
| nvim-autopairs | Auto close brackets |
| LuaSnip | Snippets |

