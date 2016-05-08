YAJS: Yet Another JavaScript Syntax
===================================

Yet Another JavaScript Syntax file for Vim. Key differences:

* Use 'javascript' as group name's prefix, not 'javaScript' nor 'JavaScript'. Works great with [SyntaxComplete](https://github.com/vim-scripts/SyntaxComplete).
* Recognize Web API and DOM keywords. Base on [Mozilla's WebIDL files](https://github.com/mozilla/gecko-dev/tree/master/dom/webidl)
* Works perfect with [javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
* Remove old, unused syntax definitions.
* Support ES6 new syntax, ex: arrow function `=>`. 

For ES7 features such as `async`, `await`. Please install [es.next.syntax.vim](https://github.com/othree/es.next.syntax.vim).

### Differences from jelera/vim-javascript-syntax

I start a new project instead of send PR to jelera is because: jelera/vim-javascript-syntax is not so active. 
And I want to do lots of changes, including ES6 and other not confirmed standard support.
Also, one of my goal is produce 100% correct syntax.
But it hurt performance, so I prefer to create a new one instead of merge back.

### Installation

Use pathogen or vundle is recommended. Vundle:

    Plugin 'othree/yajs.vim'

### 2.0

Major change in 2.0 is the basic object/method data comes from Mozilla's WebIDL. Current master branch is 2.0 beta. If its not stable for you. You can `git checkout 1.6`.

### Performance Issue

**yajs.vim** is not good on performance. If you are using a slower computer. You might feel lag while moving cursor. You can try disable [cursorline](http://vimdoc.sourceforge.net/htmldoc/options.html#%27cursorline%27) and [colorcolumn](http://vimdoc.sourceforge.net/htmldoc/options.html#%27colorcolumn%27), or reduce the number of [synmaxcol](http://vimdoc.sourceforge.net/htmldoc/options.html#%27synmaxcol%27). Another possible solution is change to [neovim](https://neovim.io/)

If you still want cursorline highlight, some terminal have their built in support. Ex: iTerm2, Edit Profile -&gt; Colors -&gt; Cursor Colors.

Credits
-------

- Jose Elera, [Enhanced Javascript syntax](http://www.vim.org/scripts/script.php?script_id=3425)
- Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based on their hard work)
- gumnos (From the #vim IRC Channel in Freenode) (Who helped me figured out the crazy Vim Regexes)

Report Issue
------------

Please send issue report to [github](https://github.com/othree/yajs.vim/issues). Provde sample code to help me debug.

Changes
-------

### Version 2.0.1
- Fix performance issue

### Version 2.0
- Include Mozilla's WebIDL
- Bug Fix

### Version 1.6
- Bug Fix

License
-------

Same as Vim

