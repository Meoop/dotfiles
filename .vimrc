" 定义快捷键的前缀，即<Leader>
let mapleader=";""

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
Plugin 'octol/vim-cpp-enhanced-highlight'       "c++语法高亮支持增强
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
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>""
let g:UltiSnipsEditSplit="horizontal"

" YCM 补全
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字
let g:ycm_seed_identifiers_with_syntax=1


" 代码格式化
" 绑定快捷键F6
noremap <F6> :Autoformat<CR>

" 代码注释
filetype plugin on
" 默认情况下注释分隔符后添加空格
let g:NERDSpaceDelims = 1

" 工程文件浏览
" 打开nerdtree的快捷键
map <F3> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=25
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 自动打开或者关闭NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 过滤文件类型
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" 标签侧边栏（右侧）
" 显示tagbar
map <F4> :TagbarToggle<CR>
" 设置 tagbar 子窗口的位置出现在主编辑区右侧
let tagbar_left=0 
" 设置标签子窗口的宽度 
let tagbar_width=25 
" 自动对焦
let g:tagbar_autofocus = 1
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 显示相对行号
" let g:tagbar_show_linenumbers = 2
" 排序
let g:tagbar_sort = 0
" c
let g:tagbar_type_c = {
    \ 'kinds' : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 's:structs',
        \ 'u:unions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'f:functions',
    \ ],
\ }
" cpp
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
    \ ],
\ }
" python
let g:tagbar_type_python = {
    \ 'kinds' : [
        \ 'i:imports:1:0',
        \ 'c:classes',
        \ 'f:functions',
        \ 'm:members',
        \ 'v:variables:0:0',
    \ ],
\ }



" 窗口跳转
" Ctrl+W L 向右移动
" Ctrl+W H 向左移动
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


