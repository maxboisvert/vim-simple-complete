# Vim Simple Complete

This plugin offers as-you-type keyword completion and tab complete in less than 100 lines of code.

In action : https://asciinema.org/a/5y5ggl0pseprxopox06a2vt5s

## Requirements
vim version >= 7.4

## Installation

### Pathogen
```
git clone https://github.com/maxboisvert/vim-simple-complete ~/.vim/bundle/vim-simple-complete
```

Run `:Helptags` to generate help tags

### NeoBundle
`NeoBundle 'maxboisvert/vim-simple-complete'`

### Vundle
`Plugin 'maxboisvert/vim-simple-complete'`

### Plug
`Plug 'maxboisvert/vim-simple-complete'`

### Manual
copy plugin in `~/.vim`

Or use your prefered way.

## Usage

## As-you-type completion
After three (3) typed [keywords (\k)](http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion), the completion popup becomes visible. Press Enter to insert the current selection.

## Tab Complete
Press Tab to trigger completion. When the completion popup is visible, use Tab/Shift-Tab to rotate selection.

## Options

```VimL
" Enable/Disable tab key completion mapping
let g:vsc_tab_complete = 1

" Enable/Disable As-you-type completion
let g:vsc_type_complete = 1

" Completion command used
let g:vsc_completion_command = "\<C-P>"

" Reverse completion command used
let g:vsc_reverse_completion_command = "\<C-N>"

" Number of character to type to trigger completion
let g:vsc_type_complete_length = 3
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
