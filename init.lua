-- Path to this file, used below so <Leader>ev/<Leader>es can, silent = true open/reload it.
local config_path = vim.env.MYVIMRC

vim.g.mapleader = ' '
vim.opt.shortmess:append({ I = true })

vim.opt.modeline = false
vim.opt.shada = "'1000,f1,:1000,/1000"
vim.opt.updatetime = 1000
vim.opt.number = true
vim.opt.wrap = false
vim.opt.visualbell = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.mouse = 'a'

vim.cmd.colorscheme('dracula')

local user_config = vim.api.nvim_create_augroup('UserConfig', { clear = true })


--------  Whitespace Visibility  --------
vim.keymap.set('n', '<leader>s', ':set list!<CR>', { remap = true, silent = true })
vim.opt.listchars = { tab = '> ', trail = '·', extends = '»', precedes = '«', nbsp = '×' }
vim.opt.list = true -- Enable by default


--------  Config Edit and Reload  --------
vim.keymap.set('n', '<leader>ev', function() vim.cmd.edit(config_path) end, { silent = true })
vim.keymap.set('n', '<leader>es', function() dofile(config_path) end, { silent = true })


--------  Disable Annoying Features  --------
-- Wtf is Ex Mode anyways?
vim.keymap.set('n', 'Q', '<Nop>')
-- Annoying window
vim.keymap.set({ 'n', 'x', 'o' }, 'q:', ':q', { remap = true })
-- Accidentally pressing Shift K no longer opens man entry
vim.keymap.set({ 'n', 'x', 'o' }, 'K', '<Nop>')


--------  Clipboard, Yanking  --------
-- Allow Shift+Insert to paste
vim.keymap.set({ 'n', 'x', 'o', 'i', 'c' }, '<S-Insert>', '<MiddleMouse>', { remap = true })
-- Ctrl+C copies to system clipboard
vim.keymap.set({ "n", "v" }, "<C-c>", '"+y')
-- Copy filename
vim.keymap.set('n', 'yY', function() vim.fn.setreg('"', vim.fn.expand('%')) end)
-- Copy file path
vim.keymap.set('n', 'yZ', function() vim.fn.setreg('"', vim.fn.expand('%:p')) end)


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
-- <Leader>q Closes the current buffer but without closing the window
vim.keymap.set('n', '<leader>q', ':Bclose<CR>', { silent = true })
-- https://stackoverflow.com/a/8585343/21136642
-- vim.keymap.set({ 'n', 'x', 'o' }, '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { silent = true })
-- <Leader>Q Closes the current window
vim.keymap.set('n', '<leader>Q', '<C-w>c', { silent = true })
-- <Leader>Ctrl+q Force Closes the current buffer
vim.keymap.set('n', '<leader><C-q>', ':Bclose!<CR>', { silent = true })
-- `g f` will open the filepath under the cursor in current split
-- `Ctrl+w f` will open that same filepath in a horizontal split
-- this allows `g F` to open it in a vertical split
vim.keymap.set('n', 'gF', ':vertical wincmd f<CR>')
-- Clear search highlights when pressing <Leader>b
vim.keymap.set('n', '<leader>b', ':nohlsearch<CR>', { silent = true })


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
	pattern = { '*.txt', '*.md', '*.tex' },
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





--------  PLUGINS  --------





--------  Ack  --------
-- http://www.vim.org/scripts/script.php?script_id=2572
-- <Leader>a will open a prompt for a term to search for
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>a', ':Ack ', { remap = true })
vim.g.ackprg = 'ag --vimgrep --column'

--------  Telescope  --------
-- Ctrl+P performs a recursive fuzzy filename search from the CWD
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { silent = true })

