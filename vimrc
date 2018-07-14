" ------------------------- Bisic Sets -------------------------------
set tabstop=4 "让一个tab等于4个空格
set nu " 行号
set shiftwidth=4
set expandtab
set background=dark
set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
set wildmenu "命令行函数自动补全
set nocompatible
set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI "记住空格用下划线代替
set gfw=幼圆:h10:cGB2312
set foldmethod=indent
set foldlevel=4

" ------------------------- Set StatusLines ----------------------------
" 获取当前路径，将$HOME转化为~
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

" 设置状态栏信息 通过'\' 转义，如 '\ ' 表示空格， '\|' 表示 '|
set statusline=[%n]\%f%m%r%h\\|\pwd:\%{CurDir()}\\|%=\|\%l,%c,\%p%%\\|\ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\\|\\".&fenc)}\\|} 
set laststatus=2 " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue

" ------------------------- Other Settings ----------------------------
"打开文件类型检测：filetype，启用vim插件：plugin，不同文件编辑不同模式：indent
filetype plugin indent on

"打开高亮
syntax on

" 每行超过81个字符长度的部分变色
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/

"  jk 按键代替 esc
inoremap jk <esc>

" ------------------------- Vundle Plugins ----------------------------
" Before to do: 
" `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Vundle 安装的插件
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Python, c++, go auto command 
" Should make after install `./install.sh --clang-completer`
Plugin 'Valloric/YouCompleteMe'

" Python go to definetion
Plugin 'davidhalter/jedi-vim'

" Python code auto format. Dependency: `pip install autopep8`
Plugin 'tell-k/vim-autopep8'
" Plugin 'Chiel92/vim-autoformat'

" Golang go to definetion
Plugin 'fatih/vim-go'

" Json format/syntax tool
Plugin 'elzr/vim-json'

" Nerdtree - A file tree explorer plugin
Plugin 'scrooloose/nerdtree'

" Show tag bar for files
Plugin 'majutsushi/tagbar'

" Thrift plugin
Plugin 'solarnz/thrift.vim'

" Vim auto_completion with `tab`
Plugin 'ervandew/supertab'

" solarized vim
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

" ------------------------- Vundle Settings ----------------------------
"" nerdtree快捷键 F1
map <F1> :NERDTreeMirror<CR>
map <F1> :NERDTreeToggle<CR>

"" tagbar快捷键 F2
map <F2> :TagbarToggle<CR>

"" 自动格式化代码快捷键 F3
autocmd FileType python noremap <buffer> <F3> :call Autopep8()<CR> " For vim-autoformat
" map <F3> :Autoformat<CR> " For vim-autopep8

" Fold/unfold code
nnoremap <space> za
vnoremap <space> zf

" auto pep8 ignore E501
let g:autopep8_ignore="E501"

" 禁用 jedi-vim 的自动补全
let g:jedi#completions_enabled = 0

" 自动打开 nerdtree
autocmd vimenter * NERDTree
" 关闭文件自动退出 nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tagbar 需要安装 Ctags `https://github.com/majutsushi/tagbar/issues/365`
" brew install ctags-exuberant
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" vim solarized dark 配色
syntax enable
set background=dark
colorscheme solarized

" Avro 语法高亮, 需要安装 https://github.com/dln/avro-vim
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" ------------------------- Pyflake Settings ----------------------------
" Install pyflake by `https://github.com/kevinw/pyflakes-vim`
" plugin : pyflasks {'0': close quick fix, '1':open quick fix} , default 1
" Use `https://github.com/w0rp/ale#installation-with-vundle`  instead
"let g:pyflakes_use_quickfix = 0
