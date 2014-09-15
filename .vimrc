" pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" powerline
" let g:Powerline_symbols='fancy'
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" org-mode
let g:org_export_init_script="~/.emacs"
let g:org_export_verbose=0

" gnupg
let g:GPGPreferArmor=1
let g:GPGPreferSign=1
let g:GPGDefaultRecipients=['24333385B681EA0B125E7BFCCB8FE39384C1D3F4']

" query command complete
let g:qcc_query_command="/bin/true"

" use vim settings instead of vi settings
set nocompatible

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

" helpers
set grepprg=grep\ -nH\ $*
set equalprg=par\ -w80
set spell spelllang=en_us

" colors
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

filetype plugin on
syntax on

" highlight chars over textwidth
if &textwidth > 0 | exec 'match Todo /\%>' . &textwidth . 'v.\+/' | endif


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
  "augroup haskell
  "  autocmd!
  "  autocmd BufEnter *.hs compiler ghc
  "  autocmd BufEnter *.hs let g:haddock_browser = "/usr/bin/firefox"
  "  autocmd BufEnter *.hs let g:ghc = "/usr/bin/ghc"
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