local telescope_actions = require("telescope.actions")
require('telescope').setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = telescope_actions.close,
				["<c-j>"] = telescope_actions.move_selection_next,
				["<c-k>"] = telescope_actions.move_selection_previous,
			},
		},
		-- Telescope won't show results from node_modules
		file_ignore_patterns = { 'node_modules', 'coverage', 'target', 'dist', '%.git/' },

		-- Don't open the selected file in the NERDTree sidebar (matches
		-- CtrlP's behavior). If NERDTree is the only window, split one.
		get_selection_window = function(picker, entry)
			local win = picker.original_win_id
			if not (win and vim.api.nvim_win_is_valid(win) and vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'nerdtree') then
				return 0
			end
			for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.bo[vim.api.nvim_win_get_buf(w)].filetype ~= 'nerdtree' then
					return w
				end
			end
			vim.cmd('vsplit')
			return vim.api.nvim_get_current_win()
		end,
	},
	pickers = {
		-- disable_devicons is belt-and-suspenders: we don't install
		-- nvim-web-devicons, so there are no icons to disable yet, but
		-- this keeps it that way if devicons ever gets pulled in as a
		-- transitive dependency of another plugin.
		find_files = { disable_devicons = true },
	},
})


--------  NERDTree  --------
-- display paths relative to home in status line
vim.g.NERDTreeStatusline = "%{exists('b:NERDTree') ? fnamemodify(b:NERDTree.root.path.str(), ':~') : ''}"
vim.g.NERDTreeIgnore = { '^\\.git$', '\\.swp$', '\\.swo$' }
-- setting root dir in NERDTree also sets Neovim's cd (useful for switching projects)
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeShowHidden = 1
-- Toggle visibility using <Leader>n
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>n', ':NERDTreeToggle<CR>', { remap = true, silent = true })
-- Focus on NERDTree using <Leader>m
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>m', ':NERDTreeFocus<CR>', { remap = true, silent = true })
-- Focus on NERDTree with the currently opened file with <Leader>M
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>M', ':NERDTreeFind<CR>', { remap = true, silent = true })
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
-- E.g. `nvim foo.txt` doesn't show NERDTree but `nvim` does.
vim.api.nvim_create_autocmd('VimEnter', {
	group = user_config,
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd('NERDTree')
		end
	end,
})


--------  Fugitive  --------
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')


--------  Pencil/Markdown  --------
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


--------  Statusline  --------
-- https://github.com/nvim-lualine/lualine.nvim
require('lualine').setup({
	options = {
		theme = 'dracula',
		-- Covers the fileformat/filetype icons; the branch icon below
		-- isn't gated by this flag, so it needs its own override.
		icons_enabled = false,
		disabled_filetypes = {
			'nerdtree',
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { { 'branch', icon = '' }, 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
})


--------  Bufferline  --------
-- https://github.com/akinsho/bufferline.nvim
require('bufferline').setup({
	options = {
		-- show_buffer_icons stays off: the filetype icons are nerd-font
		-- glyphs and render as boxes without a patched font installed.
		show_buffer_icons = false,
		buffer_close_icon = '×',
		close_icon = '×',
	},
})


--------  Noice  --------
-- https://github.com/folke/noice.nvim
-- Icons are nerd-font glyphs, which render as broken boxes without a
-- patched font installed (see the bufferline note above for the same issue).
require('noice').setup({
	cmdline = {
		format = {
			cmdline = { icon = '' },
			search_down = { icon = '' },
			search_up = { icon = '' },
			filter = { icon = '' },
			lua = { icon = '' },
			help = { icon = '' },
			calculator = { icon = '' },
			input = { icon = '' },
		},
	},
	popupmenu = {
		kind_icons = false,
	},
})


--------  Colorizer  --------
require('colorizer').setup()


--------  Language Server  --------
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { desc = 'Trigger LSP completion' })

vim.lsp.config['ts_ls'] = {
	cmd = { '/usr/local/bin/typescript-language-server', '--stdio' },
	filetypes = { 'typescript' },
	root_markers = { 'tsconfig.json' },
--	setup = {
--		init_options = {
--			tsserver = {
--				path = "/usr/local/lib/node_modules/typescript/lib/tsserver.js"
--			}
--		}
--	}
}
vim.lsp.enable('ts_ls')
