"! # Vim Simple Complete
"! This is a simple vim plugin that add tab complete and type complete in less then 50 lines of code.
"
"! ## Requirements
"! vim version >= 7.4
"
"! ##Installation
"! With Plug (https://github.com/junegunn/vim-plug) :
"! ```
"! Plug 'maxboisvert/vim-simple-complete'
"! ```
"
"! ## Tips
"! Personally, I don't use included files and tag complete for better performances. Add this to your vimrc for these options :
"! ```
"! set complete-=t
"! set complete-=i
"! ```
"
"! ##Usage

if exists("g:loaded_vim_simple_complete")
  finish
endif
let g:loaded_vim_simple_complete = 1

fun! Init()
    call TypeCompletePlugin()
    call TabCompletePlugin()
endfun

fun! TabCompletePlugin()
    "! ## Tab Complete
    "! Press Tab to trigger completion. When the completion popup is visible, use Tab to rotate selection.

    inoremap <expr> <Tab> TabComplete()

    fun! TabComplete()
        if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
            return "\<C-P>"
        else
            return "\<Tab>"
        endif
    endfun
endfun

fun! TypeCompletePlugin()
    "! ## Type Complete
    "! After three (3) typed keyword (\K), the completion popup becomes visible. Press Enter to insert the current selection.

    set completeopt=menu,menuone,noinsert,preview
    inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
    autocmd InsertCharPre * call TypeComplete()

    fun! TypeComplete()
        if v:char =~ '\K'
            \ && getline('.')[col('.') - 4] !~ '\K'
            \ && getline('.')[col('.') - 3] =~ '\K'
            \ && getline('.')[col('.') - 2] =~ '\K' " last typed char
            \ && getline('.')[col('.') - 1] !~ '\K'

            call feedkeys("\<C-P>", 'n')
        end
    endfun
endfun

call Init()
