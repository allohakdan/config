"Dan Brooks
"
source /usr/share/vim/vimrc
" Add our plugins directory to vims runtimepath
let &runtimepath.=',~/.dan/.vim'

" let g:loaded_tagbar = 1
" let g:loaded_fugitive = 1
" let g:loaded_syntastic_plugin = 1
let g:loaded_supertab = 1
" let g:loaded_gitgutter = 1
" let g:loaded_taglist = 1
" let g:loaded_nerd_tree = 1
" let g:loaded_minibufexplorer = 1
" let g:loaded_gnupg = 1
" let g:loaded_diffchanges = 1
let uname = substitute(system("uname"),"\n","","g")
"v16
"For use with the MiniBufExplorer, Taglist, Diffchanges, GnuPG, and NERDTree plugins 
"
"USAGE: Place in your home directory as '.vimrc'. You also need to create a '.vimbkup' folder in your home directory for storing temporary files and backup files. Read through add enable or disable whatever you like.  
"
"FUNCTION KEYS
"F2 - Open a file in a new tab
"F3 - Open a new blank tab
"F4 - Close current tab
"F5 - Toggle Explorer
"F6 - Toggle Taglist
"F9 - Fold { to }
"
"Shortcuts defined in this file
"~Commenting~
",cc    add comment to line
",cu    remove comment from line
"
"Nice Shortcut keys in normal mode to remember
"~      swaps uppercase and lowercase letter below the cursor
"==     indents current line to match the line above it
"x      deletes character below cursor
"r      type r plus any other character to rename that character
"C^w    this plus hjkl direction switch between buffers
"       this plus shift hjkl move buffers around on screen
"$      go to end (->) of current line
"0      go to beginng of current line
"zz     move current line to middle of buffer window
"H      move cursor to top line
"L      move curosr to bottom line
"M      move cursor to middle of screen
"--- SEARCHING ---
"#      search for word below cursor upward
"*      search for word below cursor downward
"/      search forward for pattern
"?      search backward for pattern
"%s/find/replace
"--- FOLDING --- (when set to manual mode)
"zf     folding...can be used in visual mode on selected text -or-
"zf%    place cursor on '{' when using this to fold until matching '}'
"zo     open a fold
"zc     close a fold
"ce     delete to end of current word and start insert mode
"
"--- QuickFix ---
"(after :grep or :make)
":cw    quickfix window
":cn    next item


"Change Log
"v1  - added color printing (when available)
"v2  - added new middle button control (no accidental clicking during scrolling
"v3  - added support for taglist plugin (F8 key mapping)
"v4  - added tab Function Key support
"v5  - added better support for folding (clicking on the side + syntax folding)
"    - added F9 button to fold { to }
"v6  - added support for miniBufExplorer
"v7  - added c function description block comments
"v7.1 c function description block sets you up to type where you want now
"v8  - added status line highlighting
"v9  - added change directory to location of current file 
"v10 - added smartHome and smartEnd
"v11 - added mouse support for using vim inside of screen
"v12 - no changes to vimrc - added diffchanges.vim config file
"v13 - added longline highlighting, changed tabs to spaces...
"v14 - fixed ModeMsg to alwalys be visible
"v15 - initial support for GPG .gpg and .asc file editing
"v16 - added support for building in a subdir 'build' for cmake
"v17 - support for NERDTree
"v18 - syntax checking via syntastic (Check command)
"v19 - Git Fugitive compatibility with chdan


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL OPTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Execute pathogen - requres disabling options in sessions
set sessionoptions-=options
execute pathogen#infect('~/.dan/.vim/bundle/{}', '~/.dan/.vim/syntax/{}')


""" place buffer name into window title
set title

""" Disable the annoying F1 key
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>


" store swap files away from the current directory
set backup
" set backupdir=$VIMBKUPDIR 
"" Our chdan git hack involves telling git that our home directory is
"" the .dan directory. Check to see if we are in that directory and only
"" append .vimbkup if we are already in the home directory. Otherwise, the
"" path from the home directory should be ~/.dan/.vimbkup
if (match($HOME,"/.dan/") != -1)
    " Git Hack
    let s:tval=$HOME.".vimbkup"
