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
