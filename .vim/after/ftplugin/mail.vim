set formatexpr=FormatEmailText()
autocmd BufWrite <buffer> call FixFlowed()
call FixFlowed()

setlocal spell spelllang=en_us 
setlocal textwidth=78

setlocal omnifunc=QueryCommandComplete

" let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"
let g:SuperTabDefaultCompletionType = 'context'

function! EmailContext()
    let fieldname = GetFieldName()
    if !empty(fieldname)
        if fieldname ==? 'attach'
            return "\<c-x>\<c-f>"
        endif
        return "\<c-x>\<c-o>"
    endif
    return "\<c-x>\<c-k>"
endfunction

let g:SuperTabCompletionContexts = ['EmailContext']

nnoremap <buffer> <silent> F 1G/^\s*$<CR>OAttach: 

nnoremap <buffer> <silent> Q /^\(>\)\@!<CR>
onoremap <buffer> <silent> Q V/^.*\n\(>\)\@!<CR>
nnoremap <buffer> <silent> S /^.*\n-- \_$<CR>
onoremap <buffer> <silent> S V/^.*\n.*\n-- \_$<CR>

nnoremap <buffer> <silent> <localleader>1 <Esc>:call SetEmail("Mark Stillwell <mark@stillwell.me>", "~/.signature")<CR>
nnoremap <buffer> <silent> <localleader>2 <Esc>:call SetEmail("Mark Stillwell <marklee@fortawesome.org>", "~/.signature")<CR>
nnoremap <buffer> <silent> <localleader>3 <Esc>:call SetEmail("Mark Stillwell <m.stillwell@imperial.ac.uk>", "~/.mutt/accounts/signature.imperial")<CR>
