syntax keyword javascriptGlobal Array nextgroup=javascriptGlobalArrayDot,javascriptFuncCallArg
syntax match   javascriptGlobalArrayDot /\./ contained nextgroup=javascriptArrayStaticMethod,javascriptProp,javascriptMethod
syntax keyword javascriptArrayStaticMethod contained from isArray of nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptArrayStaticMethod Keyword
endif
syntax keyword javascriptArrayMethod contained concat copyWithin entries every fill nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained filter find findIndex flat flatMap nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained forEach indexOf includes join keys nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained lastIndexOf map pop push reduce reduceRight nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained reverse shift slice some sort splice nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained toLocaleString toSource toString unshift nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptArrayMethod
if exists("did_javascript_hilink") | HiLink javascriptArrayMethod Keyword
endif
