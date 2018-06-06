syntax keyword javascriptEncodingGlobal TextEncoder TextDecoder
if exists("did_javascript_hilink") | HiLink javascriptEncodingGlobal Structure
endif
syntax keyword javascriptEncodingProp contained encoding fatal ignoreBOM
syntax cluster props add=javascriptEncodingProp
if exists("did_javascript_hilink") | HiLink javascriptEncodingProp Keyword
endif
syntax keyword javascriptEncodingMethod contained encode decode nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptEncodingMethod
if exists("did_javascript_hilink") | HiLink javascriptEncodingMethod Keyword
endif
