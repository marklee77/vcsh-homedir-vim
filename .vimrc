" use vim settings instead of vi settings
set nocompatible

" ************************************************************
" * pathogen plugin manager                                  *
" ************************************************************
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" ************************************************************
" * gist-vim                                                 *
" ************************************************************
let g:gist_clip_command = 'xclip -sel clipboard'
let g:gist_open_browser_after_post = 1

" ************************************************************
" * gundo.vim                                                *
" ************************************************************
let g:gundo_right = 1
nnoremap <leader>u :GundoToggle<CR>

" ************************************************************
" * query command complete                                   *
" ************************************************************
let g:qcc_query_command="lbdbq.sh %s"

" ************************************************************
" * supertab                                                 *
" ************************************************************
let b:SuperTabDisabled=0

" ************************************************************
" * vim-airline                                              *
" ************************************************************
let g:airline_powerline_fonts = 1
let g:airline_theme="solarized"
let g:airline#extensions#tabline#enabled = 1

" ************************************************************
" * vim-gnupg                                                *
" ************************************************************
let g:GPGPreferArmor=1
let g:GPGPreferSign=1
let g:GPGDefaultRecipients=['24333385B681EA0B125E7BFCCB8FE39384C1D3F4']

" ************************************************************
" * vim-orgmode                                              *
" ************************************************************
let g:org_export_init_script="~/.emacs"
let g:org_export_verbose=0

" ************************************************************
" * vim-signfify                                             *
" ************************************************************
let g:signify_vcs_list = [ 'git', 'svn', 'bzr' ]
let g:signify_cursorhold_insert = 1
let g:signify_cursorhold_normal = 1
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1
let g:signify_disable_by_default = 0
nnoremap <leader>gt :SignifyToggle<CR>
nnoremap <leader>gh :SignifyToggleHighlight<CR>
nnoremap <leader>gr :SignifyRefresh<CR>
nnoremap <leader>gd :SignifyDebug<CR>
" ************************************************************
" * netrw                                                    *
" ************************************************************
let g:netrw_silent=1

" ************************************************************
" * vim-pandoc                                               *
" ************************************************************
if v:version < 704
  let g:pandoc#modules#disabled = [ 'bibliographies', 'command' ]
endif

" ************************************************************
" * vim-solarized                                            *
" ************************************************************
set background=dark
let g:solarized_termtrans=1
let g:solarized_underline=0
colorscheme solarized

" override some solarized highlight colors
autocmd ColorScheme * highlight clear SpellBad
autocmd ColorScheme * highlight SpellBad ctermfg=red
autocmd ColorScheme * highlight clear SpellCap
autocmd ColorScheme * highlight SpellCap ctermfg=yellow
autocmd ColorScheme * highlight clear SpellRare
autocmd ColorScheme * highlight clear SpellLocal
autocmd ColorScheme * highlight SpellLocal ctermfg=green

" ************************************************************
" * standard vim settings and overrides                      *
" ************************************************************

" utf-8
set encoding=utf-8
set fileencoding=utf-8

" appearance
set nofoldenable
set nonumber
set noruler
set showcmd
set noshowmode
set nowrap
set scrolloff=4
set laststatus=2
set ambiwidth=single
set showbreak=↪

" default indent
set noautoindent
set nocindent
set nosmartindent

" tabs
set shiftwidth=4
set tabstop=4
set expandtab

" formatting
set formatoptions=tcrnql
set textwidth=80

" search
set nohlsearch
set ignorecase
set smartcase
set incsearch

" input behavior
set backspace=indent,eol,start

" backups
set nobackup

" turn off bells
set visualbell
set noerrorbells
set flash

" disable ex mode
nnoremap Q <nop>

" helpers
set grepprg=grep\ -nH\ $*
set equalprg=par\ -w80
set spell spelllang=en_us

filetype plugin on
syntax on

" highlight chars over textwidth
if &textwidth > 0 | exec 'match Todo /\%>' . &textwidth . 'v.\+/' | endif

" highlight unwanted spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\m\s\+\%#\@<!$\| \+\ze\t\|^\t\+\zs \+\|[^\t]\zs\t\+/
autocmd InsertLeave * redraw!

" check for autocmd
if has("autocmd")
  augroup makefile
    autocmd!
    autocmd BufNewFile,BufRead [Mm]akefile set noexpandtab nowrap
  augroup text
    autocmd!
  augroup markdown
    autocmd!
    au BufNewFile,BufRead *.md set filetype=pandoc
  augroup tex
    autocmd!
    autocmd BufEnter *.tex let g:tex_flavor='latex'
    autocmd BufEnter *.tex let g:Tex_BIBINPUTS='~/Academia/biblio/'
  augroup todo
    autocmd!
    autocmd BufNewFile,BufRead todo.txt set filetype=todo
  augroup END

  if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
    augroup END
  endif

endif " has("autocmd")

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" clipboard
set clipboard=unnamedplus
