" Vim syntax file
" Language:     JavaScript (ECMAScript 2015)
" Maintainer:   Kao Wei-Ko(othree) <othree@gmail.com>
" Last Change:  2016-10-20
" Version:      1.5
" Changes:      Go to https://github.com/othree/yajs.vim for recent changes.
" Repository:   https://github.com/othree/yajs.vim
" Upstream:     https://github.com/jelera/vim-javascript-syntax
" Credits:      Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck 
"               (This file is based on their hard work), gumnos (From the #vim 
"               IRC Channel in Freenode)


if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  let did_javascript_hilink = 1
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
else
  finish
endif

" Dollar sign is permitted anywhere in an identifier
" html might require - as keyword ch (ex: html5.vim)
" Patch 7.4.1142
if has("patch-7.4-1142")
  if has("win32")
    if exists("main_syntax") && main_syntax == 'html'
      syn iskeyword @,48-57,_,128-167,224-235,$,-
    else
      syn iskeyword @,48-57,_,128-167,224-235,$
  endif
  else
    if exists("main_syntax") && main_syntax == 'html'
      syn iskeyword @,48-57,_,192-255,$,-
    else
      syn iskeyword @,48-57,_,192-255,$
    endif
  endif
endif


syntax sync fromstart

" Syntax coloring for Node.js shebang line
syntax match   shellbang "^#!.*node\>"
syntax match   shellbang "^#!.*iojs\>"


" Operator
syntax match   javascriptOpSymbols             /[+\-*/%\^~=<>&|?]\+/ contains=javascriptOpSymbol,javascriptInvalidOp nextgroup=@javascriptComments,@javascriptExpression skipwhite skipempty

syntax match   javascriptInvalidOp             contained /[+\-*/%\^~=!<>&|?:]\+/

syntax match   javascriptOpSymbol              contained /\(=\|?\)/ nextgroup=@javascriptExpression skipwhite skipempty " 2: =, ?
syntax match   javascriptOpSymbol              contained /===\?/ " 2: ==, ===
syntax match   javascriptOpSymbol              contained /\(>>>=\|>>>\|>>=\|>>\|>=\|>\)/ " 6: >>>=, >>>, >>=, >>, >=, >
syntax match   javascriptOpSymbol              contained /\(<<=\|<<\|<=\|<\)/ " 4: <<=, <<, <=, <
syntax match   javascriptOpSymbol              contained /\(||\||=\||\)/ " 3: ||, |=, |
syntax match   javascriptOpSymbol              contained /\(&&\|&=\|&\)/ " 3: &&, &=, &
syntax match   javascriptOpSymbol              contained /\(*=\|*\)/ " 2: *=, *
syntax match   javascriptOpSymbol              contained /\(%=\|%\)/ " 2: %=, %
syntax match   javascriptOpSymbol              contained /\(\/=\|\/\)/ " 2: /=, /
syntax match   javascriptOpSymbol              contained /\(\^\|\~\)/ " 2: ^, ~

syntax match   javascriptOpSymbols             /!\+/ nextgroup=javascriptRegexpString,javascriptInvalidOp " 1: !
syntax match   javascriptOpSymbols             /!==\?/ nextgroup=javascriptRegexpString,javascriptInvalidOp " 2: !=, !==
syntax match   javascriptOpSymbols             /+\(+\|=\)\?/ nextgroup=javascriptRegexpString,javascriptInvalidOp " 3: +, ++, +=
syntax match   javascriptOpSymbols             /-\(-\|=\)\?/ nextgroup=javascriptRegexpString,javascriptInvalidOp " 3: -, --, -=
" spread operator
syntax match   javascriptSpreadOp              contained /\.\.\./ " 1
" exponentiation operator
syntax match   javascriptOpSymbol              contained /\(\*\*\|\*\*=\)/ " 2: **, **=


" Comment
syntax keyword javascriptCommentTodo           contained TODO FIXME XXX TBD
syntax region  javascriptLineComment           start="//" end="\n" contains=@Spell,javascriptCommentTodo 
syntax region  javascriptComment               start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo extend fold
syntax region  javascriptComment               start="<!--"  end="--\s*>" contains=@Spell,javascriptCommentTodo extend fold
syntax cluster javascriptComments              contains=javascriptDocComment,javascriptComment,javascriptLineComment

" JSDoc
syntax case ignore

