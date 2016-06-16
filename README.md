## Prerequisites
### Mac OS X EI Capitan
```shell
brew install clang-format # format c/c++/java... code
brew install vim
brew install cmake xz # need by YouCompleteMe
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

## Install and Uninstall
### Online installation
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/marvelrock/vim-ide-easy-install/master/tools/install.sh)"
```
### Uninstall
```shell
rm -rf $HOME/.vim
echo > $HOME/.vimrc
```

## Post install
- [vim-airline][] - fantastic status line

    You need to select a font from `$HOME/.vim/plugged/fonts/` for your terminal's non-ascii font.
And keep `let g:airline_powerline_fonts = 1` on.

### You may need this for your projects(c/c++/python/java...)
- [YouCompleteMe][]
```shell
cp $HOME/.vim/dotfiles/.ycm_extra_conf.py /path/to/your/project/
```
- Clang-Format
```shell
clang-format -style=Google -dump-config > /path/to/your/project/.clang-format
```
- [vimprj][]
```shell
cp -r $HOME/.vim/dotfiles/.vimprj /path/to/your/project/
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

## Note
+ YouCompleteMe only support jump in a translate unit or `#include` files, but we can use [CtrlSF][] instead to jump between definition and declaration.

## References
- [use-vim-as-ide](https://github.com/yangyangwithgnu/use_vim_as_ide) - I mainly refer to this site
- [awesome-vim](https://github.com/mhinz/vim-galore)
- [asins/vimcdoc](https://github.com/asins/vimcdoc) - 中文帮助文档，如果需要请打开注释`Plug 'asins/vimcdoc'`并在Ex-mode下执行`PlugInstall`
- [vim-plug](https://github.com/junegunn/vim-plug) - manager vim plugins
- [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)
- [ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher) - ag for plugin ctrlsf.vim
- [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) - powerful refactor tool with plugin vim-multiple-cursors
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - powerful file finder

[vim-airline]: https://github.com/vim-airline/vim-airline
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[vimprj]: http://dmitryfrank.com/articles/vim_project_code_navigation 
[CtrlSF]: https://github.com/dyng/ctrlsf.vim
