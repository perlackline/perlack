syntax on

" 文字コード設定
set encoding=utf-8
" 文字コード自動判別
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" 改行コード自動認識
" NOTE: 先頭から順番にマッチするため dos を先頭に
" 置くと改行コードが標準で LF になりシェルスク
" リプト等で問題になる。
" 改行コードの確認は cat -e。
" LF の除去は sed -i 's/\r//' file。
" set fileformats=dos,unix,mac
set fileformats=unix,dos,mac

" ハイライトサーチをしない
set nohlsearch
" 行番号を表示する
set number
" カラースキーム
" colorscheme desert
colorscheme elflord
" tab
set tabstop=4
"ステータス行の表示
set laststatus=2
"ステータス行の項目
set statusline=[%F]%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}%=
set statusline+=[row:%l][column:%c][line:%L]

" show insert/replase mode
set showmode
