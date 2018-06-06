syntax keyword javascriptGlobal Array nextgroup=javascriptGlobalArrayDot,javascriptFuncCallArg
syntax match   javascriptGlobalArrayDot /\./ contained nextgroup=javascriptArrayStaticMethod,javascriptProp,javascriptMethod
syntax keyword javascriptArrayStaticMethod contained from isArray of nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptArrayStaticMethod Keyword
endif
syntax keyword javascriptArrayMethod contained concat copyWithin entries every fill nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained filter find findIndex forEach indexOf nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained includes join keys lastIndexOf map nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained pop push reduce reduceRight reverse nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained shift slice some sort splice toLocaleString nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained toSource toString unshift nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptArrayMethod
if exists("did_javascript_hilink") | HiLink javascriptArrayMethod Keyword
endif
