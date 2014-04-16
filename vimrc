set nocompatible
filetype off

" Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Plugins

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" System Settings

:set hidden
set history=999
filetype plugin on
filetype indent on
let mapleader = ","
let g:mapleader = ","
set ruler
set shiftwidth=4
set tabstop=4






filetype plugin indent on
