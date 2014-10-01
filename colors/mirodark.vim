" Vim Color File
"
" Name:        mirodark
" Version:     0.5
" Last Change: 11-16-2013
" Maintainer:  Jerome Castaneda <djjcast@gmail.com>
" URL:         https://github.com/djjcast/mirodark
"
" About:       mirodark extends Jason W Ryan's miromiro(1) Vim color file with gVim, Linux console,
"              xterm-88color, and xterm-256color support. mirodark uses Jason W Ryan's dark(2)
"              terminal color scheme colors. mirodark uses Henry So, Jr.'s desert256(3) color
"              approximation functions.
"
"              1) https://bitbucket.org/jasonwryan/eeepc/src/40f27908ce98/.vim/colors/miromiro.vim
"              2) https://bitbucket.org/jasonwryan/eeepc/src/40f27908ce98/.colours/dark
"              3) http://www.vim.org/scripts/script.php?script_id=1243

" Usage {{{
"
" Installation:
"
" 1) Add mirodark.vim to your ~/.vim/colors directory.
" 2) Add the following to your ~/.vimrc file:
"
"     syntax on
"     colorscheme mirodark
"
" Terminal Support:
"
" mirodark uses color approximation functions to support xterm-88color and xterm-256color. If you
" are not using xterm-88color or xterm-256color, then follow these instructions to set up your
" terminal to use mirodark's color scheme. Also, if you are using xterm-88color or xterm-256color
" but you want your terminal to use mirodark's color scheme, then follow these instructions.
"
" 1) If you are using a terminal that sets its color settings based on your ~/.Xresources file, like
"    xterm or rxvt-unicode, then add the following to your ~/.Xresources file. If you are not using
"    a terminal that sets its color settings based on your ~/.Xresources file, like gnome-terminal
"    or konsole, then set its color settings to the following color values manually.
"
"     !
"     ! Terminal Color Scheme: dark
"     !
"     ! Maintainer: Jason W Ryan <http://jasonwryan.com/>
"     !
"     ! higher contrast background
"     !*background: #000000
"     *background: #121212
"     *foreground: #999999
"     ! black dark/light
"     ! higher contrast black dark/light
"     !*color0:     #121212
"     !*color8:     #3d3d3d
"     *color0:     #3d3d3d
"     *color8:     #5e5e5e
"     ! red dark/light
"     *color1:     #8a2f58
"     *color9:     #cf4f88
"     ! green dark/light
"     *color2:     #287373
"     *color10:    #53a6a6
"     ! yellow dark/light
"     *color3:     #914e89
"     *color11:    #bf85cc
"     ! blue dark/light
"     *color4:     #395573
"     *color12:    #4779b3
"     ! magenta dark/light
"     *color5:     #5e468c
"     *color13:    #7f62b3
"     ! cyan dark/light
"     *color6:     #2b7694
"     *color14:    #47959e
"     ! white dark/light
"     *color7:     #899ca1
"     *color15:    #c0c0c0
"
" 2) If you are using xterm-88color or xterm-256color, then add the following to your ~/.vimrc file,
"    before 'colorscheme mirodark':
"
"     let g:mirodark_disable_color_approximation=1
"
" Linux Console Support:
"
" 1) Add the following to your ~/.bashrc file:
"
"     #
"     # Linux Console Color Scheme: dark
"     #
"     # Maintainer: Jason W Ryan <http://jasonwryan.com/>
"     #
"     if [[ $TERM == "linux" ]]; then
"         echo -en "\033]P0000000" # black
"         echo -en "\033]P85e5e5e" # darkgray
"         echo -en "\033]P18a2f58" # darkred
"         echo -en "\033]P9cf4f88" # lightred
"         echo -en "\033]P2287373" # darkgreen
"         echo -en "\033]Pa53a6a6" # lightgreen
"         echo -en "\033]P3914e89" # darkyellow
"         echo -en "\033]Pbbf85cc" # lightyellow
"         echo -en "\033]P4395573" # darkblue
"         echo -en "\033]Pc4779b3" # lightblue
"         echo -en "\033]P55e468c" # darkmagenta
"         echo -en "\033]Pd7f62b3" # lightmagenta
"         echo -en "\033]P62b7694" # darkcyan
"         echo -en "\033]Pe47959e" # lightcyan
"         echo -en "\033]P7899ca1" # lightgray
"         echo -en "\033]Pfc0c0c0" # white
"     fi
"
" Enable Higher Contrast Mode:
"
" NOTE: Enabling Higher Contrast Mode only affects mirodark in xterm-256color and xterm-88color,
"       assuming you did not disable color approximation, and gVim.
"
" 1) Add the following to your ~/.vimrc file, before 'colorscheme mirodark':
"
"     let g:mirodark_enable_higher_contrast_mode=1
"
" 2) If you want to easily toggle Higher Contrast Mode on and off, then add the following to your
"    ~/.vimrc file:
"
"     nnoremap <Leader>m :MirodarkToggleHigherContrastMode<CR>
" }}}

" higher contrast mode toggle function {{{
if !exists("g:loaded_mirodark")
    fun! s:toggle_higher_contrast_mode()
        if exists("g:mirodark_enable_higher_contrast_mode")
            unlet g:mirodark_enable_higher_contrast_mode
        else
            let g:mirodark_enable_higher_contrast_mode=1
        endif

        colorscheme mirodark
    endfun

    command! -nargs=0 MirodarkToggleHigherContrastMode  call s:toggle_higher_contrast_mode()

    let g:loaded_mirodark=1
endif
" }}}

" color approximation functions {{{
"
" desert256 Color Approximation Functions
"
" Maintainer: Henry So, Jr. <henryso@panix.com>
"
if !has("gui_running") &&
            \ ((&t_Co == 88 || &t_Co == 256) && !exists("g:mirodark_disable_color_approximation"))
    " returns an approximate grey index for the given grey level
    fun! s:grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun! s:grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun! s:grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun! s:rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun! s:rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun! s:rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun! s:color(r, g, b)
        " get the closest grey
        let l:gx = s:grey_number(a:r)
        let l:gy = s:grey_number(a:g)
        let l:gz = s:grey_number(a:b)

        " get the closest color
        let l:x = s:rgb_number(a:r)
        let l:y = s:rgb_number(a:g)
        let l:z = s:rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = s:grey_level(l:gx) - a:r
            let l:dgg = s:grey_level(l:gy) - a:g
            let l:dgb = s:grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = s:rgb_level(l:gx) - a:r
            let l:dg = s:rgb_level(l:gy) - a:g
            let l:db = s:rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return s:grey_color(l:gx)
            else
                " use the color
                return s:rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return s:rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun! s:rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

        return s:color(l:r, l:g, l:b)
    endfun
endif
" }}}

" color scheme initialization {{{
set background=dark
hi clear
if exists("syntax on")
    syntax reset
endif
let colors_name="mirodark"
" }}}

" color scheme variables {{{
if has("gui_running") ||
            \ ((&t_Co == 88 || &t_Co == 256) && !exists("g:mirodark_disable_color_approximation"))
    if !exists("g:mirodark_enable_higher_contrast_mode")
        let s:conf_bclr_hex="121212" " configuration-based background color hexadecimal
        let s:conf_dblk_hex="3d3d3d" " configuration-based dark black hexadecimal
        let s:conf_lblk_hex="5e5e5e" " configuration-based light black hexadecimal
    else
        let s:conf_bclr_hex="000000"
        let s:conf_dblk_hex="121212"
        let s:conf_lblk_hex="3d3d3d"
    endif

    let s:bclr_hex=s:conf_bclr_hex " background color hexadecimal
    let s:fclr_hex="999999"        " foreground color hexadecimal
    let s:dblk_hex=s:conf_dblk_hex " dark black hexadecimal    (color 0)
    let s:lblk_hex=s:conf_lblk_hex " light black hexadecimal   (color 8)
    let s:dred_hex="8a2f58"        " dark red hexadecimal      (color 1)
    let s:lred_hex="cf4f88"        " light red hexadecimal     (color 9)
    let s:dgrn_hex="287373"        " dark green hexadecimal    (color 2)
    let s:lgrn_hex="53a6a6"        " light green hexadecimal   (color 10)
    let s:dylw_hex="914e89"        " dark yellow hexadecimal   (color 3)
    let s:lylw_hex="bf85cc"        " light yellow hexadecimal  (color 11)
    let s:dblu_hex="395573"        " dark blue hexadecimal     (color 4)
    let s:lblu_hex="4779b3"        " light blue hexadecimal    (color 12)
    let s:dmag_hex="5e468c"        " dark magentahexadecimal   (color 5)
    let s:lmag_hex="7f62b3"        " light magenta hexadecimal (color 13)
    let s:dcyn_hex="2b7694"        " dark cyan hexadecimal     (color 6)
    let s:lcyn_hex="47959e"        " light cyan hexadecimal    (color 14)
    let s:dwht_hex="899ca1"        " dark white hexadecimal    (color 7)
    let s:lwht_hex="c0c0c0"        " light white hexadecimal   (color 15)
    let s:culc_hex="272727"        " cursor line/column hexadecimal

    if has("gui_running")
        let s:venv="gui" " vim environment (term, cterm, gui)
        let s:bclr="#".s:bclr_hex
        let s:fclr="#".s:fclr_hex
        let s:dblk="#".s:dblk_hex
        let s:lblk="#".s:lblk_hex
        let s:dred="#".s:dred_hex
        let s:lred="#".s:lred_hex
        let s:dgrn="#".s:dgrn_hex
        let s:lgrn="#".s:lgrn_hex
        let s:dylw="#".s:dylw_hex
        let s:lylw="#".s:lylw_hex
        let s:dblu="#".s:dblu_hex
        let s:lblu="#".s:lblu_hex
        let s:dmag="#".s:dmag_hex
        let s:lmag="#".s:lmag_hex
        let s:dcyn="#".s:dcyn_hex
        let s:lcyn="#".s:lcyn_hex
        let s:dwht="#".s:dwht_hex
        let s:lwht="#".s:lwht_hex
        let s:culc="#".s:culc_hex
    else
        let s:venv="cterm"
        let s:bclr=s:rgb(s:bclr_hex)
        let s:fclr=s:rgb(s:fclr_hex)
        let s:dblk=s:rgb(s:dblk_hex)
        let s:lblk=s:rgb(s:lblk_hex)
        let s:dred=s:rgb(s:dred_hex)
        let s:lred=s:rgb(s:lred_hex)
        let s:dgrn=s:rgb(s:dgrn_hex)
        let s:lgrn=s:rgb(s:lgrn_hex)
        let s:dylw=s:rgb(s:dylw_hex)
        let s:lylw=s:rgb(s:lylw_hex)
        let s:dblu=s:rgb(s:dblu_hex)
        let s:lblu=s:rgb(s:lblu_hex)
        let s:dmag=s:rgb(s:dmag_hex)
        let s:lmag=s:rgb(s:lmag_hex)
        let s:dcyn=s:rgb(s:dcyn_hex)
        let s:lcyn=s:rgb(s:lcyn_hex)
        let s:dwht=s:rgb(s:dwht_hex)
        let s:lwht=s:rgb(s:lwht_hex)
        let s:culc=s:rgb(s:culc_hex)
    endif
elseif $TERM == "linux"
    let s:venv="cterm"
    let s:bclr=""
    let s:fclr=""
    let s:dblk="Black"
    let s:lblk="DarkGray"
    let s:dred="DarkRed"
    let s:lred="LightRed"
    let s:dgrn="DarkGreen"
    let s:lgrn="LightGreen"
    let s:dylw="DarkYellow"
    let s:lylw="LightYellow"
    let s:dblu="DarkBlue"
    let s:lblu="LightBlue"
    let s:dmag="DarkMagenta"
    let s:lmag="LightMagenta"
    let s:dcyn="DarkCyan"
    let s:lcyn="LightCyan"
    let s:dwht="LightGray"
    let s:lwht="White"
    let s:culc=s:dblk
else
    let s:venv="cterm"
    let s:bclr=""
    let s:fclr=""
    let s:dblk="0"
    let s:lblk="8"
    let s:dred="1"
    let s:lred="9"
    let s:dgrn="2"
    let s:lgrn="10"
    let s:dylw="3"
    let s:lylw="11"
    let s:dblu="4"
    let s:lblu="12"
    let s:dmag="5"
    let s:lmag="13"
    let s:dcyn="6"
    let s:lcyn="14"
    let s:dwht="7"
    let s:lwht="15"
    let s:culc=s:dblk
endif
" }}}

" highlight wrapper function {{{
fun! s:HI(group, bg, fg, attr)
    exec "hi" a:group
                \ . " " . (a:bg   != "" ? s:venv . "bg=" . a:bg   : "")
                \ . " " . (a:fg   != "" ? s:venv . "fg=" . a:fg   : "")
                \ . " " . (a:attr != "" ? s:venv . "="   . a:attr : "")
endfun
" }}}

" normal colors {{{
call s:HI(         "Normal", s:bclr, s:lwht,     "" )
call s:HI(         "Ignore",     "", s:lblk,     "" )
call s:HI(        "Comment",     "", s:dwht,     "" )
call s:HI(         "LineNr",     "", s:lblk,     "" )
call s:HI(          "Float",     "", s:dylw,     "" )
call s:HI(        "Include",     "", s:dmag,     "" )
call s:HI(         "Define",     "", s:dgrn,     "" )
call s:HI(          "Macro",     "", s:lmag,     "" )
call s:HI(        "PreProc",     "", s:lgrn,     "" )
call s:HI(      "PreCondit",     "", s:lmag,     "" )
call s:HI(        "NonText",     "", s:dcyn,     "" )
call s:HI(      "Directory",     "", s:dcyn,     "" )
call s:HI(     "SpecialKey",     "", s:lylw,     "" )
call s:HI(           "Type",     "", s:dcyn,     "" )
call s:HI(         "String",     "", s:dgrn,     "" )
call s:HI(       "Constant",     "", s:lmag,     "" )
call s:HI(        "Special",     "", s:lgrn,     "" )
call s:HI(    "SpecialChar",     "", s:lred,     "" )
call s:HI(         "Number",     "", s:lcyn,     "" )
call s:HI(     "Identifier",     "", s:lmag,     "" )
call s:HI(    "Conditional",     "", s:lcyn,     "" )
call s:HI(         "Repeat",     "", s:lred,     "" )
call s:HI(      "Statement",     "", s:dblu,     "" )
call s:HI(          "Label",     "", s:lmag,     "" )
call s:HI(       "Operator",     "", s:dylw,     "" )
call s:HI(        "Keyword",     "", s:lred,     "" )
call s:HI(   "StorageClass",     "", s:lylw,     "" )
call s:HI(      "Structure",     "", s:dmag,     "" )
call s:HI(        "Typedef",     "", s:dcyn,     "" )
call s:HI(       "Function",     "", s:lylw,     "" )
call s:HI(      "Exception",     "", s:dred,     "" )
call s:HI(     "Underlined",     "", s:dblu,     "" )
call s:HI(          "Title",     "", s:dylw,     "" )
call s:HI(            "Tag",     "", s:lylw,     "" )
call s:HI(      "Delimiter",     "", s:lblu,     "" )
call s:HI( "SpecialComment",     "", s:lred,     "" )
call s:HI(        "Boolean",     "", s:dylw,     "" )
call s:HI(           "Todo", "NONE", s:lred,     "" )
call s:HI(        "MoreMsg", "NONE", s:lmag,     "" )
call s:HI(        "ModeMsg", "NONE", s:lmag,     "" )
call s:HI(          "Debug", "NONE", s:dred,     "" )
call s:HI(     "MatchParen", s:dwht, s:dblk,     "" )
call s:HI(       "ErrorMsg", "NONE", s:dred,     "" )
call s:HI(       "WildMenu", s:lwht, s:dmag,     "" )
call s:HI(         "Folded", s:dblk, s:dwht,     "" )
call s:HI(         "Search", s:lwht, s:dred,     "" )
call s:HI(      "IncSearch", s:lwht, s:dred,     "" )
call s:HI(     "WarningMsg", s:lwht, s:dred,     "" )
call s:HI(       "Question", s:lwht, s:lgrn,     "" )
call s:HI(          "Pmenu", s:lwht, s:dgrn,     "" )
call s:HI(       "PmenuSel", s:lwht, s:dred,     "" )
call s:HI(         "Visual", s:lwht, s:lblk,     "" )
call s:HI(     "StatusLine", s:dblk, s:dwht, "none" )
call s:HI(   "StatusLineNC", s:lblk, s:dblk,     "" )
call s:HI(      "VertSplit", s:lblk, s:dblk,     "" )
call s:HI(        "TabLine", s:dblk, s:dwht,     "" )
call s:HI(    "TabLineFill",     "", s:dblk,     "" )
call s:HI(     "TabLineSel", s:dblk, s:dwht,     "" )
call s:HI(         "Cursor", s:lred,     "",     "" )
call s:HI(     "CursorLine", s:culc,     "", "none" )
call s:HI(   "CursorLineNr", s:culc, s:dwht, "none" )
call s:HI(   "CursorColumn", s:culc,     "",     "" )
call s:HI(    "ColorColumn", s:culc,     "",     "" )
call s:HI(     "FoldColumn", "NONE", s:lblk,     "" )
call s:HI(     "SignColumn", "NONE",     "",     "" )
" }}}

