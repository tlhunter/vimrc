# Color scheme switcher for Vim

The colorscheme switcher plug-in for the [Vim text editor] [vim] makes it easy to quickly switch between [colorschemes] [cs]. It defines commands and mappings to switch to the next and previous color schemes.

## Installation

Please refer to the [installation instructions] [howto-install] available on GitHub. Once you've installed the plug-in you can try it out by executing `:NextColorScheme` to switch to the next color scheme.

If you didn't change the plug-in's configuration you can use the `F8` and `Shift-F8` keys to switch to the next/previous color scheme and `Control-F8` to switch to a random color scheme.

## Commands

### The `:NextColorScheme` command

Switch to the next color scheme. After the last color scheme the cycle repeats from the first color scheme.

### The `:PrevColorScheme` command

Switch to the previous color scheme. After the first color scheme the cycle repeats from the last color scheme.

### The `:RandomColorScheme` command

Switch to a random color scheme. Because Vim doesn't actually expose random numbers the microseconds of the current time are used to improvise a source of randomness. It's nothing like real randomness but convincing enough for this plug-in :-).

## Options

The colorscheme switcher plug-in should work out of the box, but you can change the configuration defaults if you want to change how the plug-in works.

### The `g:colorscheme_switcher_define_mappings` option

By default the plug-in maps the following keys in insert and normal mode:

- `F8` switches to the next color scheme
- `Shift-F8` switches to the previous color scheme

To disable these mappings (e.g. because you're already using them for a different purpose) you can set the option `g:colorscheme_switcher_define_mappings` to 0 (false) in your [vimrc script] [vimrc].

### The `g:colorscheme_switcher_keep_background` option

If you set this variable to 1 (true) and cycle to the next/previous color scheme, the plug-in will skip color schemes with a different ['background'] [bg]. By default this is set to 0 (false).

This is useful when you want to see only light or dark color schemes, for example because the sun is shining (you'll want a light background) or because it's late at night (then you'll likely prefer a dark background).

### The `g:colorscheme_switcher_exclude` option

A list with names of color schemes to be ignored by the plug-in. By default the list is empty. Here's an example of how you can set this:

    :let g:colorscheme_switcher_exclude = ['default', 'test']

### The `g:colorscheme_switcher_exclude_builtins` option

If you set this variable to 1 (true) the color schemes bundled with Vim (installed in `$VIMRUNTIME`) are ignored and instead only the color schemes that you specifically installed in your Vim profile are used.

### The `g:colorscheme_switcher_command` option

This option is a string specifying the Vim command used to switch between color schemes. It defaults to the [:colorscheme] [cs] command. You can set this option to integrate the vim-colorscheme-switcher plug-in with other plug-ins like [colorsupport.vim](https://github.com/vim-scripts/colorsupport.vim) and [guicolorscheme.vim](https://github.com/vim-scripts/guicolorscheme.vim).

## See also

The [vim-colorscheme-manager](https://github.com/Taverius/vim-colorscheme-manager) plug-in is an add-on for vim-colorscheme-switcher that adds features like more convenient blacklist management and automatic loading of the last used color scheme when Vim starts up or a session is loaded.

## Known problems

The way Vim color schemes are written isn't really compatible with the idea of quickly switching between lots of color schemes. In my opinion this is an ugly implementation detail of how Vim works internally, in other words I think it's a bug that should be fixed... Here are some references that explain the problem in some detail:

- [Vim colorscheme leaves a wake of destruction when switching away](https://github.com/altercation/solarized/issues/102)
- [gVim: remove syntax highlighting groups](http://stackoverflow.com/questions/12915797/gvim-remove-syntax-highlighting-groups)

Since this behavior hinders cycling through color schemes, the colorscheme switcher plug-in includes a workaround that should hide the problem:

1. At startup a dictionary is created which will be used to remember links between highlighting groups;
2. Before and after loading a color scheme, the colorscheme switcher plug-in runs the [:highlight] [hi] command without any arguments to find links between highlighting groups. Each link that is found is added to the dictionary. Existing entries are updated. This is done by calling `xolox#colorscheme_switcher#find_links()`.
3. After loading a color scheme, the colorscheme switcher plug-in runs the [:highlight] [hi] command without any arguments to find highlighting groups in the state 'cleared'. For each of these groups, if they were previously linked, the link is restored. This is done by calling `xolox#colorscheme_switcher#restore_links()`.

Probably this solution is still not perfect, but it's a lot better than the behavior out of the box: Before I implemented the steps above, when I would cycle through my color schemes, Vim would eventually end up with black text on a white background and nothing else! With the steps above, I can cycle as many times as I want and all of the color schemes I've checked so far look fine.

## Contact

If you have questions, bug reports, suggestions, etc. the author can be contacted at <peter@peterodding.com>. The latest version is available at <http://peterodding.com/code/vim/colorscheme-switcher/> and <http://github.com/xolox/vim-colorscheme-switcher>. If you like this plug-in please vote for it on [Vim Online] [vim_online].

## License

This software is licensed under the [MIT license] [mit].
© 2015 Peter Odding &lt;<peter@peterodding.com>&gt;.


[bg]: http://vimdoc.sourceforge.net/htmldoc/options.html#'background'
[cs]: http://vimdoc.sourceforge.net/htmldoc/syntax.html#:colorscheme
[dcs]: http://peterodding.com/code/vim/downloads/colorscheme-switcher.zip
[dms]: http://peterodding.com/code/vim/downloads/misc.zip
[hi]: http://vimdoc.sourceforge.net/htmldoc/syntax.html#:highlight
[howto-install]: https://github.com/xolox/vim-colorscheme-switcher/blob/master/INSTALL.md
[mit]: http://en.wikipedia.org/wiki/MIT_License
[vim]: http://www.vim.org/
[vim_online]: http://www.vim.org/scripts/script.php?script_id=4586
[vimrc]: http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
