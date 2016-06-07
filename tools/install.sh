
old_dir=`pwd`
vim_repo="$HOME/.vim"
vimrc="$HOME/.vimrc"

if [ -d $vim_repo -o -e $vimrc ]; then
    echo please backup $vim_repo and/or $vimrc first.
    exit 1
fi

git clone --recursive https://github.com/marvelrock/vim-ide-easy-install.git $vim_repo
cd $HOME
ln -s $vim_repo/vimrc $vimrc
cd $old_dir

vim +PlugInstall +qall
