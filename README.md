# Keybinding

### From main `init.lua`
---
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

 

### `Lazy_init.lua`
---

1. **`vim.g.mapleader = " "`**: Sets the leader key to the spacebar.

2. **`<leader>pv`**: Opens the file explorer (Netrw) in the current directory.

3. **Visual Mode `yyy`**: Yanks the selected text into the system clipboard.

4. **Visual Mode `J`**: Moves the selected lines down by one and re-selects them.

5. **Visual Mode `K`**: Moves the selected lines up by one and re-selects them.

6. **Normal Mode `J`**: Joins the current line with the next line while maintaining the cursor position.

7. **Normal Mode `<C-d>`**: Scrolls down half a screen and centers the cursor.

8. **Normal Mode `<C-u>`**: Scrolls up half a screen and centers the cursor.

9. **Normal Mode `n`**: Searches for the next occurrence of the last search and centers the cursor.

10. **Normal Mode `N`**: Searches for the previous occurrence of the last search and centers the cursor.

11. **Normal Mode `<leader>zig`**: Restarts the LSP server.

12. **Normal Mode `<leader>vwm`**: Starts a session with the "vim-with-me" plugin.

13. **Normal Mode `<leader>svwm`**: Stops a session with the "vim-with-me" plugin.

14. **Visual Mode `<leader>p`**: Pastes the text from the unnamed register while deleting the selection.

15. **Normal/Visual Mode `<leader>y`**: Yanks the selected or current line to the system clipboard.

16. **Normal Mode `<leader>Y`**: Yanks the entire line to the system clipboard.

17. **Normal/Visual Mode `<leader>d`**: Deletes the selected text without affecting the unnamed register.

18. **Insert Mode `<C-c>`**: Exits insert mode.

19. **Normal Mode `Q`**: Disables the `Q` command.

20. **Normal Mode `<C-f>`**: Opens a new tmux window with the sessionizer tool.

21. **Normal Mode `<leader>f`**: Formats the current buffer using the LSP format command.

22. **Normal Mode `<C-k>`**: Navigates to the next quickfix item and centers the cursor.

23. **Normal Mode `<C-j>`**: Navigates to the previous quickfix item and centers the cursor.

24. **Normal Mode `<leader>k`**: Navigates to the next location in the location list.

25. **Normal Mode `<leader>j`**: Navigates to the previous location in the location list.

26. **Normal Mode `<leader>s`**: Opens a search-and-replace command for the word under the cursor.

27. **Normal Mode `<leader>x`**: Makes the current file executable.

28. **Normal Mode `<leader>ee`**: Inserts a basic error handling template in Go.

29. **Normal Mode `<leader>vpp`**: Opens the specified Neovim configuration file.

30. **Normal Mode `<leader>mr`**: Triggers a "make it rain" animation with the Cellular Automaton plugin.

31. **Normal Mode `<leader><leader>`**: Sources the current configuration file, reloading changes.
---

### `Copilot`
---
 #### Control + J will trigger Copilot to accept the currently suggested code completion
---
### `Fugitive`
---
 Neovim configuration sets up the **vim-fugitive** plugin for Git integration. Here's a breakdown of its functionality:

1. **`<leader>gs`**: Opens the Git command interface.

2. **Autocommand Group**: 
   - When entering a buffer with the filetype `fugitive`, it sets up additional key mappings:
     - **`<leader>p`**: Executes `git push`.
     - **`<leader>P`**: Executes `git pull --rebase`.
     - **`<leader>t`**: Prompts for branch tracking during push.

3. **Diff Commands**:
   - **`gu`**: Gets changes from the second version.
   - **`gh`**: Gets changes from the third version. 

 These mappings enhance Git workflow directly within Neovim.
---
### `Harpoon`
--
 The **Harpoon** plugin for Neovim, which helps manage and quickly navigate to files. Here's a breakdown:

1. **`<leader>a`**: Adds the current file to Harpoon's list.
2. **`<C-e>`**: Toggles the quick menu to navigate between marked files.
3. **File Navigation**:
   - **`<C-h>`**: Navigate to the first marked file.
   - **`<C-t>`**: Navigate to the second marked file.
   - **`<C-n>`**: Navigate to the third marked file.
   - **`<C-s>`**: Navigate to the fourth marked file.
4. **Replace Marked Files**:
   - **`<leader><C-h>`**: Replace the first marked file.
   - **`<leader><C-t>`**: Replace the second marked file.
   - **`<leader><C-n>`**: Replace the third marked file.
   - **`<leader><C-s>`**: Replace the fourth marked file.

 These mappings streamline file management and navigation within your Neovim workflow.
 ---
 ### `LSP`
 ---
 The `mapping` configuration sets up key bindings for the completion menu in Neovim using `nvim-cmp` during insert mode. Here's what each key does:

- **`<C-p>`**: Selects the previous completion item.
- **`<C-n>`**: Selects the next completion item.
- **`<C-y>`**: Confirms the selected completion item (if chosen).
- **`<C-Space>`**: Opens the completion menu to show suggestions.
---
### `Neo-test`
---
The code snippet sets up a key mapping in Neovim that allows you to run tests using the **Neotest** plugin. Here's what it does:

- **`<leader>tc`**: When you press this key combination in normal mode, it executes the `neotest.run.run()` function, which triggers the running of the current test or all tests associated with the current file.

This mapping makes it convenient to quickly run tests during development.
---
### `Snippets`
---
This code snippet configures the **LuaSnip** plugin in Neovim, allowing for snippet expansion and navigation. Here’s a breakdown:

- **Dependencies**: It requires `friendly-snippets`.
- **Key Mappings**:
  - **`<C-s>e`**: Expands the current snippet.
  - **`<C-s>;`**: Jumps to the next placeholder in the snippet.
  - **`<C-s>,`**: Jumps to the previous placeholder.
  - **`<C-E>`**: Changes the choice in a choice node if one is active.

This setup enhances coding efficiency by streamlining snippet management.
---
###  `Telescope`
---
This code configures the **Telescope** plugin in Neovim, enhancing file searching and navigation capabilities. Key mappings are established:

- **`<leader>pf`**: Opens a file finder.
- **`<C-p>`**: Searches for Git files.
- **`<leader>ps`**: Greps the word under the cursor.
- **`<leader>pWs`**: Greps the word (with uppercase).
- **`<leader>vh`**: Lists help tags.

These mappings streamline file and content searches, improving workflow efficiency in Neovim.
---
### `Undo tree`
---
**UndoTree** is a Neovim plugin that visualizes the undo history of your edits in a tree-like structure. It allows you to see all changes made to a file, including branching paths for when changes are undone and redone. This visual representation helps users navigate through their editing history easily, enabling them to restore previous states or understand the sequence of edits more effectively. Overall, it enhances the standard undo functionality by providing a clearer overview of changes.

 It creates a key mapping:

- **`<leader>u`**: Toggles the display of the undo tree, allowing you to visualize and navigate through the history of changes made in your files.

 This feature helps in efficiently managing and reverting changes.
