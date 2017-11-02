" Maintainer:	GreeneGiant
" Last Change:	Aug 10 2016
" Use :hi to preview all the highlighting settings

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombatCustom"


" Vim >= 7.0 specific colors:
if version >= 700
  hi CursorLine	     guifg=NONE guibg=#2d2d2d
  hi CursorColumn    guifg=NONE guibg=#2d2d2d
  hi MatchParen	     guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 	     guifg=#f6f3e8 guibg=#444444
  hi PmenuSel	     guifg=#000000 guibg=#cae682
endif



""" General Colors:
hi Cursor 		guifg=#242424 guibg=#8ac6f2 gui=none
hi Normal 		guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#857b6f guibg=#303030 gui=none
hi StatusLine		guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC		guifg=#857b6f guibg=#444444 gui=none
hi VertSplit		guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
"hi Title		guifg=#f6f3e8 guibg=NONE    gui=bold " Defined below in tjump
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
"hi SpecialKey		guifg=#808080 guibg=#343434 gui=none
"
" Changing SpecialKey for the indent guides. Need to look for unintented
" changes.
hi SpecialKey		guifg=#808080 guibg=#242424 gui=none
hi ColorColumn		guifg=NONE guibg=black





""" Spelling:
hi SpellBad guifg=#FEBFEF
hi SpellCap guifg=#AA80FE




""" Search Results:
hi Search guifg=#242424 guibg=#cae682



""" Tjump:
""" Also affects some other things
hi Directory  guifg=#8ac6f2 gui=none
hi ModeMsg    guifg=#AA80FE gui=bold
hi Title      guifg=#cae682 gui=bold




""" CSV:
"hi CSVHeaderLine
hi CSVColumnHeaderOdd  guifg=#242424 guibg=#cae682 gui=bold
hi CSVColumnHeaderEven guifg=#242424 guibg=#8ac6f2 gui=bold
hi CSVColumnOdd        guifg=#cae682
hi CSVColumnEven       guifg=#8ac6f2

 

""" Error Messages:
hi ErrorMsg   guifg=#242424 guibg=#e5786d gui=bold
hi Error      guifg=#242424 guibg=#e5786d gui=bold
hi WarningMsg guifg=#e5786d



""" Diff:
hi DiffAdd      guifg=#cae682  guibg=#303030
hi DiffChange   guifg=#8ac6f2  guibg=#303030
hi DiffDelete   guifg=#e5786d  guibg=#303030
hi DiffText     guifg=#AA80FE  guibg=#303030  gui=bold





""" Syntax Highlighting:
"""hi Comment 		guifg=#99968b gui=italic
hi Comment 		guifg=#99968b gui=none
hi Todo 		guifg=#f6f3e8 guibg=#AA80FE gui=none

"""
hi Constant		guifg=#e5786d gui=italic

""" duh?
hi String 		guifg=#95e454 gui=none

"""
hi Identifier		guifg=#cae682 gui=none

""" call, cpu_time, trim, dble
hi Function	     	guifg=#cae682 gui=none

""" implicit none, integer, real, dimension, type,
hi Type 		guifg=#cae682 gui=none

"""
hi Special		guifg=#e7f6da gui=none

""" #include, #if, etc...
hi PreProc 		guifg=#FF6600 gui=none

""" do, if
hi Statement		guifg=#8ac6f2 gui=none

""" write, format, open, allocate, &
hi Keyword		guifg=#FEDFBF gui=none
hi Operator		guifg=#FEDFBF gui=none

""" numbers
hi Number		guifg=#FEBFEF gui=none
hi Float		guifg=#e5786d gui=none

""" subroutine, program, module, use
hi PreCondit		guifg=#AA80FE gui=bold


hi openMP		guifg=#c76181 gui=none

hi self	         	guifg=#AA80FE gui=none



""" Gitgutter Colors:
hi GitGutterAdd		   guifg=#cae682  guibg=#303030
hi GitGutterChange	   guifg=#8ac6f2  guibg=#303030
hi GitGutterDelete	   guifg=#e5786d  guibg=#303030
hi GitGutterChangeDelete   guifg=#FEDFBF  guibg=#303030
""" This didn't work. Had to change LineNr instead.
"""hi SignColumn		   guifg=#303030  guibg=#303030




""" EasyTags Highlighting:
hi cTypeTag  guifg=#cae682 gui=bold
hi cEnumTag  guifg=#cae682 gui=bold
hi cPreProcTag  guifg=#cae682 gui=bold
hi cFunctionTag  guifg=#8ac6f2 gui=bold


""" File Tab Autocomplete:
hi wildmenu   guifg=#242424  guibg=#8ac6f2 gui=none




""" Normal Text 246, 243, 232
""" Normal BG 36, 36, 36
""" String 149, 228, 84
""" light green 202, 230, 130
""" blue 138, 198, 242
""" red 229, 120, 109
""" light violet 254, 191, 239
""" tan 254, 223, 191
""" orange 255, 102, 0
""" comment 153, 150, 139

