## Prerequisites
### Mac OS X EI Capitan
```
brew install ctags
```

### Ubuntu 16.04
```
apt install vim-nox # some plugins need python supported
apt install exuberant-ctags
apt install cmake
```

## Install
#### Online installation
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/marvelrock/vim-ide-easy-install/master/tools/install.sh)"
```
#### Offline installation
1. download and pack
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/marvelrock/vim-ide-easy-install/master/tools/download.sh)"
```
2. unpack and install
```shell
tar xjf vim-ide-easy-install.tar.gz
mv vim-ide-easy-install $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
```


## References
- [vim-plug](https://github.com/junegunn/vim-plug)
- [use-vim-as-ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
