" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" <<

" >>
" vim 自身（非插件）快捷键
" 支持终端粘贴
"set paste
" 默认开启paste，会导致部分快捷键映射失效
set pastetoggle=<F10>

" 开启剪切到系统剪贴板
set clipboard+=unnamedplus
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
nnoremap <C-l> <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
"nnoremap <C-h> <C-W>h " C-H不能工作，解决TODO
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
nnoremap <C-k> <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
nnoremap <C-j> <C-W>j

" 定义快捷键在结对符之间跳转
"nmap <Leader>M %

" <<

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>
" 其他

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
" set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<

" >>>>
" 插件安装

" vundle 环境设置
filetype off
" vim-plug 管理的插件列表必须位于 plug#begin() 和 plug#end() 之间
call plug#begin('~/.vim/plugged')
"Plug 'asins/vimcdoc'

" begin color theme
"Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
"Plug 'tomasr/molokai'
"Plug 'vim-scripts/phd'
" end color theme

Plug 'powerline/fonts' , { 'do': './install.sh' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] }
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
"Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DrawIt'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe' , { 'for': ['c', 'cpp', 'cmake'], 'do': './install.py --clang-completer' } 
"自动补全括号，但是又不能跳出括号，可以使用ultisnips替代
"Plug 'Townk/vim-autoclose' , { 'for': ['c', 'cpp', 'cmake'] }

" 忽略vim-cmakecomplete插件的默认设置
" 补全快捷键是<Leader>; 是由本文中的“inoremap <Leader>; <C-x><C-o>设置的
let g:did_cmakecomplete=1 " 不适用vim-cmake-completion默认的设置
autocmd FileType cmake set omnifunc=cmakecomplete#Complete
autocmd FileType cmake setlocal completeopt-=preview
Plug 'richq/vim-cmake-completion' , { 'for': ['cmake'] }

Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef' "依赖FSWitch，以及perl，故目前没有效果
Plug 'tpope/vim-fugitive' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }
"Plug 'fholgado/minibufexpl.vim'
"Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
"Plug 'easymotion/vim-easymotion'
Plug 'suan/vim-instant-markdown', { 'for': ['markdown'] }
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'ctrlpvim/ctrlp.vim'
" 插件列表结束
call plug#end()
filetype plugin indent on
" <<<<

" 配置vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
" 如果想要比较炫酷的airline效果，必须开启powerline fonts 
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp ClangFormatAutoEnable

" >>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" <<

" >>
" 设置FSwitch
nnoremap <Leader><tab> :FSHere<CR>
" <<

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" <<

" >>
" 其他美化

" 设置 gvim 显示字体
"set guifont=YaHei\ Consolas\ Hybrid\ 10.5
"set guifont=Monaco:h12

" 禁止折行
set nowrap

" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" <<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" <<

" >>
" 代码收藏

" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" <<

" >>
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <silent> <F4> :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=0
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" <<

" >>
" 代码导航
 
" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 打开标签选择窗口
nmap <Leader>ts :tselect<CR>
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航
nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
" 在声明和定义间来回跳转。注意，必须是 #include 或已打开的文件
nnoremap <F3> :YcmCompleter GoTo<CR>

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sf :CtrlSF<CR>
" 使用默认的Ctrl-j跳到下一个
" 使用默认的Ctrl-p跳到上一个

" <<

" >>
" 内容替换, vim-multi-cursor

" 快捷替换
" 使用默认的Ctrl-n选择下一个
"let g:multi_cursor_next_key='<c-n>'
" 使用默认的Ctrl-p选择下一个
"let g:multi_cursor_skip_key='<c-p>'
" 使用默认的Ctrl-x排除当前光标处的匹配项
"let g:multi_cursor_skip_key='<c-x>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <<

" >>
" YCM 补全

" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=15 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=15 ctermbg=2 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <Leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 在候选列表中移动
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
" 统一YCM补与UltiSnips补全快捷键
" let g:UltiSnipsSnippetDirectories=["/path/to/my/snippets/directory"]
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
"let g:UltiSnipsExpandTrigger="<Leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"

" <<

" >>
" 不限制CtrlP扫描文件的的最大数目
let g:ctrlp_max_files=0
" <<
 
" >>
" 由接口快速生成实现框架

" 成员函数的实现顺序与声明顺序一致
"let g:disable_protodef_sorting=1

" <<

" >>
" 库信息参考
" 键入K，显示光标下的词的参考手册
" <<

" >>
" 工程文件浏览

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nnoremap <silent> <F6> :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=30
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" <<

" >>
" 多文档编辑
 
" 有vim-airline的支持，不需要显示miniBufExpl状态栏
let g:miniBufExplAutoStart = 0

" buffer 切换快捷键
"map <Leader>bn :MBEbn<CR>
"map <Leader>bp :MBEbp<CR>
"map <Leader>bd :MBEbd<CR>
nnoremap <silent> <F8> :bn<CR>
" S-F8是F20
nnoremap <silent> <F20> :bp<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" <<

" >>
" 环境恢复

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

" 保存快捷键
"map <Leader>ss :mksession! my.vim<CR> :wviminfo! my.viminfo<CR>
map <Leader>ss :mksession! my.vim<CR>

" 恢复快捷键
"map <Leader>rs :source my.vim<CR> :rviminfo my.viminfo<CR>
map <Leader>rs :source my.vim<CR>

" <<
 
" 设置快捷键实现一键编译及运行
"nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
"nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" >>
" 快速选中结对符内的文本
 
" 快捷键
"map <SPACE> <Plug>(wildfire-fuel)
"vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
"let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" <<

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

" 如果运行的是neovim
if has('nvim')
    " 映射打开nvim-terminal，并运行zsh
    "nnoremap <Leader>t  :vsplit +terminal<CR>
    nnoremap <silent> <F2> :vsplit term://zsh<CR>
    " 映射ESC退出nvim-terminal
    tnoremap <Esc>      <c-\><c-n>
    tnoremap <a-h>      <c-\><c-n><c-w>h
    tnoremap <a-j>      <c-\><c-n><c-w>j
    tnoremap <a-k>      <c-\><c-n><c-w>k
    tnoremap <a-l>      <c-\><c-n><c-w>l
    autocmd BufEnter term://* startinsert
    " 我的nvim配置是软连接 ~/.vimrc --> $MYVIMRC
    autocmd BufWritePost ~/.vimrc source $MYVIMRC
endif

" 配色方案，放在最后避免多次执行导致必要的开销，用'vim -V15debug.log'检验
"set background=dark
"colorscheme solarized
"colorscheme molokai
colorscheme monokai
" monokai默认高亮搜索项
" hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Search ctermfg=230 ctermbg=2 cterm=bold guifg=230 guibg=2 gui=bold
"colorscheme phd

