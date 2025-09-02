# Keybinding

### `Basic Tmux Commands`
- **Prefix key** (default is `Ctrl + s`): Activates Tmux commands.
- **Detach session**: `Prefix + d`
- **List sessions**: `Prefix + s`
- **Rename session**: `Prefix + $`
- **New window**: `Prefix + c`
- **Switch window**: `Prefix + [window number]` or `Prefix + n/p` for next/previous
- **Split horizontally**: `Prefix + "`
- **Split vertically**: `Prefix + %`
- **Resize pane**: `Prefix + arrow keys`

### Pane Management
- **Switch between panes**: `Prefix + arrow keys` or `Prefix + o`
- **Close pane**: `Prefix + x`
- **Swap panes**: `Prefix + {` or `Prefix + }`
- **Synchronize panes** (useful if you want to type in multiple panes at once): `Prefix + :` and type `setw synchronize-panes on`

### Copy Mode
- **Enter copy mode**: `Prefix + [`
- **Scroll up/down**: Arrow keys or `PgUp`/`PgDn`
- **Exit copy mode**: `q`
- **Copy selection**: Press `Space` to start the selection, move the cursor, then `Enter` to copy

### Clipboard (copy-paste between Tmux and system clipboard)
- **Copy from Tmux to clipboard** (requires setup): `Prefix + ]`
---

### `Basic Vim Shortcuts`

These are fundamental Vim and Neovim shortcuts that enhance navigation and editing:

- **Normal Mode `h`**: Move cursor left.
- **Normal Mode `j`**: Move cursor down.
- **Normal Mode `k`**: Move cursor up.
- **Normal Mode `l`**: Move cursor right.
- **Normal Mode `i`**: Enter insert mode.
- **Normal Mode `v`**: Enter visual mode.
- **Normal Mode `gg`**: Go to the top of the file.
- **Normal Mode `G`**: Go to the bottom of the file.
- **Normal Mode `:w`**: Save the current buffer.
- **Normal Mode `:q`**: Quit the current buffer.
- **Normal Mode `:wq`**: Save and quit the current buffer.
- **Normal Mode `:qa`**: Quit all open buffers.
- **Normal Mode `u`**: Undo the last change.
- **Normal Mode `Ctrl + r`**: Redo the last undone change.
- **Insert Mode `Ctrl + o`**: Execute one normal mode command.
- **Visual Mode `y`**: Yank (copy) the selected text.
- **Visual Mode `d`**: Delete the selected text.
- **Normal Mode `/`**: Start a forward search.
- **Normal Mode `?`**: Start a backward search.
- **Normal Mode `:%s/old/new/g`**: Replace all instances of "old" with "new" in the file.

These shortcuts are essential for efficient text editing and navigation within Neovim.

### `Netrw`

Common Commands for netrw
1. **`:e .`** or **`:Ex:`** Open the current directory in netrw.
2. **`-`** (while in netrw): Go up one directory level.
3. **`Enter:`** Open the selected file or directory.
4. **`D:`** Delete a file.
5. **`%:`** Create a new file.
6. **`d:`** Create a new directory.
7. **`r:`** Rename a file.
8. **`/filename`** To reach the filename.

### From main `init.lua`

Here's an explanation of each LSP mapping:
1. **`gd`**: Go to the definition of the symbol under the cursor, opening the corresponding file and placing the cursor at the definition.
2. **`K`**: Show hover information about the symbol under the cursor, displaying documentation or type information in a floating window.
3. **`<leader>vws`**: Search for a workspace symbol, allowing you to find symbols across the entire workspace.
4. **`<leader>vd`**: Open a floating window displaying diagnostics for the current buffer, helping you quickly identify issues.
5. **`<leader>vca`**: Trigger a code action, which could include fixes or refactoring suggestions based on the current context.
6. **`<leader>vrr`**: Show references to the symbol under the cursor, listing all instances where it is used.
7. **`<leader>vrn`**: Rename the symbol under the cursor, allowing for bulk renaming throughout the workspace.
8. **`<C-h>`** (in insert mode): Display signature help for the function or method under the cursor, showing parameters and documentation.
9. **`[d`**: Jump to the next diagnostic message (like an error or warning) in the buffer.
10. **`]d`**: Jump to the previous diagnostic message in the buffer.

### `Core Keybindings (from remap.lua)`

**Leader Key**: The leader key is set to spacebar (`<leader> = " "`).

**File and Navigation**:
1. **`<leader>pv`**: Opens file explorer (netrw) in current directory.
2. **`<leader>w`**: Search for words starting with... (forward search).
3. **`<leader>W`**: Search for words starting with... (backward search).

