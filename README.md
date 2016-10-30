# Vim Simple Complete
This is a simple vim plugin that add tab complete and complete as you type in less then 50 lines of code.

In action : https://asciinema.org/a/5y5ggl0pseprxopox06a2vt5s

## Requirements
vim version >= 7.4

##Installation
With Plug (https://github.com/junegunn/vim-plug) :
```VimL
Plug 'maxboisvert/vim-simple-complete'
```

Or use your prefered way.

## Usage

## Tab Complete
Press Tab to trigger completion. When the completion popup is visible, use Tab to rotate selection.

## Type Complete
After three (3) typed keyword (\K), the completion popup becomes visible. Press Enter to insert the current selection.

## Options

```VimL
" Enable/Disable tab key completion mapping
let g:vsc_tab_complete = 1

" Completion command used
let g:vsc_completion_command = "\<C-P>"
```

## Tips
Personally, I don't use included files and tag complete for better performances. Add this to your vimrc for these options :
```VimL
set complete-=t
set complete-=i
```

## License

Copyright (c) 2016 Maxime Boisvert.
This program is licensed under the [GPLv3 license][gpl].
[gpl]: http://www.gnu.org/copyleft/gpl.html
