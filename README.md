# Thomas Hunter's VIM Configuration

This Vim configuration is meant to be used to make Vim act more like an IDE. I use it mostly under MacVIM,
so I make no guarantee for different environments. For now, I'm just planning on using github to make
managing my VIM configuraiton more easy, especially with deploying it to different environments. I'm not
sure if I will make this a community projects.

I do use this configuration on Linux and OS X while running plain vim, and it works fine for the most part.

## Overview

This configuration is primarily intended to be run with a MacVIM instance, used for editing
multiple files at the same time. On the left side of the screen will be the file browser, and on the right
will be the list of tags in the current file. On the bottom you will see a list of the currently opened
files (buffers) when switching between them, otherwise it will show status items. You will also see the name of the
current Git branch in parenthesis (if you are in one).

When you want to edit a file, you can browse to it on the left side of the screen, or use _Ctrl p_
to open up a quick/fuzzy search. If you want to edit another file, just browse to it and
open it just like before. When you want to move between open files, use the buffer movement keys mentioned
below. Feel free to open as many buffers as you want, as if this were a normal IDE.

## Features

* File Browser on left side of screen
* Functions, Variables, Classes on right
* Move between buffers in center screen
* View status of the current GIT repo (if applicable)
* Special features when running under MacVIM

### Switching between files (Buffers)

* Use _,q_ to close the current file (a different file will appear in its place)
* Use _Ctrl h Ctrl l_ to move between open files
 * _Ctrl Left Ctrl Right_ also works for switching between files
 * While in MacVim, you can swipe left and right to switch between open files

### Viewports (Windows)

* Use _,h ,j ,k ,l_ to navigate between viewports
* Use _,Q_ to close the current window (you probably won't ever need to do this)
* Use _,n_ to toggle the file browser
* Use _,y_ to toggle the tag browser
* Use _Ctrl+P_ to perform a recursive fuzzy filename search
* Use _,a_ and type a phrase to search to search based on content within your files (quote and escape if needed)
* Use _,A_ to close the open ack search results at the bottom of the screen (same going down, closing, going right, e.g. _,j ,Q ,l_)

### File Browser (NERDTree)

* Use _,n_ to toggle the file browser
* Use standard movement keys to move around
* Use _Ctrl j_ and _Ctrl k_ to move between siblings (aka skip over children in expanded folders)
* Use _C_ to make the highlighted node the current working directory
* Use _:Bookmark BookmarkName_ to bookmark the current selection
* Use _B_ to toggle the bookmark menu
* Use _?_ if you'd like some NERDTree documentation

### Tag Browser (Tag List)

* Use _y_ to toggle the tag browser viewport
* Use _s_ to reorder the items by alpha or occurance

### Copying and Pasting between OS

* Use _,c_ to copy the highlighted text into the OS clipboard
* Use _,v_ to paste the OS clipboard into the document

## Requirements

* Install ctags and configure on your Mac: http://thomashunter.name/blog/installing-vim-taglist-with-macvim-in-os-x/

## Installation

Run these commands in your terminal to fully install this vim setup within OS X. It will probably require some
tweaking to get it working under Linux.

    cd ~
    git clone git://github.com/tlhunter/Vim-PHP-IDE.git .vim

## Screenshots

![Screenshot](http://thomashunter.name/pictures/macvim.png "Screenshot of MacVIM")
