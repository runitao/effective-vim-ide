## Prerequisites
### Mac OS X EI Capitan
```shell
brew install clang-format # format c/c++/java... code
brew install vim
brew install ctags
brew install npm
brew install the_silver_searcher # faster code search tool than ack
```

### Ubuntu 16.04 (sudo)
```shell
apt install vim-nox # some plugins need python supported
apt install exuberant-ctags
apt install cmake
apt install clang-format
apt install silversearcher-ag
apt install npm xdg-utils curl nodejs-legacy
npm -g install instant-markdown-d
```

## Install
### Online installation
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/marvelrock/vim-ide-easy-install/master/tools/install.sh)"
```

## Post install
- vim-airline

    You need to select a font from `$HOME/.vim/plugged/fonts/` for your terminal's non-ascii font.
And keep `let g:airline_powerline_fonts = 1` on.

### generate dot files(c/c++, may be available for java...)
- YouCompleteMe
```shell
cp $HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py /path/to/your/project/
```
- Clang-Format
```shell
clang-format -style=Google -dump-config > /path/to/your/project/.clang-format
```

## Key mapping
- F4: toggle tagbar
- F5: used for ctrlp(I dont' know what it is exactly effect)
- ctrl-p: toggle ctrlp
- F6: toggle nerdtree
- F8: switch back and forth between buffers
- `;[12...90]`: jump to specify buffer
- `nw | ;hw | ;jw | ;kw | ;lw`:switch between windows
- `;q`: quit vim
- `;w`: save current buffer
- `;WQ`: save all and quit vim
- `;Q`: don't save and force quit
- `;jc`: jump to declaration(YouCompleteMe)
- `;jd`: jump to definition(YouCompleteMe)
- `;sf`: active CtrlSF
- more mapping, please refer to \*map in vimrc

## References
- [use-vim-as-ide](https://github.com/yangyangwithgnu/use_vim_as_ide) - I mainly refer to this site
- [asins/vimcdoc](https://github.com/asins/vimcdoc) - 中文帮助文档，如果需要请打开注释`Plug 'asins/vimcdoc'`并在normal mode下执行`PlugInstall`
- [vim-plug](https://github.com/junegunn/vim-plug) - manager vim plugins
- [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)
- [ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher) - ag for plugin ctrlsf.vim
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) - fantastic status line
- [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) - powerful refactor tool with plugin vim-multiple-cursors
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - powerful file finder
