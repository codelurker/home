" ---------------------------------------------------------------------------
" first the disabled features due to security concerns
set modelines=0         " no modelines [http://www.guninski.com/vim1.html]
"let g:secure_modelines_verbose=1 " securemodelines vimscript

" ---------------------------------------------------------------------------
" operational settings
syntax on
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces
set smarttab                  " tab and backspace are smart
set tabstop=6                 " 6 spaces
set shiftwidth=6
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
compiler ruby                 " Enable compiler support for ruby
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,

colorscheme inkpot-mod

" ---------------------------------------------------------------------------
" status line 
set laststatus=2
if has('statusline')
        " Status line detail: (from Rafael Garcia-Suarez)
        " %f		file path
        " %y		file type between braces (if defined)
        " %([%R%M]%)	read-only, modified and modifiable flags between braces
        " %{'!'[&ff=='default_file_format']}
        "			shows a '!' if the file format is not the platform
        "			default
        " %{'$'[!&list]}	shows a '*' if in list mode
        " %{'~'[&pm=='']}	shows a '~' if in patchmode
        " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
        "			only for debug : display the current syntax item name
        " %=		right-align following items
        " #%n		buffer number
        " %l/%L,%c%V	line number, total number of lines, and column number
        "function! SetStatusLineStyle()
        "        if &stl == '' || &stl =~ 'synID'
        "                let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}" .
        "                                        \"%{'~'[&pm=='']}"                     .
        "                                        \"%=#%n %l/%L,%c%V "                   .
        "                                        \"git:%{call GitBranch()}"
        "        else
        "                let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}" .
        "                                        \" (%{synIDattr(synID(line('.'),col('.'),0),'name')})" .
        "                                        \"%=#%n %l/%L,%c%V "
        "        endif
        "endfunc
        "call SetStatusLineStyle()

        function! SetStatusLineStyle()
                let &stl="%f %y "                       .
                        \"%([%R%M]%)"                   .
                        \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
                        \"%{'$'[!&list]}"               .
                        \"%{'~'[&pm=='']}"              .
                        \"%="                           .
                        \"#%n %l/%L,%c%V "              .
                        \""
                 "      \"%#StatusLineNC#%{GitBranchInfoString()}%* " .
        endfunc
        call SetStatusLineStyle()

        if has('title')
                set titlestring=%t%(\ [%R%M]%)
        endif

        "highlight StatusLine    ctermfg=White ctermbg=DarkBlue cterm=bold
        "highlight StatusLineNC  ctermfg=White ctermbg=DarkBlue cterm=NONE
endif

" ---------------------------------------------------------------------------
"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite       " ignore all whitespace and sync

" ---------------------------------------------------------------------------
"  mouse stuffs
set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing
" this makes the mouse paste a block of text without formatting it 
" (good for code)
map <MouseMiddle> <esc>"*p

" ---------------------------------------------------------------------------
"  backup options
"#set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1

" ---------------------------------------------------------------------------
" spelling...
if v:version >= 700
  let b:lastspelllang='en'
  function! ToggleSpell()
    if &spell == 1
      let b:lastspelllang=&spelllang
      setlocal spell!
    elseif b:lastspelllang
      setlocal spell spelllang=b:lastspelllang
    else
      setlocal spell spelllang=en
    endif
  endfunction

  nmap <LocalLeader>ss :call ToggleSpell()<CR>

  setlocal spell spelllang=en
endif

" Nerdtree stuff
"Increase window size to 25 columns
let NERDTreeVinSize=25

"nmap <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>


" ---------------------------------------------------------------------------
" some useful mappings
" Y yanks from cursor to $
map Y y$
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" correct type-o's on exit
nmap q: :q
" save and build
nmap <LocalLeader>wm  :w<cr>:make<cr>
" ruby helpers
iab rbang #!/usr/bin/env ruby
iab idef def initialize

" ---------------------------------------------------------------------------
" setup for the visual environment
if $TERM =~ '^xterm'
        set t_Co=256 
elseif $TERM =~ '^screen-bce'
        set t_Co=256           
elseif $TERM =~ '^rxvt'
        set t_Co=256
elseif $TERM =~ '^linux'
        set t_Co=8
else
        set t_Co=16
endif

" ---------------------------------------------------------------------------
" tabs
" (LocalLeader is ",")
map <LocalLeader>tc :tabnew %<cr>    " create a new tab       
map <LocalLeader>td :tabclose<cr>    " close a tab
map <LocalLeader>tn :tabnext<cr>     " next tab
map <LocalLeader>tp :tabprev<cr>     " previous tab
map <LocalLeader>tm :tabmove         " move a tab to a new location

" "dcraven" pasted "TabMessage: Put output of ex commands in a new tab." 
" (10 lines, 287B) at http://sial.org/pbot/20504

"TabMessage: Put output of ex commands in a new tab.
"function! TabMessage(cmd)
"        redir => message
"        silent execute a:cmd
"        redir END
"        tabnew
"        silent put=message
"        set nomodified
"endfunction
"command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

" ---------------------------------------------------------------------------
" auto load extensions for different file types
if has('autocmd')
        filetype plugin indent on
        syntax on

        " jump to last line edited in a given file (based on .viminfo)
        "autocmd BufReadPost *
        "       \ if !&diff && line("'\"") > 0 && line("'\"") <= line("$") |
        "       \       exe "normal g`\"" |
        "       \ endif
        autocmd BufReadPost *
                \ if line("'\"") > 0|
                \       if line("'\"") <= line("$")|
                \               exe("norm '\"")|
                \       else|
                \               exe "norm $"|
                \       endif|
                \ endif

        " improve legibility
        au BufRead quickfix setlocal nobuflisted wrap number

        " configure various extenssions
        let git_diff_spawn_mode=2

        " improved formatting for markdown
        " http://plasticboy.com/markdown-vim-mode/
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
        autocmd BufRead ~/.blog/entries/*  set ai formatoptions=tcroqn2 comments=n:>
endif
