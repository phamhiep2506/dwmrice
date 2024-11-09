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
autocmd ColorScheme * highlight CursorLine ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight CursorLineNR ctermfg=11 guifg=#fabd2f ctermbg=NONE guibg=NONE

" Plugins
call plug#begin()
Plug 'sainnhe/gruvbox-material'
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
let g:gruvbox_material_foreground="original"
let g:gruvbox_material_background="hard"
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_visual="reverse"
let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_better_performance=1
colorscheme gruvbox-material

" Fzf
nmap <leader>ff <CMD>Files<CR>
nmap <leader>fb <CMD>Buffers<CR>
nmap <leader>fg <CMD>Rg<CR>
nmap <leader>fc <CMD>Commands<CR>

" Nerdtree
let NERDTreeMinimalUI=1
nmap <C-n> <CMD>NERDTreeToggle<CR>

" Gitgutter
let g:gitgutter_map_keys=0

" Coc.nvim
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
nmap gd <Plug>(coc-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap <leader>h <CMD>call CocActionAsync("doHover")<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction-cursor)

" Vimspector
nmap <leader>dc <Plug>VimspectorContinue
nmap <leader>ds <Plug>VimspectorStop
nmap <leader>dr <Plug>VimpectorRestart
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>di <Plug>VimspectorStepInto
nmap <leader>do <Plug>VimspectorStepOut
nmap <leader>dO <Plug>VimspectorStepOver
nmap <leader>de <Plug>VimspectorBalloonEval
xmap <leader>de <Plug>VimspectorBalloonEval
