"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ","

" load plugins from vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"call vundle#begin()
filetype plugin indent on

" let vundle manage vundle
Plugin 'gmarik/vundle'

" utilities
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'firstmustok/Conque-Shell'
Plugin 'vim-scripts/a.vim'

" colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'

" --- Development ---
" JavaScript plugins
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'

Plugin 'scrooloose/syntastic'

"######### Languages ###########
Plugin 'rust-lang/rust.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'

"Plugin 'vim-scripts/autoit.vim--Breland'
"au BufNewFile,BufRead *.au3 setf autoit3

Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'

" buffer
Plugin 'jlanzarotta/bufexplorer'

" aux
Plugin 'vimwiki'
Plugin 'Markdown'
Plugin 'vim-scripts/VisIncr'
Plugin 'junegunn/vim-easy-align'
Plugin 'jiangmiao/auto-pairs'

"call vundle#end()
"filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=0
"NERDTree ignore some files
let NERDTreeIgnore = ['.git', '.svn', '\.pyc$', '\.o$', '\.cxx$', '\.so$', '\.swp$']

"open NERDTree with current dir
map <silent> <leader>q :NERDTree %:p:h<cr>
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
" let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$|\.o$|\.swp$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" airline
Plugin 'bling/vim-airline'
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="powerlineish"
"let g:airline_detect_whitespace=0
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" buffer
map <silent> <leader>ff :only<cr>
"Fast open a buffer by search for a name
map <c-q> :sb

" rainbow parenthess
Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"############# Auto complete ##############
" snippets & autocomplete
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

" supertab & auto complete
Plugin 'Shougo/neocomplete.vim'
set completeopt=longest,menu
let g:neocomplete#enable_at_startup = 1

"############ supertab ########## 
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:SuperTabDefaultCompletionType="context" 
"" from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"


" Fast navigation
" Extended '%' matching
Plugin 'tmhedberg/matchit'
" " Fast jumping from lines
Plugin 'easymotion/vim-easymotion'
nmap <leader>s <Plug>(easymotion-sn)
nmap <leader>t <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
map <silent> <leader><cr> :noh<cr>

"for align separator
"{ Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

"for align with :
vmap <Leader>a :EasyAlign * /:/s0r1l1<cr>
"}

"""""""""""""""""""""""""""""""""""""""""""
" => syntastic plugin
"""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['cpp', 'c']  }
"let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " not compatible with vi
set autoread     " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start


" show tab like >--- and space like ----
set list
set listchars=tab:>-,trail:-

" Tab control
"set noexpandtab " tabs ftw
set expandtab
set smarttab       " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4      " the visible width of tabs
set softtabstop=4  " edit as if the tabs are 4 characters wide
set shiftwidth=4   " number of spaces to use for indent and unindent
set shiftround     " round indent to a multiple of 'shiftwidth'

set clipboard=unnamed

" faster redrawing
set ttyfast

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2     " how many tenths of a second to blink
set hid       "Change buffer - without saving
syntax on     " switch syntax highlighting on

"No sound on errors.
set noerrorbells
set novisualbell

" language settings
let $LANG="zh_CN.utf-8"
"set fileencodings=utf-8,chinese,latin-1,cp936
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

" for chinese
set ambiwidth=double

"menu 
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"console
language messages zh_CN.utf-8
"}
"
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set term=screen-256color
"set background=dark
"colorscheme delek
colorscheme molokai

set number

set autoindent " automatically set indent of new line
set smartindent
set cindent    "C-style indeting
set wrap       "Wrap lines

set laststatus=2 " show the satus line all the time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc

map <leader>d :wincmd q<cr>

"""misc for tmux
"autocmd VimEnter * silent !tmux set status off
"autocmd VimLeave * silent !tmux set status on

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos,mac
nmap <leader>fd :set ff=dos<cr>
nmap <leader>fu :set ff=unix<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
map <c-q> :sb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs(Private)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
"iab xdate <c-r>=strftime("%c")<cr>
iab xname wallace young
iab xemail linux.whu@gmail.com

"Smart way to move btw. windows
" map <C-h> :call WinMove('h')<cr>
" map <C-j> :call WinMove('j')<cr>
" map <C-k> :call WinMove('k')<cr>
" map <C-l> :call WinMove('l')<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