syntax region  javascriptDocComment            start="/\*\*"  end="\*/" contains=javascriptDocNotation,javascriptCommentTodo,@Spell fold keepend
syntax match   javascriptDocNotation           contained /\W@/ nextgroup=javascriptDocTags

syntax keyword javascriptDocTags               contained constant constructor constructs function ignore inner private public readonly static
syntax keyword javascriptDocTags               contained const dict expose inheritDoc interface nosideeffects override protected struct
syntax keyword javascriptDocTags               contained example global

" syntax keyword javascriptDocTags               contained ngdoc nextgroup=javascriptDocNGDirective
syntax keyword javascriptDocTags               contained ngdoc scope priority animations
syntax keyword javascriptDocTags               contained ngdoc restrict methodOf propertyOf eventOf eventType nextgroup=javascriptDocParam skipwhite
syntax keyword javascriptDocNGDirective        contained overview service object function method property event directive filter inputType error

syntax keyword javascriptDocTags               contained abstract virtual access augments

syntax keyword javascriptDocTags               contained arguments callback lends memberOf name type kind link mixes mixin tutorial nextgroup=javascriptDocParam skipwhite
syntax keyword javascriptDocTags               contained variation nextgroup=javascriptDocNumParam skipwhite

syntax keyword javascriptDocTags               contained author class classdesc copyright default defaultvalue nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained deprecated description desc external host nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained file fileOverview overview namespace requires since version nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained summary todo license preserve nextgroup=javascriptDocDesc skipwhite

syntax keyword javascriptDocTags               contained borrows exports nextgroup=javascriptDocA skipwhite
syntax keyword javascriptDocTags               contained param arg argument property prop module submodule nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained type nextgroup=javascriptDocParamType skipwhite
syntax keyword javascriptDocTags               contained define enum extends implements this typedef nextgroup=javascriptDocParamType skipwhite
syntax keyword javascriptDocTags               contained return returns throws exception nextgroup=javascriptDocParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained see nextgroup=javascriptDocRef skipwhite

" plugins
syntax keyword javascriptDocTags               contained category inheritparams nextgroup=javascriptDocParam skipwhite
syntax keyword javascriptDocTags               contained toparam nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite

" syntax for event firing
syntax keyword javascriptDocTags               contained emits fires nextgroup=javascriptDocEventRef skipwhite

" ESDoc
syntax keyword javascriptDocTags               contained experimental nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained listens nextgroup=javascriptDocNamedParamType skipwhite
syntax keyword javascriptDocTags               contained test nextgroup=javascriptDocParamType skipwhite

syntax keyword javascriptDocTags               contained function func method nextgroup=javascriptDocName skipwhite
syntax match   javascriptDocName               contained /\h\w*/

syntax keyword javascriptDocTags               contained fires event nextgroup=javascriptDocEventRef skipwhite
syntax match   javascriptDocEventRef           contained /\h\w*#\(\h\w*\:\)\?\h\w*/

