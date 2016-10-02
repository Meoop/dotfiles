" 显示行号
set nu

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 开启文件类型侦测
filetype on
" " 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 插件安装
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'   	"主题
Plugin 'Lokaltog/vim-powerline'		        	"状态栏
Plugin 'octol/vim-cpp-enhanced-highlight'       "c++语法高亮支持
Plugin 'SirVer/ultisnips'                       "模板补全
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'                 "智能补全
Plugin 'suan/vim-instant-markdown'              "markdown 即时预览
Plugin 'Chiel92/vim-autoformat'                 "格式化代码
Plugin 'Raimondi/delimitMate'                   "括号/引号匹配
Plugin 'scrooloose/nerdcommenter'               "注释
Plugin 'scrooloose/nerdtree'                    "工程文件浏览
Plugin 'majutsushi/tagbar'                      "基于标签的标识符列表

" 插件列表结束
call vundle#end()
filetype plugin indent on

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 设置 gvim 显示字体
" set guifont=YaHei\ Consolas\ Hybrid\ 10.5

" 配色方案
" set background=
" colorscheme solarized

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'


" 缩进
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 代码折叠
" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>""

" 代码格式化
" 绑定快捷键F3
noremap <F6> :Autoformat<CR>

" 代码注释
filetype plugin on
" 默认情况下注释分隔符后添加空格
let g:NERDSpaceDelims = 1

" 工程文件浏览
" 打开nerdtree的快捷键
map <F3> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=30
" 打开nerdtree，并选择当前文件
nmap ,t :NERDTreeFind<CR>
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
" let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 自动打开或者关闭NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 过滤文件类型
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" 基于标签的标识符列表
" 显示tagbar
map <F4> :TagbarToggle<CR>
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=0 
" 设置标签子窗口的宽度 
let tagbar_width=30 
" 自动对焦
let g:tagbar_autofocus = 1
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


