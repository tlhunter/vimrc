call pathogen#infect()
let mapleader = "\<Space>"
set nocompatible
set nomodeline
set viminfo='1000,f1,:1000,/1000
set history=1000

let pair_program_mode = 0

"------  Charset Init  ------
scriptencoding utf-8
set encoding=utf-8

"------  Visual Options  ------
syntax on
set number
set nowrap
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

" Toggle whitespace visibility with ,s
nmap <Leader>s :set list!<CR>
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
:set list " Enable by default

" <Leader>L = Toggle line numbers
map <Leader>L :set invnumber<CR>

" New splits open to right and bottom
set splitbelow
set splitright


"------  Generic Behavior  ------
set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" The search for the perfect color scheme...
map <silent> <Leader>x :RandomColorScheme<CR>

" <Leader>v = Paste
map <Leader>v "+gP

" <Leader>c = Copy
map <Leader>c "+y

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing <Leader>cd switch to the directory of the open buffer
map ,cd :cd %:p:h<CR>

" Wtf is Ex Mode anyways?
nnoremap Q <nop>

" Annoying window
map q: :q

"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_


"------  Window Navigation  ------
" <Leader>hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

"<Leader>= = Normalize window widths
nnoremap <Leader>= :wincmd =<CR>


"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" <Leader>Ctrl+q Force Closes the current buffer
nnoremap <silent> <Leader><C-q> :Bclose!<CR>


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

" <Leader>A will close the new window created for that ack search
noremap <leader>A <C-w>j<C-w>c<C-w>l

let g:ackprg="ag --vimgrep --column"

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

" CtrlP won't show results from node_modules
let g:ctrlp_custom_ignore = '\v[\/](node_modules|coverage|target|dist)|(\.(swp|ico|git|svn|png|jpg|gif|ttf))$'

"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>


"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$', '.git', '.DS_Store', '\.swp$', '\.swo$']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using <Leader>n
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" Focus on NERDTree using <Leader>m
noremap <silent> <Leader>m :NERDTreeFocus<CR>
" Focus on NERDTree with the currently opened file with <Leader>M
noremap <silent> <Leader>M :NERDTreeFind<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

" Shows invisibles
let g:NERDTreeShowHidden=1


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
map <Leader>T :%s/\s\+$//<CR>

" <Leader>U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>

" <Leader>R = Converts tabs to spaces in document
map <Leader>R :retab<CR>


"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json


"------  CoffeeScript Filetype Settings  ------
au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
au BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!


"------  JSX Filetype Settings ------
autocmd! BufEnter *.jsx let b:syntastic_checkers=['eslint']
autocmd! BufEnter *.js let b:syntastic_checkers=['eslint']


"------  EJS Filetype Settings  ------
au BufNewFile,BufRead *.ejs set filetype=html


"------  SCSS Filetype Settings  ------
autocmd FileType scss set iskeyword+=-


"------  Markdown Settings  ------
let g:vim_markdown_folding_disabled = 1


"------  Airline Settings ------
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '


"------  GUI Options  ------
if has("gui_running")
	" Hides toolbar and scrollbars and File menu
	set guioptions=egt

	" Highlights the current line background
	set cursorline
	colorscheme hybrid

	"autocmd VimEnter * TagbarOpen

	" Open VIM in fullscreen window
	set lines=200 columns=500

	" Toggle fullscreen
	map <silent> <leader>w :set lines=200 columns=500<CR>

	" Build all help tags (slower launch, but I run GUI vim like once per day)
	call pathogen#helptags()

	silent! cd $HOME/Projects

	if has("gui_macvim") " OS X
		"set guifont=Monaco:h14
		set guifont=Monaco:h10
		set noantialias
		"set transparency=15

		" Swipe to move between bufers :D
		map <silent> <SwipeLeft> :bprev<CR>
		map <silent> <SwipeRight> :bnext<CR>

		" Cmd+Shift+N = new buffer
		map <silent> <D-N> :enew<CR>

		" Cmd+P = CtrlP
		" TODO: This doesn't actually work, still opens Print dialog
		macmenu File.Print key=<nop>
		nnoremap <silent> <D-p> :CtrlP<CR>

		" Cmd+t = new tab
		nnoremap <silent> <D-t> :tabnew<CR>

		" Cmd+w = close tab (this should happen by default)
		nnoremap <silent> <D-w> :tabclose<CR>

		" Cmd+1...9 = go to that tab
		map <silent> <D-1> 1gt
		map <silent> <D-2> 2gt
		map <silent> <D-3> 3gt
		map <silent> <D-4> 4gt
		map <silent> <D-5> 5gt
		map <silent> <D-6> 6gt
		map <silent> <D-7> 7gt
		map <silent> <D-8> 8gt
		map <silent> <D-9> 9gt

		" OS X probably has ctags in a weird place
		let g:tagbar_ctags_bin='/usr/local/bin/ctags'

		" Damn you scrollwheel paste
		nnoremap <MiddleMouse> <Nop>
		nnoremap <2-MiddleMouse> <Nop>
		nnoremap <3-MiddleMouse> <Nop>
		nnoremap <4-MiddleMouse> <Nop>

		inoremap <MiddleMouse> <Nop>
		inoremap <2-MiddleMouse> <Nop>
		inoremap <3-MiddleMouse> <Nop>
		inoremap <4-MiddleMouse> <Nop>

		" Pair Program mode, so that my coworkers can read my screen ;)
		nnoremap <leader>p :call PairProgramMode()<cr>
		function! PairProgramMode()
			if g:pair_program_mode
				let g:pair_program_mode = 0
				set guifont=Monaco:h10
				set noantialias
				set lines=200 columns=500
			else
				set guifont=Monaco:h15
				set antialias
				set lines=200 columns=500
				let g:pair_program_mode = 1
			endif
		endfunction

	elseif has("gui_gtk2") " Linux
		set guifont=monospace\ 9

		" Alt+n = new buffer
		map <silent> <A-n> :enew<CR>

		" Alt+t = new tab
		nnoremap <silent> <A-t> :tabnew<CR>

		" Alt+w = close tab
		nnoremap <silent> <A-w> :tabclose<CR>

		" Alt+1...9 = go to that tab
		map <silent> <A-1> 1gt
		map <silent> <A-2> 2gt
		map <silent> <A-3> 3gt
		map <silent> <A-4> 4gt
		map <silent> <A-5> 5gt
		map <silent> <A-6> 6gt
		map <silent> <A-7> 7gt
		map <silent> <A-8> 8gt
		map <silent> <A-9> 9gt

	elseif has("gui_win32") " Windows
		" WHAT ARE YOU DOING WITH YOUR LIFE?!
	endif
else
	set t_Co=256
	colorscheme Mustang
	set mouse=a
endif


"------  Local Overrides  ------
if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif
