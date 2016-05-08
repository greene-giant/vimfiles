
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


""""""""""""""""""""""""""""""""""""""""
" Pathogen Settings:
""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on





" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

set guioptions+=e
"set showtabline=2

set lines=63
set columns=100

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a




set softtabstop=3
set shiftwidth=3
set noexpandtab

au BufRead,BufNewFile *.input setfiletype input
au BufRead,BufNewFile *.output setfiletype output
au BufRead,BufNewFile *.bibtextype setfiletype bibtextype
au BufRead,BufNewFile *.dat setfiletype dat
au BufRead,BufNewFile *.kv setfiletype kivy


" Turn on syntax folding for output files:
autocmd FileType output setlocal foldmethod=syntax


autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType h setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType kivy setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab


" Pylint settings:
"autocmd FileType python compiler pylint
"let g:pylint_onwrite = 0
"let g:pylint_show_rate = 0
"let g:pylint_cwindow = 0


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

""":colorscheme putty
:colorscheme wombatCustom

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"	 	\ | wincmd p | diffthis
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set colorcolumn=80
set textwidth=0

""""set nowrap
set nolbr
set nobackup
set nowritebackup

if has ('gui_running')
   if has("gui_win32")
      "set guifont=DejaVu_Sans_Mono:h10:cANSI
      set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
   elseif has("gui_macvim")
      set guifont=DejaVu_Sans_Mono_for_Powerline:h14
   elseif has("gui_gtk2")
      set guifont=DejaVu_Sans_Mono_for_Powerline:h10
   endif
endif

"""set antialias
set noantialias



""""""""""""""""""""""""""""""""""""""""
" Autocomplete Settings:
""""""""""""""""""""""""""""""""""""""""
filetype plugin on
set ofu=syntaxcomplete#Complete
set completeopt+=longest
set completeopt-=preview


""" Turn on dictionaries for autocomplete:
set complete+=k

""" Specify dictionsaries:
"set dictionary+=C:\Program Files (x86)\Vim\testDic
"set dictionary+=C:/Program\ Files\ (x86)/Vim/testDic
"set dictionary+=./testDic2
"set dictionary+=C:/Program\ Files\ (x86)/Vim/vimfiles/dictionary

"autocmd FileType python setlocal dictionary+=C:/Program\ Files\ (x86)/Vim/vimfiles/dictionary/python.dict,C:/Program\ Files\ (x86)/Vim/vimfiles/dictionary/kivy.dict

"autocmd FileType kivy setlocal dictionary+=C:/Program\ Files\ (x86)/Vim/vimfiles/dictionary/kivy.dict

""" Windows dictionary:
autocmd FileType python setlocal dictionary+=~/vimfiles/bundle/greenegiant_files/dictionary/python.dict


""" Unix dictionary:
autocmd FileType python setlocal dictionary+=~/.vim/bundle/greenegiant_files/dictionary/python.dict


""""""""""""""""""""""""""""""""""""""""
" Supertab Settings:
""""""""""""""""""""""""""""""""""""""""
""""""let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

""" Always use free format for fortran
:let fortran_free_source=1


""" Case insensitive seach (can use \C and \c to change behavior)
set ignorecase
set smartcase


""" Get rid of .un~ files:
set noundofile


""" Turn on spell check for git commits
autocmd FileType gitcommit setlocal spell spelllang=en_us
autocmd FileType gitcommit normal gg



""" Open the very last fold (this will be the last simulation).
autocmd FileType output normal G zo


""""""""""""""""""""""""""""""""""""""""
" Airline Settings:
""""""""""""""""""""""""""""""""""""""""

""" Need to turn on utf-8 encoding for the powerline symbols to show:
set encoding=utf-8

""" Turn on airline all the time:
set laststatus=2

""" Disable whitespace checking:
let g:airline#extensions#whitespace#enabled = 0

""" Turn on powerline fonts:
let g:airline_powerline_fonts = 1

""" Turn off gitgutter info:
let g:airline#extensions#hunks#enabled = 0




""""""""""""""""""""""""""""""""""""""""
" Tagbar Settings:
""""""""""""""""""""""""""""""""""""""""

""" Increase the window size when opening tagbar:
let g:tagbar_expand = 1

""" Map "TagbarToggle" to F8:
nmap <F8> :TagbarToggle<CR>




""""""""""""""""""""""""""""""""""""""""
" GitGutter Settings:
""""""""""""""""""""""""""""""""""""""""

""" Increase max signs:
let g:gitgutter_max_signs = 1000



""""""""""""""""""""""""""""""""""""""""
" Unite Settings:
""""""""""""""""""""""""""""""""""""""""

""" yank history:
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>


""" file search (async needs vimproc):
nnoremap <space>f :Unite -start-insert file<cr>

"(async needs vimproc):
"nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>rf :Unite -start-insert file_rec<cr>


""" grep searching (needs vimproc):
"nnoremap <space>/ :Unite grep:.<cr>



""""""""""""""""""""""""""""""""""""""""
" Indent Guide Settings: (REMOVED)
""""""""""""""""""""""""""""""""""""""""

"""" Turn on at start:
"""let g:indent_guides_enable_on_vim_startup = 1
"""
"""" Set the guide size to 1:
"""let g:indent_guides_guide_size = 1
"""
"""" Start at level 2:
"""let g:indent_guides_start_level = 2
"""
"""" Turn off the auto color:
"""let g:indent_guides_auto_colors = 0


""""""""""""""""""""""""""""""""""""""""
" IndentLine Settings:
""""""""""""""""""""""""""""""""""""""""

" Add indentation lines for cpp files:
autocmd FileType cpp setlocal list lcs=tab:\|\ 
autocmd FileType h setlocal list lcs=tab:\|\ 
"set list lcs=tab:\|\ 

