﻿if exists("g:loaded_vim_simple_complete")
  finish
endif
let g:loaded_vim_simple_complete = 1

let g:vsc_completion_command = get(g:, 'vsc_completion_command', "\<C-P>")
let g:vsc_reverse_completion_command = get(g:, 'vsc_reverse_completion_command', "\<C-N>")
let g:vsc_tab_complete = get(g:, 'vsc_tab_complete', 1)
let g:vsc_type_complete = get(g:, 'vsc_type_complete', 1)
let g:vsc_type_complete_length = get(g:, 'vsc_type_complete_length', 3)
let g:vsc_pattern = get(g:, 'vsc_pattern', '\k')

fun! s:TabCompletePlugin()
    inoremap <expr> <Tab> <SID>TabComplete(0)
    inoremap <expr> <S-Tab> <SID>TabComplete(1)
    inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<C-G>u\<CR>"

    fun! s:TabComplete(reverse)
        if pumvisible() || s:CurrentChar() =~ g:vsc_pattern
            return a:reverse ? g:vsc_reverse_completion_command : g:vsc_completion_command
        else
            return "\<Tab>"
        endif
    endfun
endfun

fun! s:CurrentChar()
    return matchstr(getline('.'), '.\%' . col('.') . 'c')
endfun

fun! s:TypeCompletePlugin()
    set completeopt+=menu
    set completeopt+=menuone
    set completeopt+=noinsert
    let s:vsc_typed_length = 0

    autocmd InsertCharPre * call s:TypeComplete()
    autocmd InsertEnter * let s:vsc_typed_length = 0

    fun! s:TypeComplete()
        if v:char !~ g:vsc_pattern
            let s:vsc_typed_length = 0
            return ''
        endif

        let s:vsc_typed_length += 1

        if !g:vsc_type_complete || pumvisible()
            return ''
        endif

        if s:vsc_typed_length == g:vsc_type_complete_length
            call feedkeys(g:vsc_completion_command, 'n')
        endif
    endfun
endfun

if g:vsc_type_complete | call s:TypeCompletePlugin() | endif
if g:vsc_tab_complete  | call s:TabCompletePlugin()  | endif
