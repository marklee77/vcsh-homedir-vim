set formatexpr=FormatEmailText()
set fo+=w

" markdown syntax highlighting
"set filetype=pandoc
"syntax on

nnoremap <buffer> <silent> Q /^\(\s*>\)\@!<CR>
onoremap <buffer> <silent> Q V/^.*\n\(\s*>\)\@!<CR>
nnoremap <buffer> <silent> S /^.*\n--\s*\_$<CR>
onoremap <buffer> <silent> S V/^.*\n.*\n--\s*\_$<CR>

setlocal spell spelllang=en_us 
setlocal textwidth=72

setlocal omnifunc=QueryCommandComplete
let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"

function! FixFlowed()
    let pos = getpos('.')
    " compress quote characters
    while search('^>\+\s\+>', 'w') > 0
        silent! s/^>\+\zs\s\+>/>/
    endwhile
    " strip off trailing spaces
    silent! %s/\s*$//
    " put a space back after sig delimiter
    silent! %s/^--$/-- /
    " put spaces back at ends of lines in paragraphs
    silent! 1/^\s*$/;/^--\s*$/s/\S\zs\(\_$\n\S\)\@=/ /
    " strip space at eol if quote depth increases
    silent! %s/^\(>\+\).*\zs\s\+\ze\_s\1>//
    " strip space at eol if quote depth decreases
    silent! %s/^\(>\+\).*\zs\s\+\ze\_s\(\1\)\@!//
    " space stuff from
    silent! 1/^\s*$/;/^--\s*$/s/^From\ze\_s/ From/
    call setpos('.', pos)
endfunction

" FIXME: lines should end in no space whenever the quote depth changes...
autocmd BufWritePre <buffer> call FixFlowed()

" keymaps
nnoremap <buffer> <silent> <localleader>1 <Esc>:%s/^From:\zs.*/ Mark Stillwell <mark@stillwell.me><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>2 <Esc>:%s/^From:\zs.*/ Mark Stillwell <marklee@fortawesome.org><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>3 <Esc>:%s/^From:\zs.*/ Mark Stillwell <m.stillwell@imperial.ac.uk><CR>:/^--\s*/+1<CR>dG:r ~/.mutt/accounts/signature.imperial<CR>
