if exists("g:loaded_vim_simple_complete")
  finish
endif
let g:loaded_vim_simple_complete = 1

fun! s:Init()
    call s:TypeCompletePlugin()
    call s:TabCompletePlugin()
endfun

fun! s:TabCompletePlugin()
    inoremap <expr> <Tab> <SID>TabComplete()

    fun! s:TabComplete()
        if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
            return "\<C-P>"
        else
            return "\<Tab>"
        endif
    endfun
endfun

fun! s:TypeCompletePlugin()
    set completeopt=menu,menuone,noinsert,preview
    imap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
    autocmd InsertCharPre * call s:TypeComplete()

    fun! s:TypeComplete()
        if v:char =~ '\K'
            \ && getline('.')[col('.') - 4] !~ '\K'
            \ && getline('.')[col('.') - 3] =~ '\K'
            \ && getline('.')[col('.') - 2] =~ '\K' " last typed char
            \ && getline('.')[col('.') - 1] !~ '\K'

            call feedkeys("\<C-P>", 'n')
        end
    endfun
endfun

call s:Init()
