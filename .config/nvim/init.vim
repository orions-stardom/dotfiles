call plug#begin()
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'skywind3000/vim-terminal-help'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'
  Plug 'tyrannicaltoucan/vim-quantum'
  Plug 'sbdchd/vim-run'
call plug#end()

set termguicolors
set background=dark
let g:quantum_black=1
let g:quantum_italics=1
colorscheme quantum 

let g:lightline = {
  \ 'colorscheme': 'quantum',
  \ 'active': {
  \   'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
  \ },
  \ 'component_function': { 'gitbranch': 'FugitiveHead' },
  \ }

syntax on

let g:terminal_cwd=2 " Project root
let g:terminal_key='<M-~>'
let g:terminal_close=1

nmap <F5> :exe "H " . substitute(expand('%:~:.'), '\v^([^/]+$)@=', './', 'e')<CR>
tnoremap <Esc> <C-\><C-n>

set exrc
set secure

set laststatus=2
set noshowmode

set clipboard=unnamedplus
