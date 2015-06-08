# Work with windows:

### Base

 - `C-g` - cancel any command

### Move between windows

 - `C-c b` - go to left window
 - `C-c f` - go to right window
 - `C-c p` - go to window up
 - `C-c n` - go to window down
 - `C-c c` - go to **previous** frame
 - `C-c v` - go to **next** frame
 - `C-x o` - next window

### Creation/deletion of windows

 - `C-x 4 d` - open new window with **Dired**
 - `C-x 0` - get rid of selected window
 - `C-x 1` - get rid of all windows except selected
 - `C-x 2` - Split the selected window into two windows, one **above** the other
 - `C-x 3` - Split the selected window into two windows, positioned **side by side**

### Resizing windows

 - `C-x ^` - Make the selected window taller, at the expense of the other(s) (enlarge-window).
 - `C-x }` - Widen the selected window (enlarge-window-horizontally).
 
### Frames/bufers

 - `C-x, C-b` - list of buffers
 - `C-x b` - list of buffers (oneliner)
 - `M-x rename-buffer` - rename buffer


# Editing

### Copy/paste/selection

 - `C-<SPACE>` - **start** of **selection** of region
 - `C-x h` - Move point to the beginning of the buffer, and set mark at the end
 - `M-@` - **select** next **word**
 - `M-w` - **copy** selected region
 - `C-w` - **cut** selected region
 - `C-y` - **paste** from buffer
 - `C-k` - **cut string** from current position (or delete it into buffer)
 - `M-x whitespace-mode` - enable Python whitespace mode to cleanup code
 - `C-x C-v` - re-read file from filesystem

### Search/replace

 - `C-s` - **search** substring
 - `M-%` - replace substring (and then press `y`)

### Scrolling/positioning

 - `C-v` - Scroll down (page down)
 - `M-v` - Scroll up (page up)
 - `M-<LEFT/RIGHT ARROWS>` - move one **word** left/right
 - `M-f` - next word
 - `M-b` - previous word
 - `M-<` - top of file
 - `M->` - end of file
 
### Indentation

 - `C-<SPACE>` - select region
 - `C-u 4 C-x <TAB>` - indent for 4 spaces
 - `C-c` - one level indent +
 - `C-c <` - unindent 1 level (**python**)
 - `C-c >` - indent 1 level (**python**)
 - `C-u -4 M-x indent-rigidly` - unindent for *4* spaces

### Undo/redo
 - `C+x u` - undo


### Work with words

 - `M-d` - kill up to the end of word
 - `M-<DEL>` - kill up to beginning of word

# Work with multiple files

 - `M-x rgrep` - Search in files

## Dired (within dired listing)

 - `C-x b <filename> RET C-x C-w <filename> RET` - create new file from **DIRED**
 - `o` - open file in another window and **focus** on that window
 - `C-o` - open file in another window and **keep focus on dired**
 - `<RET>` - open file in same window
 - `^` - go to **parent** directory
 - `+` - create new directory
 

## Utils

 - `M-x eshell` - EMACS **shell**
 - `C-u <x>` - multiply following command `<x>` times
 - `M-<Shift>-1` - shell line
 
## Keyboard macros
 - `C-x (` - lets you start define a keyboard macro - basically records what you do, so do exactly what you want your macro to do
 - `C-x )` - end the definition of the keyboard macro
 - `C-x e` - executes the keyboard macro
 
 # Syntax and code checks
 
  - `M-x flycheck-mode` - enable flycheck mode
  