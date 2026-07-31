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
" Neovim removed the 'paste' option entirely (bracketed paste replaces it)
if !has('nvim')
	set pastetoggle=<F2>
endif



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


"------  Fugitive Plugin Options  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Git blame<CR>
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
let g:vim_json_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json


"------  Markdown Settings  ------
let g:pencil#wrapModeDefault = 'soft'
autocmd FileType markdown setlocal spell
autocmd FileType markdown call pencil#init()
let g:markdown_syntax_conceal = 0


"------  AsciiDoc Settings  ------
autocmd FileType asciidoc setlocal spell wrap

"------  Terminal Options  ------
set t_Co=256
if has('termguicolors')
	set termguicolors
endif
colorscheme ir_black
set mouse=a
