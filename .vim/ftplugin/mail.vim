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
setlocal textwidth=78

setlocal omnifunc=QueryCommandComplete
let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"

if has("autocmd")
    " save preformatted text from format=flowed
    autocmd BufWritePre,FileWritePre * 1/^\s*$/,/^--\s*$/s/^ \{4}.\{-}\zs\s*$//
endif " has("autocmd")

" keymaps
nnoremap <buffer> <silent> <localleader>1 <Esc>:%s/^From:\zs.*/ Mark Stillwell <mark@stillwell.me><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>2 <Esc>:%s/^From:\zs.*/ Mark Stillwell <marklee@fortawesome.org><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <buffer> <silent> <localleader>3 <Esc>:%s/^From:\zs.*/ Mark Stillwell <m.stillwell@imperial.ac.uk><CR>:/^--\s*/+1<CR>dG:r ~/.mutt/accounts/signature.imperial<CR>
