" Vim syntax file
" Language: Custom Input Files
" Maintainer: Patrick Greene
" Latest Revision: 25 July 2012

" You must add the line:
"     au BufRead,BufNewFile *.dat setfiletype dat
" to your vimrc file for this file to work

if exists("b:current_syntax")
   finish
endif

setlocal nospell

syn case ignore 


" Error box:
"syn region outErrorBox start="\<*" end="*" contains=outKeywords oneline

" Output box:
"syn region outBoxHead start="/-" end="-\\" contains=outKeywords oneline
"syn region outBoxLine start="\\-" end="-/" contains=outKeywords oneline
"syn match outBoxLine "|"

" Seperator
"syn region outBoxSep start="=" end="=|"me=e-1 oneline
syn region outSimulation 
	 \ start=+<------ Simulation Start :: .* :: Simulation Start ------>+
	 \   end=+<-------- Simulation End :: .* :: Simulation End -------->+
	 \ fold keepend
	 \ contains=ALL


syn region outEnvironInfo 
	 \ start=+<------ Environment Info Start :: .* ------>+
	 \   end=+<------- Environment Info End :: .* ------->+
	 \ fold keepend
	 \ contains=ALL



" Equals sign:
syn match equalsSign " = "



" Integers
syn match inputInteger '\<\d\+\>'
syn match inputInteger '[-+]\d\+\>'



" Float with decimal point and no E or e
syn match inputFloat '\<\d\+\.\d*'
syn match inputFloat '[-+]\d\+\.\d*'

" Float with E and no decimal point
syn match inputFloat '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match inputFloat '\<\d[[:digit:]]*[eE][\-+]\=\d\+'

" Float with E and a decimal point
syn match inputFloat '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match inputFloat '\<\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'



" Double with D or d and no decimal point
syn match inputDouble '[-+]\=\d[[:digit:]]*[dD][\-+]\=\d\+'
syn match inputDouble '\<\d[[:digit:]]*[dD][\-+]\=\d\+'

" Double with D or d and a decimal point
syn match inputDouble '[-+]\=\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'
syn match inputDouble '\<\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'



"hi def link outBoxHead     Type
"hi def link outBoxLine     Type
"hi def link outBoxFoot     Type


hi def link outErrorBox        Float
hi def link outBoxHead     Statement
hi def link outBoxLine     Statement
hi def link outBoxFoot     Statement
hi def link outBoxCentered PreCondit

hi def link outBoxSep    Statement


hi def link inputInteger      Number
hi def link inputFloat        Float
hi def link inputDouble       Float


hi def link equalsSign       Operator


