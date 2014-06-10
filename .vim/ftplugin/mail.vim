set formatexpr=FormatEmailText()

nnoremap <silent> Q /^\(\s*>\)\@!<CR>
onoremap <silent> Q V/^.*\n\(\s*>\)\@!<CR>
nnoremap <silent> S /^.*\n--\s*\_$<CR>
onoremap <silent> S V/^.*\n.*\n--\s*\_$<CR>

set spell spelllang=en_us textwidth=78

" FIXME: move these to vimrc?
let g:gcc_pattern = '^\(To\|Cc\|Bcc\|Reply-To\):'
let b:SuperTabDisabled=0
let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"

set omnifunc=QueryCommandComplete
