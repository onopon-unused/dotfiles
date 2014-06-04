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
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'vim-scripts/opsplorer'
NeoBundle 'c9s/perlomni.vim'
call neobundle#end()
filetype plugin indent on
syntax on

" 入っていないプラグインをチェックする
NeoBundleCheck

colorscheme elflord

" <Leaderを「,」に
let mapleader = ','

" 移動単位を行にする
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap <Down> gj
noremap <Up> gk

" Ctrl+eと$の置き換え(Ctrl+eでその行の最後の文字にジャンプ)
noremap <C-E> $
noremap $ <C-E>

" Ctrl+a と0のnoremap（Ctrl+aでその行の最初の文字にジャンプ)
noremap <C-A> 0

" .vimrcを新しいタブで開く
nnoremap <Leader>ev :tabnew $HOME/.vimrc<CR>

" .vimrcを読み込む（更新）
nnoremap <Leader>rv :source $HOME/.vimrc<CR>

" 現在のバッファがあるディレクトリの一覧を表示
nnoremap <Leader>ud :UniteWithBufferDir -buffer-name=files file<CR>

" 行番号の表示
set number

" 現在の行表示
set cursorline

" 常時ステータスライン表示
set laststatus=2
"set list

set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=20

" INSESRT時にバックスペースを利用可能にする
set backspace=indent,eol,start


" ##############################
" ####### indent-guides ########
" ##############################
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
set ts=2 sw=2 et
let g:indent_guides_start_level=4
let g:indent_guides_auto_colors=1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1


" ##############################
" ######## neocomplcace ########
" ##############################
" AutoComplPopプラグインを無効にする。
" let g:acp_enableAtStartup = 0

" neocomplcacheを起動時に呼び出す
let g:neocomplcache_enable_at_startup = 1

" smartcase機能の有効化。
" 大文字が入力されるまでの間大文字と小文字の入力を無視する（予測用）
let g:neocomplcache_enable_smart_case = 1

" シンタックスをキャッシュする時の最小文字長を設定。
" デフォルトは4
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動ロックするバッファ名のパターンの指定。
" neocomplcacheと相性の悪いプラグインを使用する場合に設定する。
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" キャメルケースのような大文字区切りの保管を有効にする。
" 動作が重たくなる恐れあり。
"let g:neocomplcache_enable_camel_case_completion = 1

" アンダーバー区切りの保管を有効にする。
let g:neocomplcache_enable_underbar_completion = 1

" ファイルタイプ毎にneocomplcacheのディクショナリを設定する。 
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" キーワードパターンの設定を行う。
" neocomplcacheが対応していない言語を使う場合に、変更を加える。 
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 前回行われた保管をキャンセルする。
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 補完候補のなかから、共通する部分を補完する。
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" スーパータブの挙動をエミュレーションする。
" スニペットが展開可能な時は展開、補完中は次の候補を選択し、
" そうでなければ<Tab>を挿入する。
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>や<BS>をおした時にポップアップを確実に削除する。
" g:neocomplcahe_enable_auto_selectを有効にする場合は、この設定を必ずする。
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" 現在選択している候補を確定する。
inoremap <expr><C-y>  neocomplcache#close_popup()

" 現在選択している候補をキャンセルし、ポップアップを閉じる。
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
