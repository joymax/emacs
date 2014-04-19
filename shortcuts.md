# Work with windows:

### Move between windows

 - `C-c b` - go to left window
 - `C-c f` - go to right window
 - `C-c p` - go to window up
 - `C-c n` - go to window down
 - `C-x o` - next window

### Creation/deletion of windows

 - `C-x 4 d` - open new window with **Dired**
 - `C-x 0` - get rid of selected window
 - `C-x 1` - get rid of all windows except selected

### Resizing windows

 - `C-x ^` - Make the selected window taller, at the expense of the other(s) (enlarge-window).
 - `C-x }` - Widen the selected window (enlarge-window-horizontally).
 
### Buffers

 - `C-x, C-b` - list of buffers
 - `C-x b` - list of buffers (oneliner)


# Editing

### Copy/paste

 - `C-k` - **cut** string from current position (or delete it into buffer)
 - `C-y` - **paste** string

### Search/replace

 - `C-s` - **search** substring
 - `M-%` - replace substring (and then press `y`)

### Scrolling/positioning

 - `C-v` - Scroll down (page down)
 - `M-v` - Scroll up (page up)
 - `M-<LEFT/RIGHT ARROWS>` - move one **word** left/right

### Indentation
 - `C-c` - one level indent +

# Work with multiple files

 - `M-x rgrep` - Search in files

## Dired (within dired listing)

 - `o` - open file in another window and **focus** on that window
 - `C-o` - open file in another window and **keep focus on dired**
 - `<RET>` - open file in same window
 - `^` - go to **parent** directory
 