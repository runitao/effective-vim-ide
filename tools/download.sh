
old_dir=`pwd`
vim_repo="vim-ide-easy-install"

git clone --recursive https://github.com/marvelrock/vim-ide-easy-install.git $vim_repo

vim -u $vim_repo/vimrc +PlugInstall +qall

tar cjf $vim_repo.tar.gz $vim_repo
