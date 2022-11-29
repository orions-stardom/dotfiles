call plug#begin()
  Plug 'itchyny/lightline.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'skywind3000/vim-terminal-help'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-vinegar'
call plug#end()

set termguicolors
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

syntax on

let g:terminal_cwd=2 " Project root
let g:terminal_key='<M-`>'

set laststatus=2
set noshowmode

set clipboard=unnamedplus
