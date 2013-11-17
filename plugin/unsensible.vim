" sensible.vim - Defaults modified from Tim Pope's vim-sensible
" Maintainer:   Josh Hoak
" Version:      1.0

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

command! EditBaseSettings execute 'edit ' . $HOME .
    \ '/.vim/bundle/vim-unsensible/plugin/unsensible.vim'

set autoindent
set autoread
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set complete-=i
set directory=~/.vim/tmp " Swap file directory
set encoding=utf-8
set expandtab
set fileformats+=mac
set undodir=~/.vim/undo
set hidden
set history=1000
set hlsearch
set incsearch
set inde=<CR>
set laststatus=2  " Always show last status
set list
set listchars=tab:»\ ,trail:\ ,extends:>,precedes:<,nbsp:+
set nocindent
set nosmartindent
set nrformats-=octal
set number
set ruler
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set smarttab
set softtabstop=2
set tabpagemax=50
set tabstop=4
set ttimeout
set ttimeoutlen=50
<<<<<<< HEAD
=======
" set splitbelow
>>>>>>> bbedd7317fc393f1fe4d2564a88fa320fc57fb84
set splitright
set wildmode=longest,list,full

hi StatusLine ctermfg=cyan guiFg=cyan
hi SpecialKey ctermbg=yellow guibg=yellow

" Too lazy to press shift...
nnoremap ; :

" Unhighlight search
nnoremap <silent> \\ :nohlsearch<CR>

" Psate Toggle
command Pa set invpaste

inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" In GVIM, Shift-Direction scrolls the window, which I hate.
nnoremap <S-UP> k
nnoremap <S-DOWN> j
inoremap <S-UP> k
inoremap <S-DOWN> j

autocmd BufNewFile,BufEnter * silent! lcd %:p:h
let g:netrw_keepdir = 0

autocmd BufEnter * let &titleold=""
autocmd BufEnter * let &titlestring=expand("%")
autocmd BufEnter * set title titlelen=70

" Remember the previous position in the file
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd BufWinEnter * call ResCur()
augroup END

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if !empty(&viminfo)
  set viminfo^=!
endif

if exists('+undofile')
  set undofile
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" vim:set ft=vim et sw=2:
