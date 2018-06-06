syntax keyword javascriptDOMFormProp contained acceptCharset action elements encoding
syntax keyword javascriptDOMFormProp contained enctype length method name target
syntax cluster props add=javascriptDOMFormProp
if exists("did_javascript_hilink") | HiLink javascriptDOMFormProp Keyword
endif
syntax keyword javascriptDOMFormMethod contained reportValidity reset submit nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptDOMFormMethod
if exists("did_javascript_hilink") | HiLink javascriptDOMFormMethod Keyword
endif
