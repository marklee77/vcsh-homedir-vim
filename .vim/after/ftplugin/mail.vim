setlocal spell spelllang=en_us 
setlocal textwidth=78

nnoremap <buffer> <silent> Q /^\(>\)\@!<CR>
onoremap <buffer> <silent> Q V/^.*\n\(>\)\@!<CR>
nnoremap <buffer> <silent> S /^.*\n-- \_$<CR>
onoremap <buffer> <silent> S V/^.*\n.*\n-- \_$<CR>

set formatexpr=FormatEmailText()

setlocal omnifunc=QueryCommandComplete
" let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"

function! EmailContext()
    let l = line('.')
    while l > 1 && getline(l) !~ ':' && getline(l - 1) !~ '^\s*$'
        let l -= 1
    endwhile
    if getline(l) =~ '^Attach:'
        return "\<c-x>\<c-f>"
    endif
    return "\<c-x>\<c-o>"
endfunction

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabCompletionContexts = ['EmailContext']

nnoremap <buffer> <silent> <localleader>1 <Esc>:call SetEmail("Mark Stillwell <mark@stillwell.me>", "~/.signature")<CR>
nnoremap <buffer> <silent> <localleader>2 <Esc>:call SetEmail("Mark Stillwell <marklee@fortawesome.org>", "~/.signature")<CR>
nnoremap <buffer> <silent> <localleader>3 <Esc>:call SetEmail("Mark Stillwell <m.stillwell@imperial.ac.uk>", "~/.mutt/accounts/signature.imperial")<CR>

autocmd BufWrite <buffer> call FixFlowed()
call FixFlowed()

1/^$/
execute "normal OAttach: "
1/^To:/
