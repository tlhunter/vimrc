# vim-ember-hbs

`vim-ember-hbs` is a plugin to add Ember Handlebars/HTMLBars syntax highlighting and
indentation to Vim. It supports modern Ember Handlebars syntax like `{{else if` and
`{{#each-in`. An example of the highlighting (and indentation):

![Badwolf theme](_badwolf.png)
![Solarized theme](_solarized.png)

## Installation

The easiest way to install `vim-ember-hbs` is using the amazing [Pathogen](https://github.com/tpope/vim-pathogen).
Simply copy/paste the following snippet:

```console
cd ~/.vim/bundle
git clone https://github.com/joukevandermaas/vim-ember-hbs.git
```

_Substitute `.vim` for `vimfiles` on Windows (in PowerShell)._

## Customization

The plugin defines a number of match groups that can be configured in a file at
`$HOME/.vim/after/syntax/handlebars.vim`. Those groups and there default highlight links are:

Please open an issue, if you are missing one.

```vim
hi link hbsBuiltInHelper Function         " all built in helpers like if, else, textarea, input, etc.
hi link hbsKeyword Keyword                " currently the only keyword supported is `as`
hi link hbsOperator Operator              " pencil () and argument =
hi link hbsDelimiter Delimiter            " the || in e.g. `{{#each foo as |bar|}}`
hi link hbsMustacheName Statement         " the name of a mustache `{{my-name`
hi link hbsPencilName Statement           " the name of a pencil `(my-name`
hi link hbsIdentifier Identifier          " everything thats inside a mustache or a pencil and is not a name nor an arg
hi link hbsString String                  " a "string" inside a mustache or a pencil
hi link hbsNumber Number                  " a 0135 number inside a mustache or a pencil
hi link hbsHandles Define                 " The mustaches handles {{
hi link hbsUnescapedHandles Identifier    " A handle with three braces {{{
hi link hbsUnescapedIdentifier Identifier " The identifier inside those {{{
hi link hbsComment Comment                " A comment {{!-- comment --}}
hi link hbsArg Type                       " An argument inside a mustache or a pencil
```

One can e.g. highlight all unescaped mustaches as `Error` with

```vim
hi link hbsUnescapedIdentifier Error
```

To also highlight the `{{{` as `Error`, simply add

```vim
hi link hbsUnescapedHandles Error
```
