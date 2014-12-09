set formatexpr=FormatEmailText()

nnoremap <silent> Q /^\(\s*>\)\@!<CR>
onoremap <silent> Q V/^.*\n\(\s*>\)\@!<CR>
nnoremap <silent> S /^.*\n--\s*\_$<CR>
onoremap <silent> S V/^.*\n.*\n--\s*\_$<CR>

"want to get autoflow working...
"set fo+=aw

set spell spelllang=en_us textwidth=78

set omnifunc=QueryCommandComplete
let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"

" keymaps
nnoremap <leader>1 <Esc>:%s/^From:\zs.*/ Mark Stillwell <mark@stillwell.me><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <leader>2 <Esc>:%s/^From:\zs.*/ Mark Stillwell <marklee@fortawesome.org><CR>:/^--\s*/+1<CR>dG:r ~/.signature<CR>
nnoremap <leader>3 <Esc>:%s/^From:\zs.*/ Mark Stillwell <m.stillwell@imperial.ac.uk><CR>:/^--\s*/+1<CR>dG:r ~/.mutt/accounts/signature.imperial<CR>
