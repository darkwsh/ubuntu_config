set nocompatible
set tabstop=8
filetype plugin on
" PHP自动补全
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" allow backspacing over everything in insert mode
set history=50 " keep 50 lines of command line history
syntax enable
set incsearch " do incremental searching
syntax on
set hlsearch
" set autoindent " always set autoindenting on
set number
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" 这是我的配置
Bundle 'OmniCppComplete'
Bundle 'winmanager'
Bundle 'taglist.vim'
Bundle 'SuperTab'
" 这个是一个文件浏览器，比自带的fileexplorer好多了，但是我没集成到winmanager里面，感觉单独用没什么问题
Bundle 'scrooloose/nerdtree'

" 下面是照抄的
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup',{'rtp': 'vim/'}
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'bash-support.vim'
Bundle 'Cpp11-Syntax-Support'
Bundle 'perl-support.vim'

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree
" 按下 F2 调出/隐藏 NERDTree
nnoremap <F2> :exe 'NERDTreeToggle'<CR> 
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1

" 按下 F3 调出/隐藏TagList
nnoremap <F3> :exe 'Tlist'<CR>

set nocp
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>”如果是C++的代码需要只能提示这里的几个选项是必须的。
filetype plugin indent on
"taglist 
set completeopt=longest,menu
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindlw=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