**Clipboard Operations**:
4. **Visual Mode `yyy`**: Yanks the selected text into the system clipboard.
5. **Visual Mode `<leader>p`**: Pastes without losing clipboard content (greatest remap ever).
6. **Normal/Visual Mode `<leader>y`**: Yanks to system clipboard.
7. **Normal Mode `<leader>Y`**: Yanks entire line to system clipboard.
8. **Normal/Visual Mode `<leader>d`**: Deletes without affecting clipboard.

**Line Movement**:
9. **Visual Mode `J`**: Moves selected lines down and re-selects them.
10. **Visual Mode `K`**: Moves selected lines up and re-selects them.
11. **Normal Mode `J`**: Joins lines while maintaining cursor position.

**Enhanced Navigation**:
12. **Normal Mode `<C-d>`**: Scrolls down half a screen and centers cursor.
13. **Normal Mode `<C-u>`**: Scrolls up half a screen and centers cursor.
14. **Normal Mode `n`**: Next search result and centers cursor.
15. **Normal Mode `N`**: Previous search result and centers cursor.

**LSP and Development**:
16. **Normal Mode `<leader>zig`**: Restarts the LSP server.
17. **Normal Mode `<leader>f`**: Formats current buffer using LSP.
18. **Normal Mode `gd`**: Go to definition.
19. **Normal Mode `gD`**: Go to declaration.
20. **Normal Mode `gr`**: Show references.
21. **Normal Mode `gi`**: Go to implementation.
22. **Normal Mode `K`**: Show hover information.
23. **Normal Mode `<C-k>`**: Show signature help.
24. **Normal Mode `<leader>rn`**: Rename symbol.
25. **Normal Mode `<leader>ca`**: Show code actions.
26. **Normal Mode `<leader>e`**: Show diagnostic in floating window.
27. **Normal Mode `[d`**: Go to previous diagnostic.
28. **Normal Mode `]d`**: Go to next diagnostic.

**React/TypeScript Specific**:
29. **Normal Mode `<leader>rf`**: ESLint auto-fix.
30. **Normal Mode `<leader>ri`**: Organize imports.
31. **Normal Mode `<leader>ra`**: Add missing imports.

**Quickfix and Location List**:
32. **Normal Mode `<C-n>`**: Next quickfix item and center cursor.
33. **Normal Mode `<C-p>`**: Previous quickfix item and center cursor.
34. **Normal Mode `<leader>k`**: Next location list item and center cursor.
35. **Normal Mode `<leader>j`**: Previous location list item and center cursor.

**Text Manipulation**:
36. **Normal Mode `<leader>s`**: Search and replace word under cursor.
37. **Normal Mode `<leader>x`**: Make current file executable.

**Language-Specific**:
38. **Normal Mode `<leader>ee`**: Insert Go error handling block.

**Configuration and Utilities**:
39. **Insert Mode `<C-c>`**: Alternative to Escape.
40. **Normal Mode `<C-f>`**: Open tmux sessionizer.
41. **Normal Mode `<leader>vpp`**: Open lazy configuration file.
42. **Normal Mode `<leader>mr`**: Trigger cellular automaton animation.
43. **Normal Mode `<leader><leader>`**: Source/reload current configuration.

### `Copilot`

**GitHub Copilot** provides AI-powered code suggestions and completions.

- **`<Tab>`** (Insert Mode): Accepts the currently suggested code completion from Copilot.

### `Fugitive`

Neovim configuration sets up the **vim-fugitive** plugin for Git integration. Here's a breakdown of its functionality:
1. **`<leader>gs`**: Opens the Git command interface.
2. **Autocommand Group**:
   - When entering a buffer with the filetype `fugitive`, it sets up additional key mappings:
     - **`<leader>p`**: Executes `git push`.
     - **`<leader>P`**: Executes `git pull --rebase`.
     - **`<leader>t`**: Prompts for branch tracking during push (`:Git push -u origin `).
     - **`<leader>ad`**: Add all changes (`git add .`).
     - **`<leader>c`**: Commit with interactive message prompt.
3. **Diff Commands**:
   - **`gu`**: Gets changes from the left side (target branch) during merge conflicts.
   - **`gh`**: Gets changes from the right side (merge branch) during merge conflicts.

These mappings enhance Git workflow directly within Neovim.

### `Harpoon`

