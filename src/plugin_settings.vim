"""
""" Vim Seek
"""
let g:SeekKey = 'f'
let g:seekBackKey = 'F'

"""
""" Netrw - this is the culprit behind the me issue ...
"""
let g:loaded_netrwPlugin=1 " Disable built in netrw

"""
""" Vim Fugitive Mappings
"""
" always clear the screen after running (so we don't have old results etc)
command! -nargs=* G :Git <args> | :execute("silent ! \"clear\"") | :redraw!
cabbrev g <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'G' : 'g')<CR>

" easier git commits
map ga :Gcommit -a <CR>
map gp :Git pf <CR>
let g:fugitive_git_executable = substitute(system("which hub"), '\n', '', '')
" map git commit filetypes so only have to exit and it auto saves
fu! GitCommitHook()
  if &modifiable == 1
    echo "is modifiedable"
    map <Buffer> mq :execute ":w | :close"
  endif
endfunction
"autocmd Filetype gitcommit :call GitCommitHook()

""""
"""" VimHub Mappings / Configuration
""""
"map mi :Gissues
"map ml :Gissues <CR>
"map mn :Gissue

"""
""" Vim Gist Settings
"""
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

"""
""" Vim Flow Settings
"""
map <Leader>, :FlowRun<CR>
map <Leader>l :FlowToggle<CR>

"""
""" Vim Filer
"""
" map escape to call the correct file / directory in vimfiler - or l
let g:vimfiler_enable_auto_cd=1
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_ignore_pattern=0
let g:vimfiler_force_overwrite_statusline=1

" configure vimfiler configuration to prevent issues from new buffers starting
autocmd FileType vimfiler call ConfigureVimfilerBuffer()
function! ConfigureVimfilerBuffer()
  " make sure to disable the m mapping
  nnoremap<buffer><silent> m :edit .<CR>
  " make sure that new vimfiler buffers don't show up in buffer tabs
  set nobuflisted
endfunction

" make sure vimfiler windows work correctly with vim-fugitive
autocmd Filetype vimfiler call fugitive#detect(getcwd())
map E :VimFiler<CR>
let g:vimfiler_execute_file_list = {}
let g:vimfiler_execute_file_list['_'] = 'vim'


"""
""" Vim Go
"""
let g:go_fmt_command = 'gofmt'
let g:go_def_mode = 'godef'

map gi :GoImports<CR>

"""
""" Vimmarks
"""
let g:vimmarks_debug = 1
