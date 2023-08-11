# git
  # config
yum install git -y
git clone https://gitee.com/yourfriendyo/config
rm ~/.config && mv config ~/.config

# fastgithub
vim /etc/bashrc
export https_proxy=http://127.0.0.1:38457 http_proxy=http://127.0.0.1:38457

git clone https://github.com/dotnetcore/FastGithub.git

# tmux
  # ncurses 
  # libevent

yum install -y ncurses-devel libevent-devel
tar -xzvf tmux-3.3a.tar.gz
cd tmux-3.3a/
./configure && make && make install

# nvim
  # glibc2.28
  # glibc2.29

yum install -y bison
yum install centos-release-scl scl-utils-build -y   
yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ 
scl enable devtoolset-8 bash                       

cd /usr/local/
wget https://mirror.bjtu.edu.cn/gnu/libc/glibc-2.28.tar.xz --no-check-certificate
tar -xf glibc-2.28.tar.xz
cd glibc-2.28/
mkdir build && cd build

../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make && make install

strings /lib64/libc.so.6 |grep GLIBC

cd /usr/local/
wget https://mirror.bjtu.edu.cn/gnu/libc/glibc-2.29.tar.xz --no-check-certificate
tar -xf glibc-2.29.tar.xz
cd glibc-2.29/
mkdir build && cd build

../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make && make install

strings /lib64/libc.so.6 |grep GLIBC

tar -xvzf nvim-linux64.tar.gz
cd nvim-linux64/
mv bin/nvim /usr/bin/
mv lib/nvim/ /usr/lib/
mv man/man1/ /usr/share/man/man1
mv nvim/ /usr/share/

git clone https://github.com/yourfriendyo/nvim.git
mv nvim ~/.config
