
" vim-simple-complete
" maxboisvert.com
" https://github.com/maxboisvert/vim-simple-complete

if exists("g:loaded_vim_simple_complete")
  finish
endif
let g:loaded_vim_simple_complete = 1

fun! Init()
    call MinimalistAutocompletePlugin()
    call MinimalistTabCompletePlugin()
endfun

fun! MinimalistTabCompletePlugin()
    " Minimalist-TabComplete-Plugin
    inoremap <expr> <Tab> TabComplete()
    fun! TabComplete()
        if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
            return "\<C-P>"
        else
            return "\<Tab>"
        endif
    endfun
endfun

fun! MinimalistAutocompletePlugin()
    " Minimalist-AutoCompletePop-Plugin
    set completeopt=menu,menuone,noinsert,preview
    inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
    autocmd InsertCharPre * call AutoComplete()
    fun! AutoComplete()
        if v:char =~ '\K'
            \ && getline('.')[col('.') - 4] !~ '\K'
            \ && getline('.')[col('.') - 3] =~ '\K'
            \ && getline('.')[col('.') - 2] =~ '\K' " last char
            \ && getline('.')[col('.') - 1] !~ '\K'

            call feedkeys("\<C-P>", 'n')
        end
    endfun
endfun

call Init()

