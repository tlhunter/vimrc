syntax keyword javascriptGlobal Clipboard nextgroup=@javascriptAfterIdentifier
syntax keyword javascriptClipboardMethod contained read readText write writeText nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptClipboardMethod
if exists("did_javascript_hilink") | HiLink javascriptClipboardMethod Keyword
endif
