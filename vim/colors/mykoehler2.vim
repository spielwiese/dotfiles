" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2006 Dec 10

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mykoehler"
hi Normal		  guifg=white  guibg=black
hi Scrollbar	  guifg=darkcyan guibg=cyan
hi Menu			  guifg=black guibg=cyan
hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  guifg=#cc0000
hi NonText		  term=bold  cterm=bold  ctermfg=darkred  gui=bold      guifg=#cc0000
hi Directory	  term=bold  cterm=bold  ctermfg=brown  guifg=#cc8000
hi ErrorMsg		  term=standout  cterm=bold  ctermfg=grey  ctermbg=red  guifg=White  guibg=Red
hi Search		  term=reverse  ctermfg=white  ctermbg=red      guifg=white  guibg=Red
hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=SeaGreen
hi ModeMsg		  term=bold  cterm=bold  gui=bold  guifg=lightgrey	guibg=#555555
hi LineNr		  term=underline  cterm=bold  ctermfg=darkgrey gui=bold	guifg=#555555
hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=Green
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=lightgrey ctermbg=darkgrey gui=bold,italic guifg=black guibg=#555555
hi StatusLineNC   term=reverse	ctermfg=darkgrey ctermbg=darkgrey guifg=#555555 guibg=black
hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold	guifg=red
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkred guifg=Red
hi Cursor		  guifg=bg	guibg=Green
hi Comment		  term=bold  cterm=bold ctermfg=darkblue guifg=#555555 gui=italic
"guifg=#80a0dd "nice blue tone
hi Constant		  term=underline  cterm=bold ctermfg=darkred  guifg=#ffa0a0
hi Special		  term=bold  cterm=bold ctermfg=red  guifg=Red
hi Identifier	  term=underline   ctermfg=brown  guifg=#40bbbb
hi Statement	  term=bold  cterm=bold ctermfg=yellow	gui=bold  guifg=#aaaa11
hi PreProc		  term=underline  ctermfg=darkmagenta   guifg=#ff80ff
hi Type			  term=underline  cterm=bold ctermfg=green  gui=bold  guifg=#60aa40
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black  guifg=Red	guibg=Black
hi Todo			  term=standout  ctermfg=lightgrey	ctermbg=darkgrey  guifg=Blue  guibg=Yellow
hi CursorLine	  term=underline  guibg=#555555 cterm=underline
hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special


hi VertSplit ctermbg=black	ctermfg=darkgrey	guibg=black	guifg=#555555 
hi Folded    				ctermfg=lightgrey 	guibg=#555555 guifg=black
hi FoldColumn   guibg=#555555 guifg=black

