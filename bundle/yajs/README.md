YAJS: Yet Another JavaScript Syntax
===================================

Yet Another JavaScript Syntax file for Vim. Key differences:

* Use 'javascript' as group name's prefix, not 'javaScript' nor 'JavaScript'. Works great with [SyntaxComplete](https://github.com/vim-scripts/SyntaxComplete).
* Recognize Web API and DOM keywords. Base on [Mozilla's WebIDL files](https://github.com/mozilla/gecko-dev/tree/master/dom/webidl)
* Works perfect with [javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
* Remove old, unused syntax definitions.
* Support new syntax, ex: `async`, arrow function: `=>`. 

For ES.Next features such as decorator, binding operator. Please install [es.next.syntax.vim](https://github.com/othree/es.next.syntax.vim).

### Differences from jelera/vim-javascript-syntax

I start a new project instead of sending PR to jelera is because: jelera/vim-javascript-syntax is not so active. 
And I want to do lots of changes, including ES6 and other not confirmed standard support.
Also, one of my goals is to produce 100% correct syntax.
But it hurt performance, so I prefer to create a new one instead of merging back.

### Installation

Recommend use pathogen or Vundle. Vundle:

    Plugin 'othree/yajs.vim'

### Performance Issue

**yajs.vim** is not good on performance. If you are using a slow computer. You might feel lag while moving the cursor. You can try disable [cursorline](http://vimdoc.sourceforge.net/htmldoc/options.html#%27cursorline%27) and [colorcolumn](http://vimdoc.sourceforge.net/htmldoc/options.html#%27colorcolumn%27), or reduce the number of [synmaxcol](http://vimdoc.sourceforge.net/htmldoc/options.html#%27synmaxcol%27). Another possible solution is change to [neovim](https://neovim.io/)

If you still want cursor line highlight, some terminal has their built-in support. Ex: iTerm2, Edit Profile -&gt; Colors -&gt; Cursor Colors.

Credits
-------

- Jose Elera, [Enhanced Javascript syntax](http://www.vim.org/scripts/script.php?script_id=3425)
- Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based on their hard work)
- gumnos (From the #vim IRC Channel in Freenode) (Who helped me figure out the crazy Vim Regexes)

Reference
---------

### JSDoc

* http://usejsdoc.org/
* https://github.com/senchalabs/jsduck/wiki
* https://yui.github.io/yuidoc/syntax/
* https://google.github.io/styleguide/javascriptguide.xml#JSDoc_Tag_Reference
* https://github.com/google/closure-compiler/wiki/Annotating-JavaScript-for-the-Closure-Compiler

Report Issue
------------

Please send issue report to [github](https://github.com/othree/yajs.vim/issues). Provide sample code to help me debug.

Changes
-------

### Version 2.1
- Update syntax to support latest specs

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

