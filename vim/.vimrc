" Todo
"  - keybidnings
"    - buffers
"    - window
"    - explorer


" colors
set termguicolors
set background=dark
syntax on
color habamax

" display
language en_US " language
set showcmd
set wildmenu
set wildmode=full
set laststatus=2


" mouse
set mouse=a
set cursorline
set number
set relativenumber


" editing
set backspace=indent,eol,start
set noswapfile
set splitbelow splitright

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set smartindent


" Cursor like nvim
if !has('nvim') 
    let &t_SI = "\<esc>[6 q"
	let &t_EI = "\<esc>[2 q"

	if exists('&t_SR')
		let &t_SR = "\<esc>[4 q"
	endif

	set t_Co=256 " cursor color
endif

" Autopairs 
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

" Keybindings
let mapleader=" "

nnoremap <leader>t :vertical :terminal <CR>
nnoremap <C-f> :E <CR>
nnoremap ff :b 

nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>j :wincmd j <CR>
