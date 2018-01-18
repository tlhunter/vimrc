" WEREWOLF
"" version 1.2.1
"" changes your colorscheme depending on the time of day
"" by Jonathan Stoler

let g:werewolf_day_themes = get(g:, 'werewolf_day_themes', [])
let g:werewolf_night_themes = get(g:, 'werewolf_night_themes', [])
let g:werewolf_day_start = get(g:, 'werewolf_day_start', 8)
let g:werewolf_day_end = get(g:, 'werewolf_day_end', 20)
let g:werewolf_change_automatically = get(g:, 'werewolf_change_automatically', 1)

let s:werewolf_autocmd_allowed = 0

function! Werewolf()
	if strftime("%H") >= g:werewolf_day_start && strftime("%H") < g:werewolf_day_end
		call Werewolf#transform(g:werewolf_night_themes, g:werewolf_day_themes)
	else
		call Werewolf#transform(g:werewolf_day_themes, g:werewolf_night_themes)
	endif
endfunction

function! Werewolf#transform(current, switch)
	let i = 0
	while i < len(a:current)
		if g:colors_name ==# a:current[i]
			execute "colorscheme " . a:switch[i]
			" if we don't do this check, Werewolf's own ColorScheme autocmd will
			" run infinitely; this limits when it happens
			if s:werewolf_autocmd_allowed
				doau ColorScheme Werewolf
				let s:werewolf_autocmd_allowed = 0
			endif
			return
		endif
		let i += 1
	endwhile
endfunction

function! WerewolfToggle()
	call Werewolf#colorschemeChanged()
endfunction

function! Werewolf#colorschemeChanged()
	let s:werewolf_autocmd_allowed = 0
	call Werewolf#transform(g:werewolf_day_themes + g:werewolf_night_themes, g:werewolf_night_themes + g:werewolf_day_themes)
endfunction

function! Werewolf#autoChange()
	if g:werewolf_change_automatically
		let s:werewolf_autocmd_allowed = 1
		call Werewolf()
	endif
endfunction

command! WerewolfTransform call Werewolf()
command! WerewolfToggle call WerewolfToggle()
command! -bang WerewolfAuto let g:werewolf_change_automatically = <bang>g:werewolf_change_automatically
command! WerewolfOn let g:werewolf_change_automatically = 0
command! WerewolfOff let g:werewolf_change_automatically = 1
command! -nargs=1 WerewolfStart let g:werewolf_day_start = <args>
command! -nargs=1 WerewolfEnd let g:werewolf_day_end = <args>

augroup werewolf
	autocmd!
	autocmd ColorScheme * nested call Werewolf#colorschemeChanged()
	autocmd CursorMoved,CursorHold,CursorHoldI,WinEnter,WinLeave,FocusLost,FocusGained,VimResized,ShellCmdPost * nested call Werewolf#autoChange()
augroup END