" vimscript colors {{{
call s:HI( "vimCommentTitle",     "", s:lgrn, "" )
call s:HI(         "vimFold", s:lwht, s:dblk, "" )
" }}}

" help file colors {{{
call s:HI( "helpHyperTextJump", "", s:lylw, "" )
" }}}

" javascript colors {{{
call s:HI( "javaScriptNumber", "", s:lylw, "" )
" }}}

" html colors {{{
call s:HI(     "htmlTag", "", s:dcyn, "" )
call s:HI(  "htmlEndTag", "", s:dcyn, "" )
call s:HI( "htmlTagName", "", s:lylw, "" )
" }}}

" perl colors {{{
call s:HI(        "perlSharpBang", "", s:lgrn, "standout" )
call s:HI(        "perlStatement", "", s:lmag,         "" )
call s:HI( "perlStatementStorage", "", s:dred,         "" )
call s:HI(         "perlVarPlain", "", s:dylw,         "" )
call s:HI(        "perlVarPlain2", "", s:lylw,         "" )
" }}}

" ruby colors {{{
call s:HI( "rubySharpBang", "", s:lgrn, "standout" )
" }}}

" diff colors {{{
call s:HI(    "diffLine", "", s:lgrn, "" )
call s:HI( "diffOldLine", "", s:dgrn, "" )
call s:HI( "diffOldFile", "", s:dgrn, "" )
call s:HI( "diffNewFile", "", s:dgrn, "" )
call s:HI(   "diffAdded", "", s:dblu, "" )
call s:HI( "diffRemoved", "", s:dred, "" )
call s:HI( "diffChanged", "", s:dcyn, "" )
" }}}

" spell checking colors {{{
if has("spell")
    hi clear SpellBad
    hi clear SpellCap
    hi clear SpellRare
    hi clear SpellLocal
    call s:HI(   "SpellBad", "", "", "underline" )
    call s:HI(   "SpellCap", "", "", "underline" )
    call s:HI(  "SpellRare", "", "", "underline" )
    call s:HI( "SpellLocal", "", "", "underline" )
endif
" }}}

" syntastic colors {{{
call s:HI(   "SyntasticErrorSign", s:culc, s:lred, "" )
call s:HI( "SyntasticWarningSign", s:culc, s:lmag, "" )
" }}}

" vim: foldenable foldmethod=marker foldmarker={{{,}}} foldlevel=0:
