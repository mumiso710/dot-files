call plug#begin("~/.config/nvim/plugged")
Plug 'junegunn/vim-plug'
Plug 'marko-cerovac/material.nvim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'EdenEast/nightfox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

packloadall                         " すべてのプラグインをロードする
silent! helptags ALL                " すべてのプラグイン用にヘルプファイルをロードする


syntax on                           " シンタックスハイライトを有効化
filetype plugin indent on           " ファイルタイプに基づいたインデントを有効化
set autoindent                      " 新しい行を始めるときに自動でインデント
set expandtab                       " タブをスペースに変換
set tabstop=4                       " タブをスペース4文字とカウント
set shiftwidth=4                    " 自動インデントに使われるスペースの数
set backspace=2                     " 多くのターミナルでバックスペースの挙動を修正
"set undofile                        " 永続アンドゥを有効化
set foldmethod=indent               " コードの折りたたみをインデント区切りでおこなう
autocmd BufRead * normal zR         " ファイルを開いたときにすべての折りたたみを解除する
set wildmenu                        " Tabによる自動補完を有効にする
set wildmode=list:longest,full      " 最長マッチまで補完してから自動補完メニューを開く
set number                          " 行番号を表示
set hlsearch                        " 検索にマッチした部分をハイライト
set clipboard=unnamed,unnamedplus   " システムのクリップボード(*と+)にコピー


" コントロールキーとhjklで分割されたウィンドウ間をすばやく移動する
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" 対応するカッコや引用符を入力する
"inoremap ' ''<esc>i
"inoremap " ""<esc>i
"inoremap ( ()<esc>i
"inoremap { {}<esc>i
"inoremap [ []<esc>i
"inoremap < <><esc>i

" Leaderキーをカンマに変更
let mapleader = "\<space>"

" leader+wでファイルを保存
noremap <leader>w :w<cr>


" すべてのファイルについて永続アンドゥを有効にする
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir


" CtrlPがGitのルートをワーキングディレクトリとして扱うようにする
let g:ctrlp_working_path_mode = 'ra'

" CtrlPのアクションをLeaderキーから始める
noremap <leader>p :CtrlP<cr>
noremap <leader>b :CtrlPBuffer<cr>
noremap <leader>m :CtrlPMRU<cr>

colorscheme nightfox

" air-line setting
let g:airline_theme = 'night_owl'              
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1          