syntax match   javascriptDocNamedParamType     contained /{.\+}/ nextgroup=javascriptDocParamName skipwhite
syntax match   javascriptDocParamName          contained /\[\?[0-9a-zA-Z_=\.]\+\]\?/ nextgroup=javascriptDocDesc skipwhite
syntax match   javascriptDocParamType          contained /{.\+}/ nextgroup=javascriptDocDesc skipwhite
syntax match   javascriptDocA                  contained /\%(#\|\w\|\.\|:\|\/\)\+/ nextgroup=javascriptDocAs skipwhite
syntax match   javascriptDocAs                 contained /\s*as\s*/ nextgroup=javascriptDocB skipwhite
syntax match   javascriptDocB                  contained /\%(#\|\w\|\.\|:\|\/\)\+/
syntax match   javascriptDocParam              contained /\%(#\|\w\|\.\|:\|\/\|-\)\+/
syntax match   javascriptDocNumParam           contained /\d\+/
syntax match   javascriptDocRef                contained /\%(#\|\w\|\.\|:\|\/\)\+/
syntax region  javascriptDocLinkTag            contained matchgroup=javascriptDocLinkTag start=/{/ end=/}/ contains=javascriptDocTags

syntax cluster javascriptDocs                  contains=javascriptDocParamType,javascriptDocNamedParamType,javascriptDocParam

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200 linebreaks=2
endif

syntax case match

syntax cluster javascriptAfterIdentifier       contains=javascriptDotNotation,javascriptFuncCallArg,javascriptComputedProperty,javascriptOpSymbols,@javascriptComments
" syntax match   javascriptIdentifierName        /\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*/ nextgroup=@javascriptAfterIdentifier contains=@_semantic skipwhite skipempty
syntax match   javascriptIdentifierName        /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=@javascriptAfterIdentifier contains=javascriptGlobal,@_semantic skipwhite skipempty
syntax match   javascriptTagRef                /\<[a-zA-Z_$][0-9a-zA-Z_$]*\ze`/ nextgroup=javascriptTemplate
" runtime syntax/semhl.vim

"Block VariableStatement EmptyStatement ExpressionStatement IfStatement IterationStatement ContinueStatement BreakStatement ReturnStatement WithStatement LabelledStatement SwitchStatement ThrowStatement TryStatement DebuggerStatement

syntax cluster javascriptStatement             contains=javascriptBlock,javascriptVariable,@javascriptExpression,javascriptConditional,javascriptRepeat,javascriptBranch,javascriptLabel,javascriptStatementKeyword,javascriptTry,javascriptDebugger

syntax match   javascriptDotNotation           /\./ nextgroup=javascriptProp,javascriptMethod skipwhite skipempty
syntax match   javascriptDotStyleNotation      /\.style\./ nextgroup=javascriptDOMStyle transparent

" String
syntax region  javascriptString                start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=@javascriptComments skipwhite skipempty extend
syntax region  javascriptTemplate              start=/`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/ contains=javascriptTemplateSubstitution nextgroup=@javascriptComments,javascriptOpSymbols skipwhite skipempty keepend
syntax region  javascriptTemplateSubstitution  contained matchgroup=javascriptTemplateSB start=/\${/ end=/}/ contains=javascriptGlobal,javascriptBOMWindowProp,javascriptBOMWindowMethod,@javascriptExpression extend
" syntax match   javascriptTemplateTag           /\k\+/ nextgroup=javascriptTemplate
syntax region  javascriptArray                 matchgroup=javascriptBrackets start=/\[/ end=/]/ contains=@javascriptValue,javascriptComma,javascriptForComprehension,@javascriptComments,javascriptSpreadOp nextgroup=@javascriptComments,javascriptOpSymbols,@javascriptAfterIdentifier skipwhite skipempty

" Unicode Escape
syntax match   javascriptUnicodeEscapeSequence /\\u[0-9a-fA-F]\{4}/ nextgroup=@javascriptComments skipwhite skipempty
syntax match   javascriptUnicodeEscapeSequence /\\u{[0-9a-fA-F]\+}/ nextgroup=@javascriptComments skipwhite skipempty

" Number
syntax match   javascriptNumber                /\<0[bB][01]\+n\?\>/ nextgroup=@javascriptComments skipwhite skipempty
syntax match   javascriptNumber                /\<0[oO][0-7]\+n\?\>/ nextgroup=@javascriptComments skipwhite skipempty
syntax match   javascriptNumber                /\<0[xX][0-9a-fA-F]\+n\?\>/ nextgroup=@javascriptComments skipwhite skipempty
syntax match   javascriptNumber                /[+-]\=\%(\d\+\.\d\+\|\d\+\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/ nextgroup=@javascriptComments skipwhite skipempty
syntax match   javascriptNumber                /[+-]\=\d\+\.\%([eE][+-]\=\d\+\)\=/ nextgroup=@javascriptComments skipwhite skipempty
syntax match   javascriptNumber                /[+-]\=\d\+n\>/ nextgroup=@javascriptComments skipwhite skipempty

syntax cluster javascriptTypes                 contains=javascriptString,javascriptTemplate,javascriptTagRef,javascriptRegexpString,javascriptNumber,javascriptBoolean,javascriptNull,javascriptArray
syntax cluster javascriptValue                 contains=@javascriptTypes,@javascriptExpression,javascriptFuncKeyword,javascriptClassKeyword,javascriptObjectLiteral,javascriptIdentifier,javascriptIdentifierName,javascriptOperator,javascriptOpSymbols

syntax match   javascriptLabel                 /[a-zA-Z_$]\k*\_s*:/he=e-1 contains=javascriptReserved nextgroup=@javascriptValue,@javascriptStatement skipwhite skipempty
syntax match   javascriptObjectLabel           contained /\k\+\_s*:/he=e-1 contains=javascriptObjectLabelColon nextgroup=@javascriptComments,@javascriptValue,@javascriptStatement skipwhite skipempty
syntax match   javascriptObjectLabelColon      contained /\s*:/ nextgroup=@javascriptValue skipwhite skipempty
" syntax match   javascriptPropertyName          contained /"[^"]\+"\s*:/he=e-1 nextgroup=@javascriptValue skipwhite skipempty
" syntax match   javascriptPropertyName          contained /'[^']\+'\s*:/he=e-1 nextgroup=@javascriptValue skipwhite skipempty
syntax region  javascriptPropertyNameString    contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=javascriptObjectLabelColon,javascriptFuncArg skipwhite skipempty
syntax region  javascriptComputedPropertyName  contained matchgroup=javascriptPropertyNameString start=/\[/rs=s+1 end=/]/ contains=@javascriptValue nextgroup=javascriptFuncArg,javascriptObjectLabelColon skipwhite skipempty
syntax region  javascriptComputedProperty      contained matchgroup=javascriptProperty start=/\[/rs=s+1 end=/]/ contains=@javascriptValue,javascriptOpSymbols nextgroup=@javascriptAfterIdentifier skipwhite skipempty
" Value for object, statement for label statement

syntax cluster javascriptTemplates             contains=javascriptTemplate,javascriptTemplateSubstitution,javascriptTemplateSB
syntax cluster javascriptStrings               contains=javascriptProp,javascriptString,@javascriptTemplates,javascriptTagRef,@javascriptComments,javascriptDocComment,javascriptRegexpString,javascriptPropertyNameString
syntax cluster javascriptNoReserved            contains=@javascriptStrings,@javascriptDocs,shellbang,javascriptObjectLiteral,javascriptParenObjectLiteral,javascriptObjectLabel,javascriptClassBlock,javascriptMethodName,javascriptMethod
"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved break do catch class const continue
syntax keyword javascriptReservedCase          containedin=ALLBUT,@javascriptNoReserved,javascriptCaseBlock case
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved debugger default delete do else export
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved extends finally for function if import
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved in instanceof let new null return super
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved switch throw try typeof 
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved,javascriptObjectMethodName var
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved void while with yield await

syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved enum implements package protected static
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved interface private public 
"old keywords
" syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved abstract boolean
" syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved byte char double final float goto int
" syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved long native short synchronized throws
" syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved transient volatile

" JavaScript Prototype
syntax keyword javascriptPrototype             prototype

syntax keyword javascriptImport                from as
syntax keyword javascriptImport                import nextgroup=javascriptImportPattern skipwhite skipempty
syntax keyword javascriptExport                export from default

syntax match   javascriptImportPattern         contained /\*/

" Keywords
syntax keyword javascriptIdentifier            arguments this nextgroup=@javascriptAfterIdentifier
syntax keyword javascriptVariable              let var const nextgroup=javascriptIdentifierName skipwhite
syntax keyword javascriptOperator              delete instanceof typeof void in nextgroup=@javascriptValue,@javascriptTypes skipwhite skipempty
syntax keyword javascriptOperator              new nextgroup=javascriptNewTarget,@javascriptValue,@javascriptTypes skipwhite skipempty
syntax match   javascriptNewTarget             contained /.target/ contains=javascriptTarget
syntax keyword javascriptTarget                contained target
syntax keyword javascriptForOperator           contained in of
syntax keyword javascriptBoolean               true false nextgroup=@javascriptComments skipwhite skipempty
syntax keyword javascriptNull                  null undefined nextgroup=@javascriptComments skipwhite skipempty

" Statement Keywords
syntax keyword javascriptConditional           if else
syntax keyword javascriptConditionalElse       else
syntax keyword javascriptRepeat                do while for nextgroup=javascriptLoopParen skipwhite skipempty
syntax keyword javascriptBranch                break continue
syntax keyword javascriptSwitch                switch nextgroup=javascriptSwitchExpression skipwhite skipempty
syntax keyword javascriptCase                  contained case
syntax keyword javascriptDefault               contained default nextgroup=javascriptCaseColon skipwhite skipempty
syntax keyword javascriptStatementKeyword      with yield
syntax keyword javascriptReturn                return nextgroup=@javascriptValue,javascriptClassSuper,@javascriptComments skipwhite
syntax keyword javascriptYield                 yield nextgroup=javascriptYieldGen skipwhite
syntax match   javascriptYieldGen              contained /\*/

syntax keyword javascriptTry                   try
syntax keyword javascriptExceptions            catch throw finally
syntax keyword javascriptDebugger              debugger

syntax region  javascriptSwitchExpression      contained matchgroup=javascriptParens start=/(/ end=/)/ contains=@javascriptExpression,@javascriptComments nextgroup=javascriptCaseBlock skipwhite skipempty
if &filetype =~ 'javascript'
  syntax cluster htmlJavaScriptForCase         contains=TOP,javascriptReservedCase
else
  syntax cluster htmlJavaScriptForCase         contains=@htmlJavaScript
  syntax cluster htmlJavaScript                remove=javascriptReservedCase
endif
syntax region  javascriptCaseBlock             matchgroup=javascriptBraces start=/{/ end=/}/ contains=javascriptCaseColon,javascriptCaseExpression,@htmlJavaScriptForCase,javascriptDefault fold
syntax region  javascriptCaseExpression        contained start=/case/ end=/:/ contains=javascriptCase,@javascriptExpression nextgroup=javascriptBlock skipwhite skipempty keepend
syntax match   javascriptCaseColon             contained /:/ nextgroup=javascriptBlock skipwhite skipempty

syntax match   javascriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*/ contains=@props,@javascriptProps,@_semantic transparent nextgroup=@javascriptAfterIdentifier skipwhite skipempty
syntax match   javascriptMethod                contained /[a-zA-Z_$][a-zA-Z0-9_$]*\ze(/ contains=@props,javascriptProps transparent nextgroup=javascriptFuncCallArg

" runtime syntax/web.vim
runtime syntax/yajs/javascript.vim
runtime syntax/yajs/es6-number.vim
runtime syntax/yajs/es6-string.vim
runtime syntax/yajs/es6-array.vim
runtime syntax/yajs/es6-object.vim
runtime syntax/yajs/es6-symbol.vim
runtime syntax/yajs/es6-function.vim
runtime syntax/yajs/es6-math.vim
runtime syntax/yajs/es6-date.vim
runtime syntax/yajs/es6-json.vim
runtime syntax/yajs/es6-reflect.vim
runtime syntax/yajs/es6-regexp.vim
runtime syntax/yajs/es6-map.vim
runtime syntax/yajs/es6-set.vim
runtime syntax/yajs/es6-proxy.vim
runtime syntax/yajs/es6-promise.vim
runtime syntax/yajs/es6-typed-array.vim
runtime syntax/yajs/es6-dataview.vim
runtime syntax/yajs/es6-bigint.vim
runtime syntax/yajs/es6-generator.vim
runtime syntax/yajs/ecma-402.vim
runtime syntax/yajs/node.vim
runtime syntax/yajs/web.vim
runtime syntax/yajs/web-window.vim
runtime syntax/yajs/web-navigator.vim
runtime syntax/yajs/web-location.vim
runtime syntax/yajs/web-history.vim
runtime syntax/yajs/web-console.vim
runtime syntax/yajs/web-xhr.vim
runtime syntax/yajs/web-blob.vim
runtime syntax/yajs/web-crypto.vim
runtime syntax/yajs/web-fetch.vim
runtime syntax/yajs/web-service-worker.vim
runtime syntax/yajs/web-broadcast.vim
runtime syntax/yajs/web-payment.vim
runtime syntax/yajs/web-encoding.vim
runtime syntax/yajs/web-network.vim
runtime syntax/yajs/web-geo.vim
runtime syntax/yajs/web-clipboard.vim
runtime syntax/yajs/dom-node.vim
runtime syntax/yajs/dom-elem.vim
runtime syntax/yajs/dom-form.vim
runtime syntax/yajs/dom-document.vim
runtime syntax/yajs/dom-event.vim
runtime syntax/yajs/dom-storage.vim
runtime syntax/yajs/css.vim

let javascript_props = 1

runtime syntax/yajs/event.vim
syntax region  javascriptEventString           contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ contains=javascriptASCII,@events


if &filetype =~ 'javascript'
  syntax region  javascriptBlock                 matchgroup=javascriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=TOP fold
else
  syntax region  javascriptBlock                 matchgroup=javascriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=@htmlJavaScript fold
endif

syntax match   javascriptObjectMethodName      contained /[a-zA-Z0-9_$]\+\ze\_s*(/ nextgroup=javascriptFuncArg skipwhite skipempty
syntax cluster javascriptObjectMethod          contains=javascriptMethodAccessor,javascriptObjectMethodName

syntax match   javascriptMethodName            contained /\k\+/ nextgroup=javascriptFuncArg skipwhite skipempty
syntax region  javascriptMethodName            contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=javascriptFuncArg skipwhite skipempty extend
syntax match   javascriptMethodAccessor        contained /\(\(set\|get\)\>\|\*\)\ze\_s*\(\[\|\k\|["']\)/ contains=javascriptMethodAccessorWords nextgroup=javascriptMethodName skipwhite
syntax keyword javascriptMethodAccessorWords   contained get set
syntax region  javascriptMethodName            contained matchgroup=javascriptMethodName start=/\[/ end=/]/ contains=@javascriptValue nextgroup=javascriptFuncArg skipwhite skipempty

" syntax keyword javascriptFuncKeyword           function nextgroup=javascriptAsyncFunc,javascriptSyncFunc
syntax match   javascriptSyncFunc              contained /\s*/ nextgroup=javascriptFuncName,javascriptFuncArg
syntax match   javascriptAsyncFunc             contained /\s*\*\s*/ nextgroup=javascriptFuncName,javascriptFuncArg skipwhite skipempty
syntax match   javascriptFuncName              contained /[a-zA-Z_$]\k*/ nextgroup=javascriptFuncArg skipwhite
syntax region  javascriptFuncArgArray          contained matchgroup=javascriptBrackets start=/\[/ end=/]/ contains=@javascriptFuncArgElements transparent
syntax region  javascriptFuncArgObject         contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=@javascriptFuncArgElements transparent
syntax cluster javascriptFuncArgElements       contains=javascriptFuncKeyword,javascriptComma,javascriptDefaultAssign,@javascriptComments,javascriptFuncArgArray,javascriptFuncArgObject,javascriptSpreadOp
syntax region  javascriptFuncArg               contained matchgroup=javascriptParens start=/(/ end=/)/ contains=@javascriptFuncArgElements nextgroup=javascriptBlock skipwhite skipwhite skipempty

syntax match   javascriptComma                 contained /,/
syntax match   javascriptDefaultAssign         contained /=/ nextgroup=@javascriptExpression skipwhite skipempty

" Class
syntax keyword javascriptClassKeyword          class nextgroup=javascriptClassName,javascriptClassBlock,javascriptClassExtends skipwhite
syntax keyword javascriptClassSuper            super nextgroup=@javascriptAfterIdentifier skipwhite skipempty
syntax match   javascriptClassName             contained /\k\+/ nextgroup=javascriptClassBlock,javascriptClassExtends skipwhite
syntax match   javascriptClassSuperName        contained /[a-zA-Z_$][0-9a-zA-Z_$\[\]\.\(\)]*/ nextgroup=javascriptClassBlock skipwhite
syntax keyword javascriptClassExtends          contained extends nextgroup=javascriptClassSuperName,javascriptClassExtendsNew skipwhite
syntax keyword javascriptClassExtendsNew       contained new nextgroup=javascriptClassSuperName skipwhite
syntax region  javascriptClassBlock            contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=javascriptMethodName,javascriptMethodAccessor,javascriptAsyncFuncKeyword,javascriptClassStatic,@javascriptComments fold
syntax keyword javascriptClassStatic           contained static nextgroup=javascriptMethodName,javascriptMethodAccessor skipwhite


syntax keyword javascriptForComprehension      contained for nextgroup=javascriptForComprehensionTail skipwhite skipempty
syntax region  javascriptForComprehensionTail  contained matchgroup=javascriptParens start=/(/ end=/)/ contains=javascriptOfComprehension,@javascriptExpression nextgroup=javascriptForComprehension,javascriptIfComprehension,@javascriptExpression skipwhite skipempty
syntax keyword javascriptOfComprehension       contained of
syntax keyword javascriptIfComprehension       contained if nextgroup=javascriptIfComprehensionTail
syntax region  javascriptIfComprehensionTail   contained matchgroup=javascriptParens start=/(/ end=/)/ contains=javascriptExpression nextgroup=javascriptForComprehension,javascriptIfComprehension skipwhite skipempty

syntax region  javascriptObjectLiteral         contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=@javascriptComments,javascriptObjectLabel,javascriptComma,@javascriptObjectMethod,javascriptPropertyNameString,javascriptComputedPropertyName,@javascriptValue fold

" syntax match   javascriptBraces                /[\[\]]/
" syntax match   javascriptParens                /[()]/

syntax region  htmlScriptTag                   contained start=+<script+ end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent
syntax match   javascriptEndColons             /[;,]/

" From vim runtime
" <https://github.com/vim/vim/blob/master/runtime/syntax/javascript.vim#L48>
syntax region  javascriptRegexpString          start=+/[^/*]+me=e-1 skip=+\\.\|\[\(\\.\|[^\]]\+\)*+ end=+/[gimsuy]\{0,6\}\s*$+ end=+/[gimsuy]\{0,6\}\s*[;.,)\]}]+me=e-1 oneline

syntax cluster javascriptEventTypes            contains=javascriptEventString,javascriptTemplate,javascriptTagRef,javascriptNumber,javascriptBoolean,javascriptNull
syntax cluster javascriptOps                   contains=javascriptOpSymbols,javascriptLogicSymbols,javascriptOperator
syntax cluster javascriptExpression            contains=javascriptArrowFuncDef,javascriptParenExp,@javascriptValue,javascriptObjectLiteral,javascriptFuncKeyword,javascriptYield,javascriptIdentifierName,javascriptRegexpString,@javascriptTypes,@javascriptOps,javascriptGlobal,jsxRegion,javascriptClassSuper
syntax cluster javascriptEventExpression       contains=javascriptArrowFuncDef,javascriptParenExp,@javascriptValue,javascriptObjectLiteral,javascriptFuncKeyword,javascriptIdentifierName,javascriptRegexpString,@javascriptEventTypes,@javascriptOps,javascriptGlobal,jsxRegion

syntax region  javascriptLoopParen             contained matchgroup=javascriptParens start=/(/ end=/)/ contains=javascriptVariable,javascriptForOperator,javascriptEndColons,@javascriptExpression nextgroup=javascriptBlock skipwhite skipempty

" syntax match   javascriptFuncCall              contained /[a-zA-Z]\k*\ze(/ nextgroup=javascriptFuncCallArg
syntax region  javascriptFuncCallArg           contained matchgroup=javascriptParens start=/(/ end=/)/ contains=javascriptComma,@javascriptExpression,@javascriptComments nextgroup=@javascriptAfterIdentifier skipwhite skipempty 
syntax region  javascriptEventFuncCallArg      contained matchgroup=javascriptParens start=/(/ end=/)/ contains=@javascriptEventExpression,@javascriptComments


syntax match   javascriptArrowFuncDef          /(\_[^()]*)\_s*=>/ contains=javascriptArrowFuncArg,javascriptComma,javascriptArrowFunc nextgroup=@afterArrowFunc skipwhite skipempty
syntax match   javascriptArrowFuncDef          /[a-zA-Z_$]\k*\_s*=>/ contains=javascriptArrowFuncArg,javascriptArrowFunc nextgroup=@afterArrowFunc skipwhite skipempty
syntax match   javascriptArrowFunc             /=>/
syntax match   javascriptArrowFuncArg          contained /[a-zA-Z_$]\k*/
syntax region  javascriptArrowFuncArg          contained matchgroup=javascriptParens start=/(/ end=/)/ contains=@javascriptFuncArgElements nextgroup=javascriptArrowFunc skipwhite skipwhite skipempty
syntax match   javascriptAsynArrowFunc         /(\s*async\s*\(=>\)\@!/ contains=javascriptAsyncFuncKeyword

syntax keyword javascriptFuncKeyword           function nextgroup=javascriptAsyncFunc,javascriptSyncFunc

" Special object for arrow function direct return
syntax region  javascriptParenObjectLiteral    contained start=/(\_s*\ze{/ end=/)/ contains=javascriptObjectLiteral,@javascriptComments transparent fold
" Special object for jsx return
syntax region  javascriptParenTagLiteral       containedin=@javascriptValue start=/(\ze\_s*</ end=/)/ contains=@javascriptExpression,@javascriptComments transparent fold

" For ((foo) => {})
syntax region  javascriptParenExp              matchgroup=javascriptParens start=/(\ze\_s*(/ end=/)/ contains=@javascriptExpression nextgroup=@javascriptComments,javascriptOpSymbols skipwhite skipempty

" async await
syntax keyword javascriptAsyncFuncKeyword      async nextgroup=javascriptFuncKeyword,javascriptArrowFuncDef,javascriptMethodName skipwhite
syntax keyword javascriptAwaitFuncKeyword      await nextgroup=@javascriptExpression skipwhite

syntax cluster javascriptExpression            add=javascriptAsyncFuncKeyword,javascriptAwaitFuncKeyword
syntax cluster afterArrowFunc                  add=javascriptOperator,javascriptIdentifierName,javascriptBlock,javascriptArrowFuncDef,javascriptParenObjectLiteral,javascriptClassSuper,javascriptClassKeyword,javascriptAsyncFuncKeyword,javascriptAwaitFuncKeyword

if exists("did_javascript_hilink")
  HiLink javascriptReserved             Error
  HiLink javascriptReservedCase         Error
  HiLink javascriptInvalidOp            Error

  HiLink javascriptEndColons            Statement
  HiLink javascriptOpSymbol             Normal
  HiLink javascriptBraces               Function
  HiLink javascriptBrackets             Function
  HiLink javascriptParens               Normal
  HiLink javascriptComment              Comment
  HiLink javascriptLineComment          Comment
  HiLink javascriptDocComment           Comment
  HiLink javascriptCommentTodo          Todo
  HiLink javascriptDocNotation          SpecialComment
  HiLink javascriptDocTags              SpecialComment
  HiLink javascriptDocNGParam           javascriptDocParam
  HiLink javascriptDocParam             Function
  HiLink javascriptDocNumParam          Function
  HiLink javascriptDocEventRef          Function
  HiLink javascriptDocNamedParamType    Type
  HiLink javascriptDocParamName         Type
  HiLink javascriptDocParamType         Type
  HiLink javascriptString               String
  HiLink javascriptTemplate             String
  HiLink javascriptEventString          String
  HiLink javascriptASCII                Label
  HiLink javascriptTemplateSubstitution Label
  HiLink javascriptTemplateSB           javascriptTemplateSubstitution
  HiLink javascriptRegexpString         String
  HiLink javascriptGlobal               Constant
  HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptConditionalElse      Conditional
  HiLink javascriptSwitch               Conditional
  HiLink javascriptCase                 Label
  HiLink javascriptDefault              javascriptCase
  HiLink javascriptExportDefault        javascriptCase
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Structure
  HiLink javascriptVariable             Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptForComprehension     Repeat
  HiLink javascriptIfComprehension      Repeat
  HiLink javascriptOfComprehension      Repeat
  HiLink javascriptForOperator          Repeat
  HiLink javascriptStatementKeyword     Statement
  HiLink javascriptReturn               Statement
  HiLink javascriptYield                Statement
  HiLink javascriptYieldGen             Statement
  HiLink javascriptMessage              Keyword
  HiLink javascriptOperator             Identifier
  HiLink javascriptTarget               Identifier
  " HiLink javascriptType                 Type
  HiLink javascriptNull                 Boolean
  HiLink javascriptNumber               Number
  HiLink javascriptBoolean              Boolean
  HiLink javascriptObjectLabel          javascriptLabel
  HiLink javascriptLabel                Label
  HiLink javascriptPropertyNameString   Label
  HiLink javascriptImport               Include
  HiLink javascriptExport               Include
  HiLink javascriptTry                  Statement
  HiLink javascriptExceptions           Statement

  HiLink javascriptMethodName           Function
  HiLink javascriptMethodAccessor       Operator
  HiLink javascriptObjectMethodName     javascriptLabel

  HiLink javascriptFuncKeyword          Keyword
  HiLink javascriptAsyncFuncKeyword     Keyword
  HiLink javascriptAwaitFuncKeyword     Keyword
  HiLink javascriptArrowFunc            Statement
  HiLink javascriptFuncName             Function
  HiLink javascriptFuncArg              Special
  HiLink javascriptArrowFuncArg         javascriptFuncArg
  HiLink javascriptTagRef               Function
  HiLink javascriptComma                Normal

  HiLink javascriptClassKeyword         Keyword
  HiLink javascriptClassExtends         Keyword
  HiLink javascriptClassExtendsNew      Operator
  HiLink javascriptClassName            Function
  HiLink javascriptClassSuperName       Function
  HiLink javascriptClassStatic          Keyword
  HiLink javascriptMethodAccessorWords  Keyword
  HiLink javascriptClassSuper           keyword

  HiLink shellbang                      Comment

  highlight link javaScript             NONE

  delcommand HiLink
  unlet did_javascript_hilink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

