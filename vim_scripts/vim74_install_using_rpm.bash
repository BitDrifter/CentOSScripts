rpm -Uvh http://vault.centos.org/7.0.1406/os/Source/SPackages/vim-7.4.160-1.el7.src.rpm

cd ~/rpmbuild/SPECS
wget -O - \
   https://gist.githubusercontent.com/renecunningham/897bc360210c2901d6d5/raw | \
   patch -p0 vim.spec

yum install ncurses-devel 'perl(ExtUtils::Embed)' libacl-devel autoconf \
    gpm-devel ruby-devel ruby gtk2-devel gtk2-devel libSM-devel libXt-devel \
    libXpm-devel python-devel

rpmbuild -ba vim.spec

cd ~/rpmbuild/RPMS/$(uname -p)

rpm -Uvh vim-filesystem-7.4.160-1.el6.x86_64.rpm 
rpm -Uvh vim-common-7.4.160-1.el6.x86_64.rpm
rpm -Uvh vim-debuginfo-7.4.160-1.el6.x86_64.rpm
rpm -Uvh vim-minimal-7.4.160-1.el6.x86_64.rpm 
rpm -Uvh vim-enhanced-7.4.160-1.el6.x86_64.rpm 
rpm -Uvh vim-X11-7.4.160-1.el6.x86_64.rpm





