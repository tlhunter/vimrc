syntax keyword javascriptGeneratorMethod contained next return throw nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptGeneratorMethod
if exists("did_javascript_hilink") | HiLink javascriptGeneratorMethod Keyword
endif
