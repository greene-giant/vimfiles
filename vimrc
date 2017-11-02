
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






au BufRead,BufNewFile *.input setfiletype input
au BufRead,BufNewFile *.output setfiletype output
au BufRead,BufNewFile *.bibtextype setfiletype bibtextype
au BufRead,BufNewFile *.dat setfiletype dat
au BufRead,BufNewFile *.kv setfiletype kivy


" Turn on syntax folding for output files:
autocmd FileType output setlocal foldmethod=syntax


" Tab settings:
set softtabstop=3
set shiftwidth=3
set noexpandtab

autocmd FileType cpp	setlocal shiftwidth=3 tabstop=3 softtabstop=3 expandtab
autocmd FileType h	setlocal shiftwidth=3 tabstop=3 softtabstop=3 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType kivy	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType tex	setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType cmake  setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType xml    setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


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
colorscheme wombatCustom

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"	 	\ | wincmd p | diffthis
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin



set colorcolumn=80
set textwidth=0

" Disable line breaking:
set nolbr

" Disbale backup files:
set nobackup
set nowritebackup


if has ('gui_running')
   if has("gui_win32")
      "set guifont=DejaVu_Sans_Mono:h10:cANSI
      set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
   elseif has("gui_macvim")
      set guifont=DejaVu_Sans_Mono_for_Powerline:h14
      set lines=75
   elseif has("gui_gtk2")
      set guifont=DejaVu_Sans_Mono_for_Powerline:h10
   endif

   " Turn off the bells!
   set noerrorbells
   autocmd GUIEnter * set vb t_vb=
endif

" Turn off antialiasing:
set noantialias


" Allow the creation of a new buffer while there are edits in the current one:
set hidden


""""""""""""""""""""""""""""""""""""""""
" File Autocomplete Settings:
""""""""""""""""""""""""""""""""""""""""
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.a,*.o


""""""""""""""""""""""""""""""""""""""""
" Autocomplete Settings:
""""""""""""""""""""""""""""""""""""""""
filetype plugin on
set ofu=syntaxcomplete#Complete
set completeopt+=longest
set completeopt-=preview


""" Turn on dictionaries for autocomplete:
set complete+=k

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
let fortran_free_source=1


""" Case insensitive seach (can use \C and \c to change behavior)
set ignorecase
set smartcase


""" Get rid of .un~ files:
set noundofile


""" Turn on spell check for git commits
autocmd FileType gitcommit setlocal spell spelllang=en_us
"autocmd FileType gitcommit normal gg
autocmd FileType gitcommit normal :1



""" Open the very last fold (this will be the last simulation).
autocmd FileType output normal G zo



" Disable silly LaTeX typesetting
let g:tex_conceal = ""



""""""""""""""""""""""""""""""""""""""""
" Diff Settings:
""""""""""""""""""""""""""""""""""""""""

""" Hide the fold column:
set diffopt=foldcolumn:0
 

if &diff
   """ Double the width:
   let &columns = &columns*3


   """ Remove color column:
   set colorcolumn=


   """ New shortcuts:
   nnoremap <space><Left> :diffg LO<cr>
   nnoremap <space><Up> :diffg BA<cr>
   nnoremap <space><Right> :diffg REMOTE<cr>

   """ Fix for 'Cannot read or write temp files'
   if has("gui_win32")
      set shell=C:\Windows\System32\cmd.exe
   endif

   """ Turn off syntax highlighting to make changes easier to see:
   syntax off
endif




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



""" Turn on smarter tab line (to see buffers) sdgfgf:
let g:airline#extensions#tabline#enabled = 1

""" Show the buffer number:
let g:airline#extensions#tabline#buffer_nr_show = 1

""" Only show the buffer line for more than one buffer:
let g:airline#extensions#tabline#buffer_min_count = 2




""""""""""""""""""""""""""""""""""""""""
" Tagbar Settings: (REMOVED)
""""""""""""""""""""""""""""""""""""""""

"""" Increase the window size when opening tagbar:
"let g:tagbar_expand = 1
"
"""" Map "TagbarToggle" to F8:
"nmap <F8> :TagbarToggle<CR>




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


""" buffer:
nnoremap <space>b :Unite -quick-match buffer<cr>


""" file search (async needs vimproc):
nnoremap <space>f :Unite -start-insert file<cr>

""" recursive file search (async needs vimproc):
nnoremap <space>rf :Unite -start-insert file_rec<cr>
"nnoremap <space>rf :Unite -start-insert file_rec/async<cr>


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
" Tag Jumping Settings:
""""""""""""""""""""""""""""""""""""""""
" Requires exuberant ctags http://ctags.sourceforge.net/

" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/


" Change the shortcuts for tag jumping:
" Ctrl+] :: Provide list of tags, then jump
" Ctrl+\ :: Return to previous location
map <C-]> :exec("tjump ".expand("<cword>"))<CR>
map <C-\> <C-t>
"map <C-[> <C-t> " Very bad idea, this is the same as esc!

" Open in new vertical tab:
map <C-\> :vsp split<CR>:exec("tag ".expand("<cword>"))<CR>


""""""""""""""""""""""""""""""""""""""""
" IndentLine Settings:
""""""""""""""""""""""""""""""""""""""""

" Add indentation lines for cpp files:
autocmd FileType cpp setlocal list lcs=tab:\|\ 
autocmd FileType h setlocal list lcs=tab:\|\ 

" Exclude csv files:
let g:indentLine_fileTypeExclude = ['csv']



"""""""""""""""""""""""""""""""""""""""""
" Colorizer Settings:
""""""""""""""""""""""""""""""""""""""""

" Turn on colors for vim files:
"let g:colorizer_auto_filetype='vim' (this can cause slow down and lag)

" Turn off colorizer for comments:
let g:colorizer_skip_comments = 1


"""""""""""""""""""""""""""""""""""""""""
" CSV Settings:
""""""""""""""""""""""""""""""""""""""""

" Don't hide the commas:
let g:csv_no_conceal = 1

" Turn off CSV for dat files:
augroup filetypedetect
  au! BufRead,BufNewFile *.dat    setfiletype dat
augroup END

" Have airline display the variable name:
let g:airline#extensions#csv#column_display = 'Name'

" Disable colorcolumn for csv files:
au FileType csv setlocal colorcolumn=

