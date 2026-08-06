-- Real path to this file, used below so <Leader>ev/<Leader>es always point
-- at this config even though $MYVIMRC resolves to the ~/.config/nvim shim.
local config_path = vim.fn.expand('<sfile>:p')

vim.g.mapleader = ' '

vim.opt.modeline = false
vim.opt.shada = "'1000,f1,:1000,/1000"
vim.opt.updatetime = 1000
vim.opt.number = true
vim.opt.wrap = false
vim.opt.visualbell = true
vim.opt.statusline = '%<%f %h%m%r%=%{fugitive#statusline()}  %-14.(%l,%c%V%) %P'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true

-- Toggle whitespace visibility with ,s
vim.keymap.set('n', '<leader>s', ':set list!<CR>', { remap = true })
vim.opt.listchars = { tab = '> ', trail = '·', extends = '»', precedes = '«', nbsp = '×' }
vim.opt.list = true -- Enable by default

--------  Generic Behavior  --------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Edit and reload this config
vim.keymap.set('n', '<leader>ev', function() vim.cmd.edit(config_path) end, { silent = true })
vim.keymap.set('n', '<leader>es', function() dofile(config_path) end, { silent = true })


--------  Disable Annoying Features  --------
-- Wtf is Ex Mode anyways?
vim.keymap.set('n', 'Q', '<Nop>')

-- Annoying window
vim.keymap.set({ 'n', 'x', 'o' }, 'q:', ':q', { remap = true })

-- Accidentally pressing Shift K will no longer open stupid man entry
vim.keymap.set({ 'n', 'x', 'o' }, 'K', '<Nop>')


--------  Clipboard  --------
-- Allow Shift+Insert to paste
vim.keymap.set({ 'n', 'x', 'o' }, '<S-Insert>', '<MiddleMouse>', { remap = true })
vim.keymap.set({ 'i', 'c' }, '<S-Insert>', '<MiddleMouse>', { remap = true })
-- vim.opt.clipboard = 'unnamedplus'

-- Copy filename
vim.keymap.set('n', 'yY', function() vim.fn.setreg('"', vim.fn.expand('%')) end)

-- Copy file path
vim.keymap.set('n', 'yZ', function() vim.fn.setreg('"', vim.fn.expand('%:p')) end)

-- F2 paste toggle isn't needed: Neovim removed the 'paste' option entirely
-- (bracketed paste replaces it), so there's nothing to toggle.


--------  Text Navigation  --------
-- Keep the cursor in place while joining lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- H = Home, L = End
vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^')
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '$')
vim.keymap.set('x', 'L', 'g_')


--------  Split Navigation  --------
-- <Leader>hljk = Move between splits
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')


