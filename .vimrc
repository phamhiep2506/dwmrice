" Base
set number
set relativenumber
set mouse=a
set nowrap
set cursorline
set clipboard=
set background=dark
set termguicolors
set updatetime=100
set nobackup
set nowritebackup
if has("mouse_sgr")
  set ttymouse=sgr
end

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

autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE

autocmd ColorScheme * highlight GitGutterAdd ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight GitGutterChange ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight GitGutterDelete ctermbg=NONE guibg=NONE

" Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sbdchd/neoformat'
Plug 'puremourning/vimspector'
call plug#end()

" Gruvbox
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" Fzf
nmap <leader>ff <CMD>Files<CR>
nmap <leader>fb <CMD>Buffers<CR>
nmap <leader>fg <CMD>Rg<CR>
nmap <leader>fc <CMD>Commands<CR>

" Nerdtree
let NERDTreeMinimalUI=1
nmap <C-n> <CMD>NERDTreeToggle<CR>
