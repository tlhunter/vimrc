call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins
let mapleader=","           "Changes Leader key into a comma instead of a backslash
set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='1000,f1,:1000,/1000
set history=500

au FileType php set omnifunc=phpcomplete#CompletePHP

"------  Visual Options  ------
set guioptions-=T           "remove toolbar
syntax on                   "Enables syntax highlighting
set nu                      "Enable Line Numbers
set nowrap                  "Disable word wrap
set vb                      "Visual bell instead of beeps
set ruler                   "Displays cursor position on bottom right of screen
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P

"------  Behavior  ------
set tabstop=4               "tab = 4 spaces
set shiftwidth=4            "Indent to four spaces
set hidden                  "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on          "Syntax Highlight
filetype plugin on          "Needed for snipMate
set autoindent              "Autoindent
set expandtab               "Use spaces instead of tabs
"Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

"------  Searching  ------
set incsearch               "Search while typing
set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results
"Following line clears the search highlights when pressing Lb
nnoremap <leader>b :nohlsearch<CR>
" http://www.vim.org/scripts/script.php?script_id=2572
noremap <leader>a :Ack 

"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>

"------  Tagbar Options  ------
" http://adamyoung.net/Exuberant-Ctags-OS-X
" http://www.vim.org/scripts/script.php?script_id=273
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=26
noremap <silent> <Leader>y :TagbarToggle<CR>

"------  Buffers  ------
" Ctrl Left & Right move between buffers
" (need to find out how to disable this within nerdtree buffer)
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>
" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

"------  Fugitive  ------ 
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

"------  Moving Between Windows  ------
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>ww <C-w><C-w>

" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

"http://www.vim.org/scripts/script.php?script_id=3150
map <Leader>os :OpenSession 
map <Leader>so :OpenSession 
map <Leader>ss :SaveSession 
:let g:session_autosave = 'no'

" When pressing <leader>cd switch to the directory of the open buffer
"map <Leader>cd :cd %:p:h<CR>
" ,ct = Builds ctags
map <Leader>ct :! /usr/local/bin/ctags -R *<CR>

" ,v = Paste
map <Leader>v "+gP
" ,c = Copy
map <Leader>c "+y
" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>
" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>
" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>
" .p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>
" .P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>

" Deletes trailing space in file upon write
" autocmd BufWritePre * :%s/\s\+$//e

map <Leader>? :Helptags<CR>

if has("gui_running")
    set cursorline                  "Highlight background of current line
    autocmd VimEnter * NERDTree     "run nerdtree
    autocmd VimEnter * TagbarOpen
    "autocmd VimEnter * wincmd p    "cursor to right panel instead of NERDTree
    colorscheme ir_black            "Cool color scheme

    " Show tabs and newline characters with ,s
    nmap <Leader>s :set list!<CR>
    set listchars=tab:▸\ ,eol:¬
    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59
else
    colorscheme darkblue        "Default VIM colorscheme which works in terminals
endif

if has("gui_macvim") "Use Experimental Renderer option must be enabled for transparencY
    set transparency=15
    set guifont=Monaco:h10
    set noantialias " I like my Monaco this way ;D
    " Swipe to move between bufers :D
    map <SwipeLeft> :bprev<CR>
    map <SwipeRight> :bnext<CR>
endif

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
