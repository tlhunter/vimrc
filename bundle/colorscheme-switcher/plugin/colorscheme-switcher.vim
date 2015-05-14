" Vim plug-in
" Maintainer: Peter Odding <peter@peterodding.com>
" Last Change: June 25, 2014
" URL: http://peterodding.com/code/vim/colorscheme-switcher

" This Vim plug-in defines commands and key mappings to quickly switch between
" color schemes (with the same &background if so desired).

if &cp || exists('g:loaded_colorscheme_switcher')
  finish
endif

" Make sure vim-misc is installed.
try
  " The point of this code is to do something completely innocent while making
  " sure the vim-misc plug-in is installed. We specifically don't use Vim's
  " exists() function because it doesn't load auto-load scripts that haven't
  " already been loaded yet (last tested on Vim 7.3).
  call type(g:xolox#misc#version)
catch
  echomsg "Warning: The vim-colorscheme-switcher plug-in requires the vim-misc plug-in which seems not to be installed! For more information please review the installation instructions in the readme (also available on the homepage and on GitHub). The vim-colorscheme-switcher plug-in will now be disabled."
  let g:loaded_colorscheme_switcher = 1
  finish
endtry

if xolox#misc#option#get('colorscheme_switcher_define_mappings', 1)
  inoremap <silent> <F8> <C-O>:NextColorScheme<CR>
  nnoremap <silent> <F8> :NextColorScheme<CR>
  inoremap <silent> <S-F8> <C-O>:PrevColorScheme<CR>
  nnoremap <silent> <S-F8> :PrevColorScheme<CR>
  inoremap <silent> <C-F8> <C-O>:RandomColorScheme<CR>
  nnoremap <silent> <C-F8> :RandomColorScheme<CR>
endif

command! -bar NextColorScheme call xolox#colorscheme_switcher#next()
command! -bar PrevColorScheme call xolox#colorscheme_switcher#previous()
command! -bar RandomColorScheme call xolox#colorscheme_switcher#random()

" Don't reload the plug-in once it has loaded successfully.
let g:loaded_colorscheme_switcher = 1

" vim: ts=2 sw=2 et
