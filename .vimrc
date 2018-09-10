" ---------------------------------------------------------------------------
"  .vimrc
" ---------------------------------------------------------------------------

" Allow vim to break compatibility with vi
" must be first, because it changes other options
set nocompatible
filetype on


" ---------------------------------------------------------------------------
" vim-plug
" ---------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'                      " Colorscheme for the vim
Plug 'rakr/vim-one'                         " Colorscheme for the vim
Plug 'bling/vim-airline'                    " Statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'               " Shows git diff
Plug 'tpope/vim-fugitive'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }  " Markdown previews
Plug 'w0rp/ale'                             " Asynchronous Lint Engine for NeoVim and Vim8
Plug 'maralla/completor.vim'                " Asynchronous code completion framework for vim8
Plug 'maralla/completor-neosnippet'
Plug 'SirVer/ultisnips'                     " The ultimate snippet solution for vim.
Plug 'honza/vim-snippets'                   " vim-snipmate default snippets
Plug 'fatih/vim-go'                         " Go development plugin for Vim
Plug 'Raimondi/delimitMate'                 " Auto-completion for quotes, parens, brackets, etc
Plug 'Chiel92/vim-autoformat'               " Code formatting in Vim
Plug 'scrooloose/nerdcommenter'             " Code comments
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
call plug#end()
filetype plugin indent on


" ---------------------------------------------------------------------------
"  Base Option
" ---------------------------------------------------------------------------
set background=light
colorscheme one
set t_Co=256                    " enable 256 colors
set encoding=utf-8 nobomb       " Use UTF-8 without BOM
set nohidden                    " Don't allow buffers to exist in the background
set ttyfast                     " Indicates a fast terminal connection
set history=1000                " Remember the last 1000 :ex commands
set secure                      " Disable unsafe commands in local .vimrc files
set nowrap                      " To display long lines as just one line
set backspace=indent,eol,start  " Backspace key won't move from current line

syntax enable                   " Enable syntax highlighting
syntax on
set number                      " Enable line numbers
set cursorline                  " Highlight current line
set ruler                       " Show the cursor position

set incsearch                   " Highlight dynamically as pattern is typed
set ignorecase                  " Ignore case of searches
set hlsearch                    " Highlight searches

set laststatus=2                " Always show status line
set showcmd                     " Show (partial) command as it’s being typed
set wildmenu                    " Enhance command-line completion
set wildmode=list:longest       " List all matches and complete till longest common string
set noshowmode                  " Don't show the mode in the last line of the screen
set lazyredraw                  " Don't update the screen while executing macros/commands

set expandtab                   " Converting tabs to spaces
set tabstop=4                   " The width of a TAB is set to 4
set shiftwidth=4                " Indents will have a width of 4
set softtabstop=4               " Sets the number of columns for a TAB

" Code flod
set foldmethod=syntax           " Set folding method to syntax
set nofoldenable                " Don't folding when file open
" Open folds under the following conditions
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump

" Set the leader key to <space> instead of \ because it's easier to reach
let mapleader = "\<Space>"

" set listchars=tab:▸\ ,trail:•   " Highlight tabs and trailing spaces
" set list                        " Make whitespace characters visible

" Statusline
let g:airline_theme='one'

" Code Autoformat
noremap <F6> :Autoformat<CR>

" When completing, fill with the longest common string
" Auto select the first option
let g:completor_complete_options = 'longest,menuone,noselect,preview'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" NERDTree
map <F3> :NERDTreeToggle<CR>
let NERDTreeWinSize=24
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tagbar
map <F4> :TagbarToggle<CR>
let tagbar_left=0
let tagbar_width=24
let g:tagbar_autofocus = 1
let g:tagbar_compact=1
let g:tagbar_sort = 0

" vim-gitgutter
set updatetime=300
let g:gitgutter_terminal_reports_focus=0

" Make configuration changes effective immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC

