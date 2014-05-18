" NEOBUNDLE
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))
" ここでプラグインをインストール
NeoBundle "https://github.com/nanotech/jellybeans.vim.git"
NeoBundle "https://github.com/vim-scripts/hybrid.vim.git"
filetype plugin indent on
syntax on
let mapleader = ','
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap <Down> gj
noremap <Up> gk
nnoremap <Leader>ev :tabnew $HOME/.vimrc<CR>
nnoremap <Leader>rv :source $HOME/.vimrc<CR>
set number
set cursorline
set list
set listchars=eol:¬,tab:▸\ 
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=20

