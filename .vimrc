set fileencodings=utf-8,euc-jp,cp932
"NEOBUNDL
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'https://github.com/vim-scripts/hybrid.vim.git'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'vim-scripts/opsplorer'
call neobundle#end()
filetype plugin indent on
syntax on
NeoBundleCheck
let mapleader = ','
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap <Down> gj
noremap <Up> gk
nnoremap <Leader>ev :tabnew $HOME/.vimrc<CR>
nnoremap <Leader>rv :source $HOME/.vimrc<CR>


" 行番号の表示
set number

" 現在の行表示
set cursorline

" 常時ステータスライン表示
set laststatus=2
"set list

set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=20
