" Options
set background=dark
set clipboard=unnamedplus " enables the clipboard between Vim/Neovim and other applications
" set cursorline " highlights the current line in the editor
set completeopt=noinsert,menuone,noselect " modifies the auto-complete menu to behave more like an IDE.
set hidden " hide unused buffers
set inccommand=split " show replacements in a split screen, before applying to the file
set mouse=a " allows the use of the mouse in the editor
set number " shows line numbers
set relativenumber " show line numbers starting from the current one. Useful for using multiline commands
set title " show the file title
set ttimeoutlen=0 " time in milliseconds to run commands
set wildmenu " shows a more advanced menu for auto-completion suggestions

" Tabs size
set expandtab " transforms tabs into spaces
set autoindent " indent a new line the same amount as the line just typed
set tabstop=4 " number of spaces for tabs
set shiftwidth=4 " number of spaces for indentation
set smarttab
set softtabstop=4

" To add automatic syntax support for open files
filetype plugin indent on
syntax on

" enable 256 colors on the terminal
set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

" True color if available
"let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
"if term_program !=? 'Apple_Terminal'
"    set termguicolors
"else
"    if $TERM !=? 'xterm-256color'
"        set termguicolors
"    endif
"endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


call plug#begin()

" Appearance
Plug 'vim-airline/vim-airline' " modifies the status bar to make it more pleasant
Plug 'ryanoasis/vim-devicons' " shows icons in the interface, based on icon fonts
Plug 'dracula/vim' " color theme

" Utilities
Plug 'sheerun/vim-polyglot' " syntax highlighting for several programming languages
Plug 'jiangmiao/auto-pairs' " automatically closes parentheses, square brackets and braces when typing
Plug 'ap/vim-css-color' " shows colors (hex, RGB, HSL) directly in the code
Plug 'preservim/nerdtree' " sidebar to access project files

" Completion / linters / formatters
Plug 'neoclide/coc.nvim', {'branch': 'release'} " provides auto-completion
Plug 'plasticboy/vim-markdown' " better support for Markdown file syntax

" Git
Plug 'airblade/vim-gitgutter' " Shows Git changes in open files

" Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
" Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

call plug#end()

colorscheme dracula " Setting the theme

" Airline
let g:airline_theme='dracula'
" let g:airline_powerline_fonts = 1 " Use powerline mode - has arrows
let g:airline#extensions#tabline#enabled = 1 " enables Airline for the tab bar

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>


" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels - M(Mod) and A(Alt) are same
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" use alt+<left/right/up/down> to move between split/vsplit panels - M(Mod) and A(Alt) are same
tnoremap <M-left> <C-\><C-n><C-w>h
tnoremap <M-down> <C-\><C-n><C-w>j
tnoremap <M-up> <C-\><C-n><C-w>k
tnoremap <M-right> <C-\><C-n><C-w>l
nnoremap <M-left> <C-w>h
nnoremap <M-down> <C-w>j
nnoremap <M-up> <C-w>k
nnoremap <M-right> <C-w>l