--------  Buffer Navigation  --------
-- Ctrl+h & Ctrl+l cycle between buffers in the current split
vim.keymap.set({ 'n', 'x', 'o' }, '<C-h>', ':bprev<CR>', { silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, '<C-l>', ':bnext<CR>', { silent = true })

-- <Leader>q Closes the current buffer
vim.keymap.set('n', '<leader>q', ':Bclose<CR>', { silent = true })

-- <Leader>Q Closes the current window
vim.keymap.set('n', '<leader>Q', '<C-w>c', { silent = true })

-- <Leader>Ctrl+q Force Closes the current buffer
vim.keymap.set('n', '<leader><C-q>', ':Bclose!<CR>', { silent = true })

-- `g f` will open the filepath under the cursor in current split
-- `Ctrl+w f` will open that same filepath in a horizontal split
-- this allows `g F` to open it in a vertical split
vim.keymap.set('n', 'gF', ':vertical wincmd f<CR>')

--------  Searching  --------
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clear search highlights when pressing <Leader>b
vim.keymap.set('n', '<leader>b', ':nohlsearch<CR>', { silent = true })

-- http://www.vim.org/scripts/script.php?script_id=2572
-- <Leader>a will open a prompt for a term to search for
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>a', ':Ack ', { remap = true })

vim.g.ackprg = 'ag --vimgrep --column'

-- CtrlP will load from the CWD, makes it easier with all these nested repos
vim.g.ctrlp_working_path_mode = ''

-- CtrlP won't show results from node_modules
vim.g.ctrlp_custom_ignore = '\\v[\\/](node_modules|coverage|target|dist)|(\\.(swp|ico|git|svn|png|jpg|gif|ttf))$'


--------  NERDTree Options  --------
vim.g.NERDTreeIgnore = { '^\\.git$', '\\.swp$', '\\.swo$' }

-- setting root dir in NT also sets Neovim's cd (useful for switching projects)
vim.g.NERDTreeChDirMode = 2

-- Toggle visibility using <Leader>n
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>n', ':NERDTreeToggle<CR>', { remap = true, silent = true })
-- Focus on NERDTree using <Leader>m
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>m', ':NERDTreeFocus<CR>', { remap = true, silent = true })
-- Focus on NERDTree with the currently opened file with <Leader>M
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>M', ':NERDTreeFind<CR>', { remap = true, silent = true })

local user_config = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- These prevent accidentally loading files while focused on NERDTree
vim.api.nvim_create_autocmd('FileType', {
	group = user_config,
	pattern = 'nerdtree',
	callback = function(args)
		vim.keymap.set('n', '<C-h>', '<Nop>', { buffer = args.buf })
		vim.keymap.set('n', '<C-l>', '<Nop>', { buffer = args.buf })
	end,
})

-- Open NERDTree if we're executing nvim without specifying a file to open
vim.api.nvim_create_autocmd('VimEnter', {
	group = user_config,
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd('NERDTree')
		end
	end,
})

-- Hides "Press ? for help"
vim.g.NERDTreeMinimalUI = 1

-- Shows invisibles
vim.g.NERDTreeShowHidden = 1


--------  Fugitive Plugin Options  --------
-- https://github.com/tpope/vim-fugitive
vim.keymap.set('n', '<leader>gs', ':Git<CR>')
vim.keymap.set('n', '<leader>gr', ':GRemove<CR>')
vim.keymap.set('n', '<leader>gl', ':Gclog<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')
vim.keymap.set('n', '<leader>gm', ':GMove ')
vim.keymap.set('n', '<leader>gp', ':Ggrep ')
vim.keymap.set('n', '<leader>gR', ':Gread<CR>')
vim.keymap.set('n', '<leader>gg', ':Git ')
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>')


--------  Text Editing Utilities  --------
-- <Leader>T = Delete all Trailing space in file
vim.keymap.set('n', '<leader>T', [[:%s/\s\+$//<CR>]], { remap = true })

-- <Leader>U = Deletes Unwanted empty lines
vim.keymap.set('n', '<leader>U', ':g/^$/d<CR>', { remap = true })

-- <Leader>R = Converts tabs to spaces in document
vim.keymap.set('n', '<leader>R', ':retab<CR>', { remap = true })

-- gq will wrap lines, so gQ will unwrap lines
vim.keymap.set('n', 'gQ', 'VipJ', { remap = true })


--------  Text File Settings  --------
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	group = user_config,
	pattern = '*',
	command = 'setlocal nowrap',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	group = user_config,
	pattern = { '*.txt', '*.md', '*.tex', '*.asciidoc' },
	command = 'setlocal wrap',
})


--------  JSON Filetype Settings  --------
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	group = user_config,
	pattern = '*.json',
	command = 'set filetype=json',
})
vim.g.vim_json_conceal = 0
vim.keymap.set('n', '=j', ':%!python -m json.tool<CR>:setfiletype json<CR>', { silent = true, remap = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	group = user_config,
	pattern = '*.webapp',
	command = 'set filetype=json',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	group = user_config,
	pattern = '*.jshintrc',
	command = 'set filetype=json',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	group = user_config,
	pattern = '*.eslintrc',
	command = 'set filetype=json',
})


--------  Markdown Settings  --------
vim.g['pencil#wrapModeDefault'] = 'soft'
vim.api.nvim_create_autocmd('FileType', {
	group = user_config,
	pattern = 'markdown',
	command = 'setlocal spell',
})
vim.api.nvim_create_autocmd('FileType', {
	group = user_config,
	pattern = 'markdown',
	command = 'call pencil#init()',
})
vim.g.markdown_syntax_conceal = 0


--------  AsciiDoc Settings  --------
vim.api.nvim_create_autocmd('FileType', {
	group = user_config,
	pattern = 'asciidoc',
	command = 'setlocal spell wrap',
})

--------  Terminal Options  --------
vim.opt.termguicolors = true
vim.cmd.colorscheme('dracula')
vim.opt.mouse = 'a'
