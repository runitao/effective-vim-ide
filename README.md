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
### generate dot files(c/c++, may be available for java...)
- YouCompleteMe
```shell
cp $HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py /path/to/your/project/
```
- Clang-Format
```shell
clang-format -style=Google --dump-config > /path/to/your/project/.clang-format
```

## References
- [vim-plug](https://github.com/junegunn/vim-plug)
- [use-vim-as-ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
- [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)
- [ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
