" path to .vimprj folder
let s:sVimprjPath = expand('<sfile>:p:h')
 
" point Indexer to our local .indexer_files
let g:indexer_indexerListFilename = s:sVimprjPath.'/.indexer_files'

" TODO: here may be any other project-specific settings, such as tabstop, etc
python import sys
python import os
python import vim
function! MakeProject()
python << EOF
old_dir=os.getcwd()
try:
    print("hello world")
    print("pwd = ", os.getcwd())
    os.chdir('./build')
    print("pwd = ", os.getcwd())
    os.popen("cmake ..").read()
    os.system("make")
except OSError as e:
    print("error: ", e.strerror)
except:
    raise

os.chdir(old_dir)

EOF
endfunction

command! -nargs=0 Make call MakeProject()

let &rtp = s:sVimprjPath.','.&rtp
let g:UltiSnipsSnippetDirectories=["coolsnippets"]

" help fswitch
augroup mycppfiles
    au!
    au BufEnter *.h let b:fswitchdst  = 'cpp,cc'
    au BufEnter *.h let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,ifrel:|/src/|../include|'
    au BufEnter *.cpp let b:fswitchdst  = 'h'
    au BufEnter *.cpp let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,ifrel:|/include/|../src|'
    au BufEnter *.cc let b:fswitchdst  = 'h'
    au BufEnter *.cc let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,ifrel:|/include/|../src|'
augroup END

let g:disable_protodef_sorting = 1
let g:ctrlp_cache_dir = s:sVimprjPath.'/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']

