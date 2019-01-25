
files='
  javascript
  es6-number
  es6-string
  es6-array
  es6-object
  es6-symbol
  es6-function
  es6-math
  es6-json
  es6-date
  es6-reflect
  es6-regexp
  es6-map
  es6-set
  es6-proxy
  es6-promise
  es6-typed-array
  es6-dataview
  es6-bigint
  es6-generator
  ecma-402
  node
  web
  web-console
  web-window
  web-navigator
  web-location
  web-history
  web-xhr
  web-blob
  web-crypto
  web-fetch
  web-service-worker
  web-payment
  web-encoding
  web-network
  web-geo
  web-clipboard
  dom-node
  dom-elem
  dom-form
  dom-event
  dom-document
  dom-storage
  event
  css'

for file in $files; do
  node p.js $file > ../syntax/yajs/$file.vim
done

