function! s:DetectJQ()
    if did_filetype() && &filetype !=# 'conf'
        return
    endif
    if getline(1) =~# '^#!.*\<jq\>'
        set filetype=jq
    endif
endfunction

au BufNewFile,BufRead *.jq,.jqrc*,jqrc set filetype=jq
au BufNewFile,BufRead * call s:DetectJQ()
