syntax keyword javascriptGlobal NetworkInformation nextgroup=@javascriptAfterIdentifier
syntax keyword javascriptBOMNetworkProp contained downlink downlinkMax effectiveType
syntax keyword javascriptBOMNetworkProp contained rtt type
syntax cluster props add=javascriptBOMNetworkProp
if exists("did_javascript_hilink") | HiLink javascriptBOMNetworkProp Keyword
endif