else
    " Normal Path
    let s:tval=$HOME."/.dan/.vimbkup"
endif
let &backupdir=s:tval 
" store swp files in the same directory as backups.
" appending the // to the end means save file name as the full path
let &directory=s:tval."//"


" Printing options
"set printdevice=ldp://129.63.16.182
set printoptions=syntax:n,bottom:10pc 

" Building Smartly
" [[ -f Makefile ]] && make || make -C build/ 
au FileType c set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ build/
au FileType cpp set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ build/
au FileType cc set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ build/

" source code indenting
set smarttab
set smartindent
au FileType python inoremap # X#
set expandtab "set this to noexpandtab to make it a real tab and not white spaces
set tabstop=4 "tab width
set shiftwidth=4
set autoindent

" spell checking for comments
" enable using :set spell
set spelllang=en_us

filetype plugin indent on   "This is needed for the tablist plugin

" Ctrl-n will also give you word completion 

" Statusline always on
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=%m      "modified flag
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}] "file format
" set statusline+=%h      "help file flag
" Fugitive status- normally shows [Git(master)] - reduces to just (master)
" Fix for not showing while commiting using '$ git commit' from command line
" http://stackoverflow.com/questions/5983906/vim-conditionally-use-fugitivestatusline-function-in-vimrc 
set statusline+=\ %{exists('g:loaded_fugitive')?substitute(substitute(fugitive#statusline(),'[Git','','g'),']','','g'):''}
set statusline+=%r      "read only flag
" set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


"Change directory to whatever file you are currently editing
"This does not work with git fugitive
"autocmd BufEnter * lcd %:p:h

" Syntax Checking Commands
command Check SyntasticCheck
command CheckOff SyntasticReset
" Don't let syntastic run on write
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_check_on_wq = 0
" Python - use pylint only, and only show errors
let g:syntastic_python_pylint_args = "-d line-too-long,anomalous-backslash-in-string,too-many-instance-attributes,invalid-name,logging-not-lazy,missing-docstring"
let g:syntastic_python_flake8_args = "--max-line-length=100 --ignore=E501"
" let g:syntastic_python_checkers = ['flake8','pylint']
let g:syntastic_python_checkers = ['pylint']

" Fugitive - Specify custom git command compatible with chdan
let g:fugitive_git_executable = 'HOME=$HOME/.dan/ git' 

" Python support using supertab
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest ",preview

" Use tab-complete for supertab!
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Detect YAML files
au BufRead,BufNewFile *.yaml set filetype=yaml


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" USER INTERFACE OPTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number " show line numbers
set ruler  " show current position
set showcmd

" Useful for pasting but disables insert mode mappings
"set paste  " simple pasting
" ties clipboard to system + register (same as doing "+y )
if uname == "Linux"
    set clipboard=unnamedplus " + register (same as doing "+y )
elseif uname == "Darwin"
    set clipboard=unnamed " * register (same as doing "*y )
endif


" enable syntax highlighting
set syntax=on
syntax enable

""" MOUSE SETTINGS
set mouse=a
set ttymouse=xterm2 "get mouse working in screen
set nomousehide
" NOTE FOR USING SCREEN: you also need to add the following line to your .screenrc file
" <in .screenrc> termcapinfo linux|xterm|rxvt|term-color ti@:te@:XT

" Dissable middle button from clicking while scrolling (single middle click)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
" Wheel scrolls - to copy and paste from one buffer to another,
" highlight text in visual mode, then yank or delete the line using y or d 
" Now you can paste it using 'p' or by double middle clicking
" somewhere else...

""" Wildmenu tab completion... 
" to use, go to edit mode and type :<word> then hit tab.
" first tab - a list of completions will be shown and the command will
" be completed to the longest common command.
" second tab - the wildmenu will show up with all the completions that were listed before
set wildmenu
set wildmode=list:longest,full

