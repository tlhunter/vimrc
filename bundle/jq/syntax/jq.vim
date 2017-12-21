" Vim syntax file
" Language:	jq
" Maintainer:	Vito C <vito.blog@gmail.com>
" Last Change:	2015 Nov 28

" Quit when a (custom) syntax file was already loaded
if exists('b:current_syntax')
  finish
endif

" syn include @jqHtml syntax/html.vim  " Doc comment HTML

" jqTodo
syntax keyword jqTodo contained TODO FIXME NOTE XXX

" jqKeywords
syntax keyword jqKeywords if then elif else and or not empty
syntax keyword jqKeywords try catch
syntax keyword jqKeywords end reduce as label break foreach
syntax keyword jqKeywords import include module modulemeta
syntax keyword jqKeywords env nth has in while error stderr debug

" jqConditions
syntax keyword jqCondtions true false null

" jqSpecials
syntax keyword jqType type
syntax match jqType /[\|;]/ " not really a type I did this for coloring reasons though :help group-name
syntax region jqParentheses start=+(+ end=+)+ fold transparent

" jq Functions
syntax keyword jqFunction add all any arrays ascii_downcase floor
syntax keyword jqFunction ascii_upcase booleans bsearch capture combinations
syntax keyword jqFunction \contains del delpaths endswith explode
syntax keyword jqFunction finites first flatten format from_entries
syntax keyword jqFunction fromdate fromdateiso8601 fromjson fromstream get_jq_origin
syntax keyword jqFunction get_prog_origin get_search_list getpath gmtime group_by
syntax keyword jqFunction gsub implode index indices infinite
syntax keyword jqFunction input input_filename input_line_number inputs inside
syntax keyword jqFunction isfinite isinfinite isnan isnormal iterables
syntax keyword jqFunction join keys keys_unsorted last leaf_paths
syntax keyword jqFunction length limit ltrimstr map map_values
syntax keyword jqFunction match max max_by min min_by
syntax keyword jqFunction mktime nan normals now
syntax keyword jqFunction nulls numbers objects paths range
syntax keyword jqFunction recurse recurse_down repeat reverse rindex
syntax keyword jqFunction rtrimstr scalars scalars_or_empty scan select
syntax keyword jqFunction setpath sort sort_by split splits with_entries
syntax keyword jqFunction startswith strftime strings strptime sub
syntax keyword jqFunction test to_entries todate todateiso8601 tojson __loc__
syntax keyword jqFunction tonumber tostream tostring transpose truncate_stream
syntax keyword jqFunction unique unique_by until utf8bytelength values walk
" TODO: $__loc__ is going to be a pain

" Comments
syntax match jqComment "#.*" contains=jqTodo

" Variables
syn match jqVariables /$[_A-Za-z0-9]\+/

" Definition
syntax keyword jqKeywords def nextgroup=jqNameDefinition skipwhite
syn match jqNameDefinition /\<[_A-Za-z0-9]\+\>/ contained nextgroup=jqPostNameDefinition
syn match jqNameDefinition /`[^`]\+`/ contained nextgroup=jqPostNameDefinition

" Strings
syn region jqError start=+'+ end=+'\|$\|[;)]\@=+
syn region jqString matchgroup=jqQuote
            \ start=+"+ skip=+\\"+ end=+"+
            \ contains=@Spell,jqInterpolation
syn region jqInterpolation matchgroup=jqInterpolationDelimiter
            \ start=+\%([^\\]\%(\\\\\)*\\\)\@<!\\(+ end=+)+
            \ contained contains=TOP

" Operators
syn match jqOperator /[-+=:<>]\+/
"syn region jqRange matchgroup=jqSquareBracket start=+\[+ skip=+:+ end=+\]+

" Errors
syn keyword jqError _assign _flatten _modify _nwise _plus _negate _minus _multiply
syn keyword jqError _divide _mod _strindices _equal _notequal _less _greater _lesseq
syn keyword jqError _greatereq _sort_by_impl _group_by_impl _min_by_impl _max_by_impl _match_impl _input
" TODO: these errors should show up when doing def _flatten: as well

" Numbers
syn match jqNumber /\<0[dDfFlL]\?\>/ " Just a bare 0
syn match jqNumber /\<[1-9]\d*[dDfFlL]\?\>/  " A multi-digit number - octal numbers with leading 0's are deprecated in Scala

if !exists('jq_quote_highlight')
    highlight link jqQuote        String
else
    highlight link jqQuote        Type
endif

hi link jqCondtions              Boolean
hi link jqVariables              Identifier
hi link jqNameDefinition         Function
hi link jqTodo                   Todo
hi link jqComment                Comment
hi link jqKeywords               Keyword
hi link jqType                   Type
hi link jqOperator               Operator
hi link jqFunction               Function
hi link jqError                  Error
hi link jqString                 String
hi link jqInterpolationDelimiter Delimiter
"hi link jqStatement              Statement
"hi link jqConditional            Conditional
"hi link jqRepeat                 Repeat
"hi link jqException              Exception
"hi link jqInclude                Include
"hi link jqDecorator              Define
hi link jqNumber                 Number
