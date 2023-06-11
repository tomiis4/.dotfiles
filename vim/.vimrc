" Todo
"  - keybidnings
"    - buffers
"    - window
"    - explorer


" colors
set termguicolors
set background=dark
syntax on

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

" Gruvbox colorscheme
" Background and foreground
hi Normal guifg=#ebdbb2 guibg=#282828
hi LineNr guifg=#a89984 guibg=NONE

" Syntax highlighting
hi Comment guifg=#928374 guibg=NONE
hi Constant guifg=#d3869b guibg=NONE
hi String guifg=#b8bb26 guibg=NONE
hi Identifier guifg=#8ec07c guibg=NONE
hi Function guifg=#bdae93 guibg=NONE
hi Statement guifg=#fb4934 guibg=NONE
hi PreProc guifg=#83a598 guibg=NONE
hi Type guifg=#8ec07c guibg=NONE

" Search highlighting
hi Search guifg=#000000 guibg=#d3869b
hi IncSearch guifg=#000000 guibg=#fabd2f

" Cursor
hi Cursor guifg=NONE guibg=#ebdbb2

" Cursor line
hi CursorLine guibg=#3c3836

" Status line
hi StatusLine guifg=#282828 guibg=#fabd2f
hi StatusLineNC guifg=#a89984 guibg=#3c3836

" Tab line
hi TabLineFill guifg=#282828 guibg=#3c3836
hi TabLine guifg=#928374 guibg=#3c3836
hi TabLineSel guifg=#282828 guibg=#ebdbb2

" Popup menu
hi Pmenu guifg=#ebdbb2 guibg=#3c3836
hi PmenuSel guifg=#282828 guibg=#fabd2f

" Visual selection
hi Visual guifg=#000000 guibg=#fabd2f

" Matched parentheses
hi MatchParen guifg=#282828 guibg=#83a598

" Folded text
hi Folded guifg=#7c6f64 guibg=#3c3836

" Diff mode
hi DiffAdd guifg=#282828 guibg=#b8bb26
hi DiffChange guifg=#282828 guibg=#fe8019
hi DiffDelete guifg=#282828 guibg=#fb4934

" Markdown headings
hi markdownH1 guifg=#d3869b guibg=NONE
hi markdownH2 guifg=#83a598 guibg=NONE