The **Harpoon** plugin for Neovim helps manage and quickly navigate to files. Here's a breakdown:
1. **`<leader>a`**: Adds the current file to Harpoon's list.
2. **`<C-e>`**: Toggles the quick menu to navigate between marked files.
3. **`<leader>hr`**: Remove current file from Harpoon list.
4. **`<leader>hc`**: Clear all files from Harpoon list.
5. **File Navigation**:
   - **`<C-h>`**: Navigate to the first marked file.
   - **`<C-j>`**: Navigate to the second marked file.
   - **`<C-n>`**: Navigate to the third marked file.
   - **`<C-m>`**: Navigate to the fourth marked file.

These mappings streamline file management and navigation within your Neovim workflow.

### `LSP`

The `mapping` configuration sets up key bindings for the completion menu in Neovim using `nvim-cmp` during insert mode. Here's what each key does:
- **`<C-p>`**: Selects the previous completion item.
- **`<C-n>`**: Selects the next completion item.
- **`<C-y>`**: Confirms the selected completion item (if chosen).
- **`<C-Space>`**: Opens the completion menu to show suggestions.

### `Neo-test`

The code snippet sets up a key mapping in Neovim that allows you to run tests using the **Neotest** plugin. Here's what it does:
- **`<leader>tc`**: When you press this key combination in normal mode, it executes the `neotest.run.run()` function, which triggers the running of the current test or all tests associated with the current file.

This mapping makes it convenient to quickly run tests during development.

### `Snippets`

This code snippet configures the **LuaSnip** plugin in Neovim, allowing for snippet expansion and navigation. Here’s a breakdown:
- **Dependencies**: It requires `friendly-snippets`.
- **Key Mappings**:
  - **`<C-s>e`**: Expands the current snippet.
  - **`<C-s>;`**: Jumps to the next placeholder in the snippet.
  - **`<C-s>,`**: Jumps to the previous placeholder.
  - **`<C-E>`**: Changes the choice in a choice node if one is active.

This setup enhances coding efficiency by streamlining snippet management.

### `Telescope`

**Telescope** is a fuzzy finder plugin that enhances file searching and navigation capabilities. Key mappings are:

- **`<leader>pf`**: Opens a file finder (find files in project).
- **`<C-p>`**: Searches for Git-tracked files.
- **`<leader>pus`**: Grep search with user input.
- **`<leader>pws`**: Grep search for word under cursor (workspace).
- **`<leader>ps`**: Grep search for word under cursor.
- **`<leader>vh`**: Lists help tags for documentation search.

These mappings streamline file and content searches, improving workflow efficiency in Neovim.

### `Undo tree`

**UndoTree** is a Neovim plugin that visualizes the undo history of your edits in a tree-like structure. It allows you to see all changes made to a file, including branching paths for when changes are undone and redone. This visual representation helps users navigate through their editing history easily, enabling them to restore previous states or understand the sequence of edits more effectively. Overall, it enhances the standard undo functionality by providing a clearer overview of changes.

It creates a key mapping:

- **`<leader>u`**: Toggles the display of the undo tree, allowing you to visualize and navigate through the history of changes made in your files.

This feature helps in efficiently managing and reverting changes.

### `ToggleTerm`

**ToggleTerm** is a Neovim plugin that provides terminal integration within the editor. It allows you to open floating, horizontal, or vertical terminals with custom configurations.

Key mappings:
- **`<leader>tf`**: Opens a floating terminal window.
- **`<leader>th`**: Opens a horizontal terminal (split at bottom).
- **`<leader>tv`**: Opens a vertical terminal (split on the side).

**Terminal Mode Navigation**:
- **`<Esc>` or `jk`**: Exit terminal mode to normal mode.
- **`<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`**: Navigate between windows from terminal mode.
- **`<C-w>`**: Enter window command mode from terminal.

This setup enhances terminal workflow by providing quick access to different terminal layouts.

### `React Development & Package Management`

**Package Info Plugin** provides dependency management for JavaScript/TypeScript projects:

- **`<leader>psv`**: Show dependency versions.
- **`<leader>pc`**: Hide dependency versions.
- **`<leader>pt`**: Toggle dependency versions.
- **`<leader>pu`**: Update dependency on the current line.
- **`<leader>pd`**: Delete dependency on the current line.
- **`<leader>pi`**: Install a new dependency.
- **`<leader>pv`**: Change dependency version.

**REST Client** for API testing:

- **`<leader>rr`**: Run REST request.
- **`<leader>rl`**: Run last REST request.

These mappings enhance React/JavaScript development workflow.

### `Trouble`

**Trouble** provides a diagnostics list and quickfix enhancement:

- **`<leader>tt`**: Toggle trouble list.
- **`[t`**: Go to previous trouble item.
- **`]t`**: Go to next trouble item.

This plugin helps navigate and manage code diagnostics efficiently.

