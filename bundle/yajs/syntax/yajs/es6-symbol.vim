syntax keyword javascriptGlobal Symbol nextgroup=javascriptGlobalSymbolDot,javascriptFuncCallArg
syntax match   javascriptGlobalSymbolDot /\./ contained nextgroup=javascriptSymbolStaticProp,javascriptSymbolStaticMethod,javascriptProp,javascriptMethod
syntax keyword javascriptSymbolStaticProp contained length iterator match replace
syntax keyword javascriptSymbolStaticProp contained search split hasInstance isConcatSpreadable
syntax keyword javascriptSymbolStaticProp contained unscopables species toPrimitive
syntax keyword javascriptSymbolStaticProp contained toStringTag
if exists("did_javascript_hilink") | HiLink javascriptSymbolStaticProp Keyword
endif
syntax keyword javascriptSymbolStaticMethod contained for keyFor nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptSymbolStaticMethod Keyword
endif
syntax keyword javascriptSymbolProp contained description
syntax cluster props add=javascriptSymbolProp
if exists("did_javascript_hilink") | HiLink javascriptSymbolProp Keyword
endif
