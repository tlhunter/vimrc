syntax keyword javascriptBroadcastGlobal BroadcastChannel
if exists("did_javascript_hilink") | HiLink javascriptBroadcastGlobal Structure
endif
syntax keyword javascriptBroadcastProp contained name onmessage
syntax cluster props add=javascriptBroadcastProp,javascriptBroadcastMethod
if exists("did_javascript_hilink") | HiLink javascriptBroadcastProp Keyword
endif

syntax keyword javascriptBroadcastMethod contained postMessage close nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptBroadcastMethod Keyword
endif

