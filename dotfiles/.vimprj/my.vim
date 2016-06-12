" path to .vimprj folder
let s:sVimprjPath = expand('<sfile>:p:h')
 
" point Indexer to our local .indexer_files
let g:indexer_indexerListFilename = s:sVimprjPath.'/.indexer_files'

" TODO: here may be any other project-specific settings, such as tabstop, etc
