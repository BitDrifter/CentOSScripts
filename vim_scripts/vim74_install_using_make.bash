mkdir /tmp/vimbuild; cd /tmp/vimbuild
wget -c ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar -xjvf vim-7.4.tar.bz2
cd vim74
\rm -rf src/auto/config.cache
make clean
./configure \
    --prefix=/usr \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gnome-check \
    --enable-multibyte \
    --enable-gui=gnome2 \
    --enable-xim \
    --enable-multibyte \
    --enable-luainterp \
    --disable-tclinterp \
    --with-features=huge \
    --with-x=yes \
    --with-compiledby="BitDrifter" \
    --with-python-config-dir=/usr/lib64/python2.6/config


make -j20 VIMRUNTIMEDIR=/tmp/vimbuild/vim74/runtime/ 
make install
if [ -f src/vim ]
then
  \cp -f src/vim src/gvim
  strip src/gvim
  ./src/gvim &
fi

