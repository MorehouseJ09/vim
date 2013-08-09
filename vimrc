"""""""""
"""""""""
"	 Initialize our bundles and pathogen for loading them up
"""""""""
"""""""""

"load up our bundle loaders!
runtime bundle/vim-pathogen/autoload/pathogen.vim
" initialize pathogen to help with bundles
execute pathogen#infect()
execute pathogen#helptags()

"""""""""
"""""""""
"	 Initialize Vim Themes / Colors
"""""""""
"""""""""

" Initialize color scheme for application
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"colors monokai
let g:molokai_original = 1


"""""""""
"""""""""
"	 Iniitalize general vim settings
"""""""""
"""""""""

"help with file types
filetype plugin indent on
filetype plugin on
" make buffers hide instead of close
set hidden
"don't wrap lines
set nowrap
"Set the vim clipboard
set clipboard=unnamed
set autoindent
set copyindent
"always show the line numbers
set number
"show matching parenthesis
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.ds_store,*.pyc,*.class
set wildignore+=*.o,*.obj,.git,node_modules
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
"http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
" delay between leader key and second command accepting
set timeoutlen=1000
"http://vim.wikia.com/wiki/Moving_to_matching_braces
set showmatch

" check out the matching time / responsiveness for brackets in vim etc
set matchtime=1

"""""""""
"""""""""
" 	Initialize general commands mapped off  
"""""""""
"""""""""
"""""""""

"set whther or not to highlight searches
"set nohlsearch
"http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing:
" now create a command to clear the highlighting
command! C let @/=""

" set up some mac copy paste elements
command! -range Y  w !pbcopy
command! P r !pbpaste

" set up and alias to help with saving
command! W w
" source our vimrc and reload everything
command! S source $HOME/.vimrc

" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

" new tab shortcut
command! T :tabedit

"""""""""
"""""""""
"        Initialize vim functions here
"""""""""
"""""""""
 
" initialize a grunt helper command -- this is useful for when restarting
" tests on local projects etc
" http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
fu! Grunt(command)
	
	" we need to initialize a setting to check whether or not the grunt
	" file exists
	execute "!grunt " . a:command

endfunction



"""""""""
"""""""""
"	Initialize leader commands
"""""""""
"""""""""

let mapleader = ","
" initialize save 
noremap <Leader>s :update<CR>
noremap <Leader>ss :wall<CR>
noremap <Leader>x :q<CR>


" now map some shortcuts to run our favorite grunt r commands (to restart
" tasks and servers)
noremap <Leader>r :call Grunt("r")<CR>
noremap <Leader>rr :call Grunt("rr")<CR>


"""""""""
"""""""""
"	 Initialize global aliases / changes
"""""""""
"""""""""
" remove the remapping of the ;
"noremap ; :

" formatting helpers
vmap Q gq
nmap Q gqap

