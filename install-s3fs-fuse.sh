#!/bin/sh

cd /tmp
yum install -y automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
make install

mkdir /tmp/s3fs
cp /usr/local/bin/s3fs /usr/local/share/man/man1/s3fs.1 /lib64/libfuse.so.2.9.4 /lib64/libnuma.so.1 /tmp/s3fs
