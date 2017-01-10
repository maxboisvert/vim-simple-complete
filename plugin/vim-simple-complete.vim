if exists("g:loaded_vim_simple_complete")
  finish
endif
let g:loaded_vim_simple_complete = 1

let g:vsc_completion_command = get(g:, 'vsc_completion_command', "\<C-P>")
let g:vsc_reverse_completion_command = get(g:, 'vsc_reverse_completion_command', "\<C-N>")
let g:vsc_tab_complete = get(g:, 'vsc_tab_complete', 1)
let g:vsc_type_complete = get(g:, 'vsc_type_complete', 1)
let g:vsc_type_complete_length = get(g:, 'vsc_type_complete_length', 3)

fun! s:Init()
    if g:vsc_type_complete
        call s:TypeCompletePlugin()
    endif

    if g:vsc_tab_complete
        call s:TabCompletePlugin()
    endif
endfun

fun! s:TabCompletePlugin()
    inoremap <expr> <Tab> <SID>TabComplete(0)
    inoremap <expr> <S-Tab> <SID>TabComplete(1)

    fun! s:TabComplete(reverse)
        if pumvisible()
            return a:reverse ? "\<Down>" : "\<Up>"
        elseif getline('.')[col('.') - 2] =~ '\K'
            return a:reverse ? g:vsc_reverse_completion_command : g:vsc_completion_command
        else
            return "\<Tab>"
        endif
    endfun
endfun

fun! s:TypeCompletePlugin()
    set completeopt=menu,menuone,noinsert,preview
    autocmd InsertCharPre * call s:TypeComplete()

    fun! s:TypeComplete()
        if !g:vsc_type_complete || pumvisible() || v:char !~ '\K'
            return ''
        endif

        let i = 2

        while i <= g:vsc_type_complete_length
            if getline('.')[col('.') - i] !~ '\K'
                return ''
            endif

            let i += 1
        endwhile

        if getline('.')[col('.') - i] !~ '\K'
            call feedkeys(g:vsc_completion_command, 'n')
        endif
    endfun
endfun

call s:Init()
