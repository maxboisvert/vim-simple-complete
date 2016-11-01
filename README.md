# Vim Simple Complete

This plugin offers as-you-type keyword completion and tab complete in less than fifty lines of code.

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

## As-you-type completion
After three (3) typed keywords (\K), the completion popup becomes visible. Press Enter to insert the current selection.

## Tab Complete
Press Tab to trigger completion. When the completion popup is visible, use Tab/Shift-Tab to rotate selection.

## Options

```VimL
" Enable/Disable tab key completion mapping
let g:vsc_tab_complete = 1

" Completion command used
let g:vsc_completion_command = "\<C-P>"

" Reverse completion command used
let g:vsc_reverse_completion_command = "\<C-N>"
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
