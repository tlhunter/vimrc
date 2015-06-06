# /home/tlhunter/.vim/vimrc

![Screenshot](./screenshot.png "Screenshot of this .vimrc in action")

This Vim configuration is meant to make Vim feel more like an IDE than a simple console-based text editor.
I use it mostly under with MacVIM and Linux GVim though I occasionally run it directly in a terminal.

## Installation

### Clone with GIT

Run these commands to get this Vim configuration working on your OS X or Linux machine.
You can run `git pull` inside of `~/.vim` if you'd ever like to grab the latest version.

```bash
cd ~
git clone git://github.com/tlhunter/vimrc.git .vim
ln -s ~/.vim/vimrc ~/.vimrc # Optional, needed for some VIM installations
```

### One Time Download

This method might be more sane. Simply downlaod the latest version, extract to `~/.vim`, and configure to your liking.

```bash
wget https://github.com/tlhunter/vimrc/archive/master.zip
```

## Features

* Edit many files at the same time
* File Browser on left side of screen
* Functions, Variables, Classes on right
* Move between files in center screen
* View status of the current GIT repo, if applicable
* Additional features when running under MacVIM
* Quickly navigate to files using a fuzzy finder

### Leader Key

As of `v0.2.0`, the Leader key is now bound to `Space` (used to be `Comma`)

### Switching between files (Buffers)

* Use `<Leader>q` to close the current file (a different file will appear in its place)
* Use `Ctrl h` `Ctrl l` to move between open files
 * `Ctrl Left` `Ctrl Right` also works for switching between files
 * While in MacVIM, you can swipe left and right to switch between open files
* Use `Cmd Shift N` (or `Alt n` in Linux GVim) to open a new empty buffer

### Viewports (Windows/Splits)

* Use `<Leader>h` `<Leader>j` `<Leader>k` `<Leader>l` to navigate between viewports
* Use `<Leader>Q` to close the current window (you probably won't ever need to do this)
* Use `<Leader>n` to toggle the file browser
* Use `Ctrl P` to perform a recursive fuzzy filename search
* Use `<Leader>a` and type a phrase to search to search based on content within your files (quote and escape if needed)
* Use `<Leader>A` to close the open ack search results at the bottom of the screen

### File Browser (NERDTree)

* Use `<Leader>n` to toggle the file browser
* Use standard movement keys to move around
* Use `Ctrl j` and `Ctrl k` to move between siblings (aka skip over children in expanded folders)
* Use `C` to make the highlighted node the current working directory
* Use `:Bookmark BookmarkName` to bookmark the current selection
* Use `B` to toggle the bookmark menu
* Use `?` if you'd like some NERDTree documentation
* Use `o` to open the selected file in a new buffer
* Use `t` to open the selected file in a new tab

### Tabs

* Use `Cmd t` (or `Alt t` in Linux GVim) to open a new tab
* Use `Cmd w` (or `Alt w` in Linux GVim) to close the current tab
* Use `Cmd 1` to `Cmd 9` (or `Alt 1` to `Alt 9` in Linux GVim) to navigate to the specified tab

### Themes (ColorSchemes)

There is a very large collection of colorschemes in this repository.
Many of them can be seen [here](http://vimcolors.com/).
Set the scheme using `:colorscheme NAME`.

* Use `<Leader>x` to switch to a random theme.

### Text Navigation

Other than the myriad of built-in methods for navigating text...

* Use `<Leader><Leader>b` to highlight and jump to previous words
* Use `<Leader><Leader>w` to highlight and jump to following words

### Copying and Pasting between OS

* Use `<Leader>c` to copy the highlighted text into the OS clipboard
* Use `<Leader>v` to paste the OS clipboard into the document
