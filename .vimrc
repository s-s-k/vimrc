autocmd vimenter * NERDTree
"   This is the personal .vimrc file of Nickson Kaigi. 
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand,
"   as I have done from other notable vim purists
"

set nocompatible                "Use Vim settings, rather than Vi settings
                                "Be IMproved

filetype off                    "required!

" I use Vundle https://github.com/gmarik/Vundle.vim as my
" preferred plugin manager.... never got the hang of
" vim-pathogen (no offence to the pathogen community)


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'plasticboy/vim-markdown'
Plugin 'moll/vim-node'
Plugin 'valloric/youcompleteme'
Plugin 'mxw/vim-jsx'
Plugin 'c.vim'
Plugin 'raimondi/delimitmate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'myusuf3/numbers.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
" Plugins


call vundle#end()               " required
filetype plugin indent on       "required!

set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set nu                          "show line numbers

set expandtab                   "use spaces instead of tabs

set tabstop=2                   "insert 2 spaces whenever the tab key is pressed

set shiftwidth=2                "set indentation to 2 spaces

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files
                                "    anyway?
                                "    https://github.com/nvie/vimrc/blob/master/vimrc#L141



set fdm=indent                  "set foldmethod 

let mapleader=","
set timeout timeoutlen=1500


set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab>
                                " in bash 

" Mappings to traverse buffer list 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"Easy expansion of the active file directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Shortcut to Mute Highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Root permission on a file inside VIM
cmap w!! w !sudo tee >/dev/null %

" Airline stuff, can't live without it
"
"Populate powerline fonts
let g:airline_powerline_fonts = 1
set laststatus=2

" End of airline stuff

set t_Co=256
syntax enable
set background=dark
colorscheme solarized
"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" " 是否显示隐藏文件
let NERDTreeShowHidden=1
" " 设置宽度
let NERDTreeWinSize=31
" " 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" " 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" " 显示书签列表
let NERDTreeShowBookmarks=1



"VIM-JAVASCRIPT
let g:javascript_plugin_jsdoc = 1



"nerd commenter
" Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
 let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
 let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
 let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
 let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a region)
 let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1


"Number
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']


" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ack 全局搜索 快捷键
:map <Leader>f :Ack -i
