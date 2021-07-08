call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'dense-analysis/ale'

call plug#end()

colorscheme gruvbox

let g:ale_linters = {
\   'ruby': ['standardrb', 'rubocop'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\}


function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

syntax enable

set background=dark
set hidden
set number
set relativenumber
set mouse=a
set history=100
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nowrap

map <C-n> :NERDTreeToggle <CR>

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='base16_gruvbox_dark_hard'
