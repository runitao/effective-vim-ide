## Prerequisites
### Mac OS X EI Capitan
```shell
brew install clang-format
brew install ctags
```

### Ubuntu 16.04
```shell
apt install vim-nox # some plugins need python supported
apt install exuberant-ctags
apt install cmake
apt install clang-format # format c/c++/java... code
```

## Install
### Online installation
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/marvelrock/vim-ide-easy-install/master/tools/install.sh)"
```
### Offline installation
#### 1. download and pack
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/marvelrock/vim-ide-easy-install/master/tools/download.sh)"
```
#### 2. unpack and install
```shell
tar xjf vim-ide-easy-install.tar.gz
mv vim-ide-easy-install $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
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
