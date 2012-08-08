Vim as a PHP IDE
===
This Vim configuration is meant to be used to make Vim act more like an IDE. I use it mostly under MacVIM,
so some things may be weird in different environments. For now, I'm just planning on using github to make
managing my VIM configuraiton more easy, especially with deploying it to different environments. I'm not
sure if I will make this a community projects.

I do use this configuration on Linux while running plain vim, and it works fine for the most part.


Overview
--
This configuration is meant to be run with a single MacVIM instance on the screen at once, used for editing
multiple files at the same time. On the left side of the screen will be the file browser, and on the right
will be the list of tags in the current file. On the bottom you will see a list of the currently opened
buffers when switching between them, otherwise it will show status items. You will also see the name of the
current Git branch in parenthesis (if you are in one).

When you want to edit a file, you can browse to it on the left side of the screen, or use the _,t_ keys
to open up a quick/fuzzy file browser (Command-T). If you want to edit another file, just browse to it and
open it just like before. When you want to move between files, use the buffer movement keys mentioned
below. Feel free to open as many buffers as you want!

Buffer Movement
---
* Use _,q_ to close the current buffer (a different buffer will replace it)
* Use _Ctrl h Ctrl l_ to move between open buffers (or _Ctrl Left Ctrl Right_)

Windows
---
* Use _,h ,j ,k ,l_ to move around between windows
* Use _,Q_ to close the current window (which doesn't happen often)
* Use _,n_ to show and hide the file browser
* Use _,y_ to show and hide the tag browser
* Use _,t_ to perform a recursive fuzzy filename search

File Browser (NERDTree)
---
* Use standard movement keys to move around
* Use _Ctrl j_ and _Ctrl k_ to move between siblings
* Use _C_ to make a node the current working directory
* Use _:Bookmark BookmarkName_ to bookmark the current selection
* Use _B_ to toggle the bookmark menu

Tag Browser (Tag List)
---
* Use _s_ to reorder the items by alpha or occurance

Zen Coding (Code Completion)
---

Edit an html document, go into insert mode, and type the following:

    div>p#foo$*3>a

Once you've done that, while still in insert mode, type Ctrl + Y then Comma. You'll now see:

    <div>
        <p id="foo1">
            <a href=""></a>
        </p>
        <p id="foo2">
            <a href=""></a>
        </p>
        <p id="foo3">
            <a href=""></a>
        </p>
    </div>

For more info, check out this: https://raw.github.com/mattn/zencoding-vim/master/TUTORIAL

Installation
---
Run these commands in your terminal to fully install this vim setup. There is another step to compile command-t
(instructions coming soon!).

    cd ~
    git clone git@github.com:tlhunter/Vim-PHP-IDE.git .vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update
    cd ~/.vim/bundle/command-t/
    rake make

Features
---
* File Browser on left side of screen
* Functions, Variables, Classes on right
* Move between buffers in center screen


Requirements
---
* Install ctags and configure on your Mac: http://thomashunter.name/blog/installing-vim-taglist-with-macvim-in-os-x/
* Ruby (to compile command-t)

Screenshots
---
![Screenshot](http://thomashunter.name/wp-content/uploads/2011/08/nerdtree-tagbar.png "Screenshot of Configuration")