""" Mishas Amazing Fix
noremap j gj
noremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" FOLDING OPTIONS 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=manual
"set foldmethod=indent
"
set foldmethod=manual
au FileType c,cpp,java,scala,ruby,python,R,tex,yaml set foldmethod=syntax
set foldenable
" make folds open by default
set foldlevel=100
" dont open folds when searching into them
set foldopen-=search
" dont open folds to undo stuff
set foldopen-=undo
set foldcolumn=1
set foldtext=getline(v:foldstart)
nnoremap <F9> [{V%zf <CR>
autocmd BufRead *.py set foldmethod=indent


" highlight Folded guifg=reverse guibg=NONE
highlight Folded ctermfg=darkblue ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" LONG LINE HIGHLIGHTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Graphical Mode
if has("gui_running")
    set colorcolumn=80,100
    highlight ColorColumn ctermbg=darkgray guibg=darkgray
endif
" if has("colorcolumn")
"     set colorcolumn=80
" else
"     highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"     match OverLength /\%81v./
"    au BufWinEnter * let w:m2=matchadd('ErrorMsg','\%>80v.\+', -1)
" endif
" set cc=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" SEARCHING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show matching bracket when entering expressions
set showmatch
set matchtime=7

" incremental search
" as you type in the search query, it will show
" you whether your query currently matches anything
set ignorecase
set incsearch
set smartcase
set nohlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" COMMENTING MACROS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c,cpp,java,scala,javascript  let b:comment_leader = '// '
autocmd FileType sh,ruby,python,R let b:comment_leader = '# '
autocmd FileType conf,fstab,cmake let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map the keystroke ,cr to build
" nnoremap <silent> ,cr :w<CR>:!rubber --pdf --warn all %<CR>
" Map :make to build - disabled because if any errors resulted it would open a 
" blank buffer
" au FileType tex set makeprg=rubber\ \-\-pdf\ \-\-warn\ all\ %
au FileType tex command Make :execute "!cd ".shellescape("%:p:h")." && rubber --pdf --warn all %:t"
au FileType tex command Clean :execute "!cd ".shellescape("%:p:h")." && rubber --clean %:t"
" Smart Quotes
au FileType tex inoremap " ``''<ESC>hi
" Enable Spell Checking
au FileType tex set spell spelllang=en_us
" 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" TAB CONTROLS 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap ,t <Esc>:tabnew %<CR>
" press <F2> and type file name to open it in a new tab 
"nnoremap <F2> :tabe 
" Open a new blank tab by pressing <F3>
"nnoremap <silent> <F3> :tabnew <CR>
" close current tab
"nnoremap <silent> <F4> :tabc <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" PLUGIN OPTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <silent> <F8> :NERDTreeToggle<CR>:TlistToggle<CR>


""" TAGLIST PLUGIN OPTIONS
""" Map F6 key to toggle taglist
" nnoremap <silent> <F6> :TlistToggle<CR>
"For OSX - we need to specify where CTags is at
" if uname == "Darwin"
"     let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
" endif
""" Tell tabs to stay shut unless im working in that file
"let Tlist_File_Fold_Auto_Close = 1 
""" Show only the current file
let Tlist_Show_One_File = 1

""" TAGBAR (Replaces TAGLIST)
nnoremap <silent> <F6> :TagbarToggle<CR>



""" MINIBUFEXPLORER PLUGIN OPTIONS 
""" Map F5 key to toggle MiniBufExplorer
nnoremap <silent> <F5> :TMiniBufExplorer<CR>
""" Prevent MBE from opening up in taglist or nerdtree
let g:miniBufExplModSelTarget = 1 
""" Enable Vertical Mode, set width
"let g:miniBufExplVSplit = 30
""" Open Automatically when this many buffers are present (default 2)
let g:miniBufExplorerMoreThanOne=100

""" NERDTREE Settings
if version >= 700
noremap <silent> <F7> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
endif

