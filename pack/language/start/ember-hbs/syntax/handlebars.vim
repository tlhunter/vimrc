if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
syntax cluster htmlPreproc add=hbsComponent,hbsMustache,hbsUnescaped,hbsMustacheBlock,hbsComment,hbsElseBlock,hbsEscapedMustache

syntax match hbsEscapedMustache "\v\\\{\{"

syntax region hbsComponent matchgroup=hbsComponentStatement start="\v\<(\/?)((\@\a+)|(((\w|-)+::)*\u\a+)|(\a+\.\a+))" end="\v\/?\>" keepend
syntax region hbsMustache matchgroup=hbsHandles start="\v\{\{" skip="\v\\\}\}" end="\v\}\}" containedin=hbsComponent keepend
syntax region hbsMustacheBlock matchgroup=hbsHandles start="\v\{\{[#/]" skip="\v\\\}\}" end="\v\}\}" keepend
" modern hbs supports {{else <block>}} where <block> starts a new block
syntax region hbsElseBlock matchgroup=hbsHandles start="\v\{\{else\ "rs=e-5 skip="\v\\\}\}" end="\v\}\}" keepend

syntax region hbsPencil matchgroup=hbsOperator start="\v\(" end="\v\)" contained containedin=hbsMustache,hbsMustacheBlock,hbsElseBlock,hbsPencil

" identifier is any word inside a mustache or a pencil that is not followed by a = sign (see hbsArg below)
syntax match hbsIdentifier "\v(\(|\{\{[#/]?)@<!<(\w+)|(\@\w+)>" contained containedin=hbsMustache,hbsMustacheBlock,hbsPencil,hbsElseBlock,hbsStatement

" unescaped are special forms of mustaches that don't have other stuff except for an identifier in it
syntax region hbsUnescaped matchgroup=hbsUnescapedHandles start="\v\{\{\{" skip="\v\\\}\}\}" end="\v\}\}\}" keepend
syntax match hbsUnescapedIdentifier "\v(\{\{\{)@<=<\S+>(\}\}\})" contained containedin=hbsUnescaped

syntax match hbsMustacheName "\v(\{\{[#/]?)@<=<\S+>" contained containedin=hbsMustache,hbsMustacheBlock,hbsPencil
syntax match hbsPencilName "\v(\()@<=<\S+>" contained containedin=hbsMustache,hbsMustacheBlock,hbsPencil
syntax match hbsBuiltInHelper "\v(\{\{)@<=<else>( ?)@=" contained containedin=hbsElseBlock
syntax match hbsBuiltInHelper "\v\(@<=<(query-params|mut|get|if|action|unless|unbound|concat)>" contained containedin=hbsPencil
syntax match hbsBuiltInHelper "\v(\{\{)@<=<(textarea|mut|input|get|debugger|action|unless|input|unbound|yield|outlet|else)>" contained containedin=hbsMustache
syntax match hbsBuiltInHelper "\v(\{\{[#/]?)@<=<(component|with|if|each(\-in)?|link\-to|unless)>" contained containedin=hbsMustacheBlock,hbsElseBlock
syntax match hbsBuiltInHelperInElse "\v(\{\{else\ )@<=<(component|with|if|each(\-in)?|link\-to|unless)>" contained containedin=hbsMustacheBlock,hbsElseBlock
syntax match hbsKeyword "\v\s+as\s+" contained containedin=hbsComponent,hbsMustacheBlock,hbsElseBlock
syntax region hbsStatement matchgroup=hbsDelimiter start="\v\|" end="\v\|" contained containedin=hbsComponent,hbsMustacheBlock,hbsElseBlock

syntax region hbsString matchgroup=hbsString start=/\v\"/ skip=/\v\\\"/ end=/\v\"/ contained containedin=hbsComponent,hbsMustache,hbsMustacheBlock,hbsPencil,hbsElseBlock
syntax region hbsString matchgroup=hbsString start=/\v\'/ skip=/\v\\\'/ end=/\v\'/ contained containedin=hbsComponent,hbsMustache,hbsMustacheBlock,hbsPencil,hbsElseBlock
syntax match hbsNumber "\v<\d+>" contained containedin=hbsComponent,hbsMustache,hbsMustacheBlock,hbsPencil,hbsElseBlock
syntax match hbsArg "\v(\@\S+|\S+)\=@=" contained containedin=hbsComponent,hbsMustache,hbsMustacheBlock,hbsPencil,hbsElseBlock
syntax match hbsOperator "\v(\S+)@<=\=" contained containedin=hbsComponent,hbsMustache,hbsMustacheBlock,hbsPencil,hbsElseBlock

syntax region hbsComment start="\v\{\{\!" end="\v\}\}" keepend
syntax region hbsComment start="\v\{\{\!\-\-" end="\v\-\-\}\}" keepend

highlight link hbsBuiltInHelper Function
highlight link hbsBuiltInHelperInElse Function
highlight link hbsKeyword Keyword
highlight link hbsOperator Operator
highlight link hbsDelimiter Delimiter
highlight link hbsMustacheName Statement
highlight link hbsPencilName Statement
highlight link hbsIdentifier Identifier
highlight link hbsString String
highlight link hbsNumber Number
highlight link hbsHandles Define
highlight link hbsComponentStatement Define
highlight link hbsUnescapedHandles Identifier
highlight link hbsUnescapedIdentifier Identifier
highlight link hbsComment Comment
highlight link hbsArg Type

let b:current_syntax = "handlebars"
