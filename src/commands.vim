"""""""""
"""""""""
"   Initialize general commands mapped off  
"""""""""
"""""""""
command! C let @/=""

" set up and alias to help with saving / reading to clipboard
command! W :w ! pbcopy
map W :w ! pbcopy<CR>
map R :r ! pbpaste<CR>
" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

"""""""""
"""""""""
"        Development Plugins
"""""""""
"""""""""
command! Reload :call Reload()
command! S :call Reload()


"""""""""
"""""""""
"        Window / Buffer Management Shortcuts
"""""""""
"""""""""
" new tab shortcut
command! -nargs=* T :tabedit <args>
map T :execute("tabedit  ". @%)<CR>
map mx :call SmartClose()<CR>
map mc :close<CR>
map md :bdelete!<CR>

" close vim! 
command! Q :quitall!
map Q :quitall!<CR>

""""""""
""""""""
"    Custom Function Command Mappings
""""""""
""""""""
" reset the basepath
map E :call CDBasePath()<CR>
command! E :call CDBasePath()

" navigate to the secondary path
map SE :call CDSecondaryPath()<CR>
command! SE :call CDSecondaryPath()

""""""""
""""""""
"    Lowercase key overrides
""""""""
""""""""
cabbrev s <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'wall' : 's')<CR>
cabbrev dd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? '1,$d' : 'dd')<CR>
cabbrev qq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'quitall' : 'qq')<CR>

"""
""" Normal mode mappings
"""
map s :wall<CR>
nmap ; :
noremap ;; ;

"""
""" Copy mappings
"""
map 1 "ay
map 2 "ax
map 3 "ap
map 4 "by
map 5 "bx
map 6 "bp
" http://vimtips.quora.com/How-to-Copy-to-clipboard-on-vim
map <S-y> y:e /tmp/vim<CR>P:w !pbcopy<CR><CR>:BufSurfBack<CR>:bdelete! /tmp/vim <CR>

"""
""" QuickFix Mappings
"""
map cn :cn<CR>
map cp :cp<CR>



