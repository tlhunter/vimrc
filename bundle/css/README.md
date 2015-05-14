Vim CSS Syntax File
------------

Installation
-------------

## Manual

copy `css.vim` file into your `~/.vim/syntax/` directory;

## Using Vundle:

add the following line to your `~/.vimrc` file;

```
Plugin 'JulesWang/css.vim'
```

and run `:PluginInstall` in vim.

Change Log
------------
* 2013-11-27: Fix @page syntax based on the w3c standard.
* 2013-08-28: Add support for pseudo-class functions.
* 2013-07-30: Highlight Props and Attrs with different colors.
* 2013-07-22: Fix @media(issue #6),@import,@charset,@namespace,@page,@keyframe syntaxs.
* 2013-01-13: Add support for installation using vundle.
* 2011-10-15: Add 130 more color names.
* 2011-09-13: Test and add some missing items.
* 2011-09-11: 80% css3 support.

Thanks
------------
* ChrisYip, amadeus https://github.com/amadeus/Better-CSS-Syntax-for-Vim
* hail2u   https://github.com/hail2u/vim-css3-syntax
* leptrue  https://github.com/lepture/vim-css
