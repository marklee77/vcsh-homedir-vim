setlocal spell spelllang=en_us 
setlocal textwidth=72

nnoremap <buffer> <silent> Q /^\(>\)\@!<CR>
onoremap <buffer> <silent> Q V/^.*\n\(>\)\@!<CR>
nnoremap <buffer> <silent> S /^.*\n-- \_$<CR>
onoremap <buffer> <silent> S V/^.*\n.*\n-- \_$<CR>

nnoremap <buffer> <silent> <localleader>1 <Esc>:%s/^From:\zs.*/ Mark Stillwell <mark@stillwell.me><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>2 <Esc>:%s/^From:\zs.*/ Mark Stillwell <marklee@fortawesome.org><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>3 <Esc>:%s/^From:\zs.*/ Mark Stillwell <m.stillwell@imperial.ac.uk><CR>:/^--\s*/+1<CR>dG:r ~/.mutt/accounts/signature.imperial<CR>

set formatexpr=FormatEmailText()
" FIXME: not sure about w now...
set fo+=w

setlocal omnifunc=QueryCommandComplete
let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"

function! FixFlowed()
    let pos = getpos('.')

    " compress quote characters
    while search('^>\+\s\+>', 'w') > 0
        silent! s/^>\+\zs\s\+>/>/
    endwhile
    silent! %s/^>\+\zs\([^[:space:]>]\)\@=/ /

    " strip off trailing spaces
    silent! %s/\s*$//

    " put a space back after signature delimiter
    silent! $?^--$?s/$/ /

    " un-space stuff from
    silent! 1/^$/;/^-- $/s/^\s\(\s*\)\zeFrom\_s/\1/
    
    " put spaces back at ends of lines in paragraph lines, where paragraph lines
    " are defined as lines followed by lines with the same quote prefix (nothing
    " or some number of > followed by a space) that starts with an optional
    " opening punctuation mark, one of "*([{@~|>, that is immediately followed
    " by a letter or digit.
    silent! 1/^$/;/^-- $/s/\(>\+\s\|\).*\S\zs\(\_$\n\1["*(\[{@~|<]\=[0-9A-Za-z]\)\@=/ /

    " space stuff from
    silent! 1/^$/;/^-- $/s/^\(\s*\)\zeFrom\_s/ \1/

    call setpos('.', pos)
endfunction

autocmd BufWritePre <buffer> call FixFlowed()
call FixFlowed()
