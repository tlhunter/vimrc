let mapleader = "\<Space>"
set nocompatible
set nomodeline
set viminfo='1000,f1,:1000,/1000
set history=1000
set updatetime=1000
scriptencoding utf-8
set encoding=utf-8
syntax on
set number
set nowrap
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
set splitbelow
set splitright

" Toggle whitespace visibility with ,s
nmap <Leader>s :set list!<CR>
set listchars=tab:>\ ,trail:·,extends:»,precedes:«,nbsp:×
:set list " Enable by default

"------  Generic Behavior  ------
set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>


"------  Disable Annoying Features  ------
" Wtf is Ex Mode anyways?
nnoremap Q <nop>

" Annoying window
map q: :q

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>


"------  Clipboard  ------
" Allow Shift+Insert to paste
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
" set clipboard=unnamedplus

" Copy filename
:nmap yY :let @" = expand("%")<CR>

" Copy file path
:nmap yZ :let @" = expand("%:p")<CR>

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>



"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_


"------  Split Navigation  ------
" <Leader>hljk = Move between splits
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k


"------  Buffer Navigation  ------
" Ctrl+h & Ctrl+l cycle between buffers in the current split
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-l> :bnext<CR>

" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" <Leader>Ctrl+q Force Closes the current buffer
nnoremap <silent> <Leader><C-q> :Bclose!<CR>

" `g f` will open the filepath under the cursor in current split
" `Ctrl+w f` will open that same filepath in a horizontal split
" this allows `g F` to open it in a vertical split
:nnoremap gF :vertical wincmd f<CR>

"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch

" Clear search highlights when pressing <Leader>b
nnoremap <silent> <leader>b :nohlsearch<CR>

" http://www.vim.org/scripts/script.php?script_id=2572
" <Leader>a will open a prmompt for a term to search for
noremap <leader>a :Ack 

let g:ackprg="ag --vimgrep --column"

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

" CtrlP won't show results from node_modules
let g:ctrlp_custom_ignore = '\v[\/](node_modules|coverage|target|dist)|(\.(swp|ico|git|svn|png|jpg|gif|ttf))$'


"------  NERDTree Options  ------
let NERDTreeIgnore=['.git', '\.swp$', '\.swo$']

"setting root dir in NT also sets VIM's cd (useful for switching projects)
let NERDTreeChDirMode=2

" Toggle visibility using <Leader>n
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" Focus on NERDTree using <Leader>m
noremap <silent> <Leader>m :NERDTreeFocus<CR>
" Focus on NERDTree with the currently opened file with <Leader>M
noremap <silent> <Leader>M :NERDTreeFind<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

" Shows invisibles
let g:NERDTreeShowHidden=1


"------ NERDCommenter Options ------
" Visual select text then use 'Leader c Leader' to comment the selection
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'


"------  Fugitive Plugin Options  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove 
nnoremap <Leader>gp :Ggrep 
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gd :Gdiff<CR>


"------  Text Editing Utilities  ------
" <Leader>T = Delete all Trailing space in file
nmap <Leader>T :%s/\s\+$//<CR>

" <Leader>U = Deletes Unwanted empty lines
nmap <Leader>U :g/^$/d<CR>

" <Leader>R = Converts tabs to spaces in document
nmap <Leader>R :retab<CR>

" gq will wrap lines, so gQ will unwrap lines
nmap gQ VipJ


"------  Text File Settings  ------
:autocmd! BufNewFile,BufRead * setlocal nowrap
:autocmd! BufNewFile,BufRead *.txt,*.md,*.tex,*.asciidoc setlocal wrap


"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json


"------  Markdown Settings  ------
let g:vim_markdown_folding_disabled = 1
let g:pencil#wrapModeDefault = 'soft'
autocmd FileType markdown setlocal spell
autocmd FileType markdown call pencil#init()
let g:vim_markdown_conceal = 0


"------  AsciiDoc Settings  ------
autocmd FileType asciidoc setlocal spell wrap

"------  GUI Options  ------
if has("gui_running")
	" Hides toolbar and scrollbars and File menu
	set guioptions=gt

	colorscheme hybrid
	let g:gruvbox_bold=0

	" Ctrl+A select all
	map <C-a> ggVG

	" Ctrl+C OS clipboard copy
	vmap <C-c> "+y

	" Ctrl+B OS Clipboard paste
	map <C-b> "*p

	" Highlights the current line background
	set cursorline

	" Open VIM in fullscreen window
	" ...Unless you have dualscreens, then it's bigger than a screen...
	set lines=200 columns=500
	" set lines=60 columns=200

	function Screencast()
		:set guifont=monospace\ 24
		:colorscheme github
		:NERDTreeClose
		:set cursorline&
		:set shortmess=F
		:set noshowmode
        :set noruler
		:set laststatus=0
		:set noshowcmd
	endfunction
	nmap <F3> :call Screencast()<CR>

	" Set default starting directory to ~/Projects or ~/projects
	silent! cd $HOME/Projects
	silent! cd $HOME/projects

	if has("gui_macvim") " OS X
		set guifont=Monaco:h10
		set noantialias
		"set transparency=15

		" Swipe to move between buffers
		map <silent> <SwipeLeft> :bprev<CR>
		map <silent> <SwipeRight> :bnext<CR>

		" Damn you scrollwheel paste
		nnoremap <MiddleMouse> <Nop>
		nnoremap <2-MiddleMouse> <Nop>
		nnoremap <3-MiddleMouse> <Nop>
		nnoremap <4-MiddleMouse> <Nop>

		inoremap <MiddleMouse> <Nop>
		inoremap <2-MiddleMouse> <Nop>
		inoremap <3-MiddleMouse> <Nop>
		inoremap <4-MiddleMouse> <Nop>
	elseif has("gui_gtk") " Linux
		" set guifont=monospace\ 9
		" set guifont=ProggyCleanTT\ 12
		" set guifont=courier\ 10\ pitch\ 14

		let g:NERDTreeDirArrowExpandable = '+'
		let g:NERDTreeDirArrowCollapsible = '~'

		" Disable mouse scrolling while in INSERT mode
		" TODO: This doesn't work when shift is pressed
		inoremap <ScrollWheelUp> <Nop>
		inoremap <ScrollWheelDown> <Nop>
		inoremap <ScrollWheelLeft> <Nop>
		inoremap <ScrollWheelRight> <Nop>
	endif
else
	" Inside of a terminal
	set t_Co=256
	colorscheme ir_black
	set mouse=a
endif