""" GNUPG PLUGIN OPTIONS
if version >= 700
" Fix for finding which GPG assuming only one is installed
let g:GPGExecutable=system("which gpg")[:-2]
""For OSX - we need to specify where GPG is at
" let uname = substitute(system("uname"),"\n","","g")
" if uname == "Darwin"
"     let g:GPGExecutable = "/opt/local/bin/gpg"
" endif
let g:GPGPreferSymmetric = 1
let g:GPGPreferArmor = 1
" let g:GPGDebugLevel = 1
endif

" Smooth Scrolling for page up and page down
noremap <silent> <PageUp> :call smooth_scroll#up(&scroll,0,2) <CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll,0,2) <CR>
noremap <silent> <PageDown> :call smooth_scroll#down(&scroll,0,2) <CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll,0,2) <CR>


" Munjals Window tabbing
map <C-H> <C-W>h<C-W><bar>
map <C-L> <C-W>l<C-W><bar>
map <C-J> <C-W>j<C-W><bar>
map <C-K> <C-W>k<C-W><bar>


"auto function block comment for c code
let @c = "/***********************************************************\n Function:\t\n Params:\t\n Returns:\t\n Calls:\t\t\n Description:\n\t\n **********************************************************/\n"
map ,c "cpj$a


" highlights the status line in insert mode (so you dont forget)
if version >= 700
au InsertEnter * hi ModeMsg ctermfg=white term=none ctermbg=green gui=undercurl guisp=green
au InsertLeave * hi ModeMsg ctermfg=none term=none ctermbg=none gui=bold,reverse
endif

"smartHOME and smartEND
nmap <silent><Home> :call SmartHome("n")<CR>
imap <silent><Home> <C-r>=SmartHome("i")<CR>
vmap <silent><Home> <Esc> :call SmartHome("v")<CR>
nmap <silent><End> :call SmartEnd("n")<CR>
imap <silent><End> <C-r>=SmartEnd("i")<CR>
vmap <silent><End> <Esc>:call SmartEnd("v")<CR>

" Python Fix for virtualenv so it can do code completion inside cwd
" Auto adds this directories site-packages to the vim path.
" It does not seem to conflict with other file types
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this,dict(__file__=activate_this))
EOF
endif

" Solarized
if has("gui_running")
    try
        colorscheme solarized
        set background=light " or 'dark'
    catch /^Vim\%((\a\+)\)\=:E185/
        " deal with it, but don't set background to dark
    endtry
endif


" Turn off gvim icon toolbar
if has("gui_running")
    set guioptions-=T
endif


" Disable GitGutter for asc files (they are encrypted so detecting changes in
" the repo won't work!)
au BufReadPost,BufNewFile *.asc              let g:gitgutter_enabled = 0

"*********************************************************************
"*********************************************************************
"               F U N C T I O N      D E F I N A T I O N S
"*********************************************************************
"*********************************************************************
function SmartHome(mode)
    let curcol = col(".")
    "gravitate towards beginning for wrapped lines
    if curcol > indent(".") + 2
        call cursor(0, curcol - 1)
    endif
    if curcol == 1 || curcol > indent(".") + 1
        if &wrap
            normal g^
        else
            normal ^
        endif
    else
        if &wrap
            normal g0
        else
            normal 0
        endif
    endif
    if a:mode == "v"
        normal msgv`s
    endif
    return ""
endfunction

function SmartEnd(mode)
    let curcol = col(".")
    let lastcol = a:mode == "i" ? col("$") : col("$") - 1
    "gravitate towards ending for wrapped lines
    if curcol < lastcol - 1
        call cursor(0, curcol + 1)
    endif
    if curcol < lastcol
        if &wrap
            normal g$
        else
            normal $
        endif
    else
        normal g_
    endif
    "correct edit mode cursor position, put after current character
    if a:mode == "i"
        call cursor(0, col(".") + 1)
    endif
    if a:mode == "v"
        normal msgv`s
    endif
    return ""
endfunction

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


"no working
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

