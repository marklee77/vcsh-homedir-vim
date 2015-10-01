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

" autocmd BufWritePre,FileWritePre * 1/^\s*$/,/^--\s*$/s/^ \{4}.\{-}\zs\s*$//e
"autocmd BufWritePre,FileWritePre * 
"    \ let w:winview = winsaveview() | 
"    \ 1 | /^\s*$/,/^--\s*$/s/^ \{4}.\{-}\zs\s*$//e | 
"    \ if exists('w:winview') | call winrestview(w:winview) | endif

" keymaps
nnoremap <buffer> <silent> <localleader>1 <Esc>:%s/^From:\zs.*/ Mark Stillwell <mark@stillwell.me><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>2 <Esc>:%s/^From:\zs.*/ Mark Stillwell <marklee@fortawesome.org><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>3 <Esc>:%s/^From:\zs.*/ Mark Stillwell <m.stillwell@imperial.ac.uk><CR>:/^--\s*/+1<CR>dG:r ~/.mutt/accounts/signature.imperial<CR>
