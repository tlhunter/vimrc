syntax keyword javascriptGlobal console nextgroup=@javascriptAfterIdentifier
syntax keyword javascriptConsoleMethod contained count dir error group groupCollapsed nextgroup=javascriptFuncCallArg
syntax keyword javascriptConsoleMethod contained groupEnd info log time timeEnd trace nextgroup=javascriptFuncCallArg
syntax keyword javascriptConsoleMethod contained warn nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptConsoleMethod
if exists("did_javascript_hilink") | HiLink javascriptConsoleMethod Keyword
endif
