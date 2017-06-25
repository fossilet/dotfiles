" Vim config file.
"
" Use echo for debugging, e.g. echo &modelines.
" Since 2007


"""""" Pathogen
" XXX: It will not work properly if put at last.
execute pathogen#infect()
call pathogen#helptags()


""""""" Basic
" =========================
"
" Ingore case
set ignorecase
" Highlight for searching
set hlsearch
" Highlight for recognised file type
syntax on
" Character encodings used in Vim
set encoding=utf8
" Automatically detected character encodings
set fileencodings=ucs-bom,utf8,cp936,big5
" This enables automatic indentation as you type.
filetype plugin indent on
" show line numbers
set number
" Search as i type
set incsearch
" tab stop
set softtabstop=4
set shiftwidth=4
set expandtab
" Enable modeline. Disabled by default on Debian-based distros for security.
set modeline
" This should be the default but is zero for me. It may have been overridden by
" other configurations. Reset here.
set modelines=5

" Intermediate
" =========================
"
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" GUI
if (has("gui_running"))
    colorscheme peachpuff
    " https://github.com/tonsky/FiraCode/wiki/MacVim-instructions
    set macligatures
    set guifont=Fira\ Code:h12
endif
" always display the status line
set laststatus=2
" display the line and column number of the cursor position
set ruler
" pasting to other X/macOS apps doesn't require prefixing "*
set clipboard=unnamed
" enable filetype plugins
filetype plugin on
" enable mouse in xterm
set mouse=a
set mousemodel=extend
" avoid hit-enter prompt and some other messages
set shortmess=a
" start editing from the last position
set nostartofline
" m：在多字节字符处可以折行，对中文特别有效（否则只在空白字符处折行）；
" M：在拼接两行时（重新格式化，或者是手工使用"J"命令），如果前一行的结尾或后一
" 行的开头是多字节字符，则不插入空格，非常适合中文
set formatoptions+=mM
" use xterm to enable mouse
if (! has("gui_running"))
    set term=xterm
endif

" 'set term=xterm' will reset colorscheme to 'default'. Reset colorscheme after it.
" The default color theme of Terminal.app on OSX has one kink - highlight is
" not conspicuous, like Vim search and Git commit message highlight. Use an
" alternative Vim colorscheme to work around it.
colorscheme peachpuff

" enable spelling checking
set autochdir
"set foldmethod=indent


"""""" Advanced
" ========================
"
" tab switch windows
nnoremap <TAB> <ESC><C-W><C-W>
" show history of commands
nnoremap : q:i
" jump only one 'line' when wrap set on
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"set imactivatekey=C-space
"inoremap <ESC> <ESC>:set iminsert=0<CR>
" map F2 to insert the current date to the bottom
" :map <F2> Go<ESC>:read !date<CR>kJ``
" make move easier in insert mode
inoremap <C-F> <C-O>a
inoremap <C-B> <C-O>h
noremap <F3> <ESC>:w<CR>

" File types
filetype plugin on
au BufNewFile,BufRead * if &ft == '' | set ft=text | endif
" For asymptote and other file types.
augroup filetypedetect
    autocmd BufNewFile,BufRead *.asy setf asy
    autocmd BufNewFile,BufRead *.wiki set ft=googlecodewiki

    autocmd FileType python,make setlocal textwidth=79
    autocmd FileType text setlocal textwidth=79

    autocmd FileType html set shiftwidth=2
    autocmd FileType xhtml set shiftwidth=2
    " autocmd FileType html set tabwidth=2
augroup END
"set paste
"
set smartindent " FIXME: What's this?
set textwidth=79
" Highlight the column after textwidth
set colorcolumn =+1

" Set highlight theme
highlight ExtraWhitespace ctermbg=grey guibg=red
" Highlight trailing spaces, tabs
match ExtraWhitespace /\s\+$\|\t/

" No swap file in current file.
set dir=~/.tmp

" Disable IME in command mode: http://zh.undozen.com/2013/14
set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

let g:nerdtree_tabs_open_on_console_startup = 1
let vim_markdown_preview_github = 1
