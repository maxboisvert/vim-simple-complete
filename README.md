# Vim Simple Complete

This plugin offers as-you-type keyword completion and tab complete in less than 100 lines of code.

In action : https://asciinema.org/a/5y5ggl0pseprxopox06a2vt5s

## Requirements
vim version >= 7.4

## Installation

With `vim-plug`:
```
Plug 'maxboisvert/vim-simple-complete'
```

Or use your prefered way.

## Usage

## As-you-type completion

After three (3) typed [keywords (\k)](http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion), the completion menu becomes visible. Press Tab to select a match.

## Tab Complete

Press Tab to trigger completion when the cursor is in front of a completable character. When the completion menu is visible, use Tab/Shift-Tab to rotate selection.

## Options

See [available options](/plugin/vim-simple-complete.vim#L6).

## Tips

Personally, I don't use included files and tag complete for better performances. Add this to your vimrc for these options :
```VimL
set complete-=t
set complete-=i
```

## License

Copyright (c) 2016 Maxime Boisvert.

This program is distributed under the [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license).
