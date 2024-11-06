" Base
set number
set relativenumber
set mouse=a
set nowrap
set cursorline
set clipboard=
set background=dark
set termguicolors

" Search
set hlsearch
set ignorecase

" Split
set splitbelow
set splitright

" Indent
set autoindent
set expandtab
set shiftwidth=2

" Undo
set undofile

" Map leader <Space>
let g:mapleader=" "

" Navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Jump center screen
nmap j jzz
nmap k kzz
nmap J 5jzz
nmap K 5kzz

" Next & Previous highlight search
nmap n nzz
nmap N Nzz

" Indent block
vmap > >gv
vmap < <gv

" Split window
nmap <leader>_ <CMD>split<CR>
nmap <leader>\| <CMD>vsplit<CR>

" Copy & Paste
nmap <leader>p "+p
vmap <leader>p "+p
vmap <leader>y "+y

" Disable highlight search
nmap <leader><Enter> <CMD>nohlsearch<CR>

" Custom highlight
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight CursorLine ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight CursorLineNR ctermfg=11 guifg=#fabd2f ctermbg=NONE guibg=NONE

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
call plug#end()

let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
