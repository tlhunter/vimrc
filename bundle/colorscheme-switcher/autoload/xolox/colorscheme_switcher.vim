" Vim plug-in
" Maintainer: Peter Odding <peter@peterodding.com>
" Last Change: April 1, 2015
" URL: http://peterodding.com/code/vim/colorscheme-switcher

let g:xolox#colorscheme_switcher#version = '0.5.1'

" Dictionary with previously seen links between highlighting groups.
if !exists('s:known_links')
  let s:known_links = {}
endif

function! xolox#colorscheme_switcher#next() " {{{1
  " Switch to the next color scheme.
  return xolox#colorscheme_switcher#cycle(1)
endfunction

function! xolox#colorscheme_switcher#previous() " {{{1
  " Switch to the previous color scheme.
  return xolox#colorscheme_switcher#cycle(0)
endfunction

function! xolox#colorscheme_switcher#random() " {{{1
  " Switch to a random color scheme.
  let choices = xolox#colorscheme_switcher#find_names()
  if exists('g:colors_name')
    call filter(choices, 'v:val != g:colors_name')
  endif
  let original_background = &background
  for i in range(len(choices))
    let index = xolox#colorscheme_switcher#random_number(len(choices))
    call xolox#colorscheme_switcher#switch_to(choices[index])
    if !xolox#misc#option#get('colorscheme_switcher_keep_background', 0) || &background == original_background
      call xolox#misc#msg#info('colorscheme-switcher.vim %s: Loaded random color scheme (%s)', g:xolox#colorscheme_switcher#version, choices[index])
      return
    endif
  endfor
  call xolox#misc#msg#debug('colorscheme-switcher.vim %s: Ran out of color schemes!', g:xolox#colorscheme_switcher#version)
endfunction

function! xolox#colorscheme_switcher#cycle(forward) " {{{1
  " Switch to the next or previous color scheme.
  let choices = xolox#colorscheme_switcher#find_names()
  let index = exists('g:colors_name') ? index(choices, g:colors_name) : 0
  let original_background = &background
  for i in range(len(choices))
    if a:forward
      let index = (index + 1) % len(choices)
    else
      let index = (index ? index : len(choices)) - 1
    endif
    call xolox#colorscheme_switcher#switch_to(choices[index])
    if !xolox#misc#option#get('colorscheme_switcher_keep_background', 0) || &background == original_background
      call xolox#misc#msg#info('colorscheme-switcher.vim %s: Loaded color scheme %s (%i/%i)', g:xolox#colorscheme_switcher#version, choices[index], index, len(choices))
      return
    endif
  endfor
  call xolox#misc#msg#debug('colorscheme-switcher.vim %s: Ran out of color schemes!', g:xolox#colorscheme_switcher#version)
endfunction

function! xolox#colorscheme_switcher#find_names() " {{{1
  " Get a sorted list with the available color schemes.
  let matches = {}
  let exclude_list = xolox#misc#option#get('colorscheme_switcher_exclude', [])
  let exclude_builtins = xolox#misc#option#get('colorscheme_switcher_exclude_builtins', 0)
  for fname in split(globpath(&runtimepath, 'colors/*.vim'), '\n')
    let name = fnamemodify(fname, ':t:r')
    " Ignore names in the exclude list.
    if index(exclude_list, name) == -1
      " Ignore color schemes bundled with Vim?
      if !(exclude_builtins && xolox#misc#path#starts_with(fname, $VIMRUNTIME))
        let matches[name] = 1
      endif
    endif
  endfor
  return sort(keys(matches), 1)
endfunction

function! xolox#colorscheme_switcher#find_links() " {{{1
  " Find and remember links between highlighting groups.
  call xolox#misc#msg#debug('colorscheme-switcher.vim %s: Using :highlight command to discover links between highlighting groups ..', g:xolox#colorscheme_switcher#version)
  redir => listing
  try
    silent highlight
  finally
    redir END
  endtry
  for line in split(listing, "\n")
    let tokens = split(line)
    " We're looking for lines like "String xxx links to Constant" in the
    " output of the :highlight command.
    if len(tokens) == 5 && tokens[1] == 'xxx' && tokens[2] == 'links' && tokens[3] == 'to'
      let fromgroup = tokens[0]
      let togroup = tokens[4]
      let s:known_links[fromgroup] = togroup
    endif
  endfor
  call xolox#misc#msg#debug('colorscheme-switcher.vim %s: Found %i links between highlighting groups in output of :highlight command.', g:xolox#colorscheme_switcher#version, len(s:known_links))
endfunction

function! xolox#colorscheme_switcher#restore_links() " {{{1
  " Restore broken links between highlighting groups.
  redir => listing
  try
    silent highlight
  finally
    redir END
  endtry
  let num_restored = 0
  for line in split(listing, "\n")
    let tokens = split(line)
    " We're looking for lines like "String xxx cleared" in the
    " output of the :highlight command.
    if len(tokens) == 3 && tokens[1] == 'xxx' && tokens[2] == 'cleared'
      let fromgroup = tokens[0]
      let togroup = get(s:known_links, fromgroup, '')
      if !empty(togroup)
        execute 'hi link' fromgroup togroup
        let num_restored += 1
      endif
    endif
  endfor
  call xolox#misc#msg#debug('colorscheme-switcher.vim %s: Restored %i links between highlighting groups.', g:xolox#colorscheme_switcher#version, num_restored)
endfunction

function! xolox#colorscheme_switcher#switch_to(name) " {{{1
  " Switch to the given color scheme.
  call xolox#colorscheme_switcher#find_links()
  let command = xolox#misc#option#get('colorscheme_switcher_command', 'colorscheme')
  execute command fnameescape(a:name)
  " Set the global colors_name variable because some color scheme scripts fail
  " to do so or use the wrong name (for example rainbow_autumn uses autumn).
  let g:colors_name = a:name
  " Enable the user to customize the loaded color scheme.
  silent execute 'doautocmd ColorScheme' fnameescape(a:name)
  " Restore syntax group links as the last step to make sure the syntax group
  " links are not clobbered by user defined automatic commands.
  call xolox#colorscheme_switcher#restore_links()
  " It looks like terminal Vim has some peculiarities of its own and the
  " following workaround may improve its behavior. Because I don't yet
  " understand exactly how or why this works, I've decided to add the
  " workaround but only apply it when it seems to be relevant (in
  " terminal Vim). For details refer to issue #6 on GitHub:
  " https://github.com/xolox/vim-colorscheme-switcher/issues/6
  if !has('gui_running')
    let &syntax = &syntax
  endif
endfunction

function! xolox#colorscheme_switcher#random_number(limit) " {{{1
  " Generate a `random' number (for some definition of the word).
  let components = split(reltimestr(reltime()), '\.')
  let microseconds = components[-1] + 0
  return microseconds % a:limit
endfunction

" vim: ts=2 sw=2 et fdm=marker
