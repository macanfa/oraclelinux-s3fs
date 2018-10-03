#!/bin/sh

# echo "access_key:secret_key" >  ~/.passwd-s3fs
# chmod 600  ~/.passwd-s3fs
# mkdir -p /bucket
# s3fs bucket /bucket -o passwd_file=~/.passwd-s3fs -o url=http://s3.server.org/ -o use_path_request_style -o umask=0022

START=$(date +%s)

while true; do
	sleep 60
	NOW=$(date +%s)
	echo "$(date)  ->  Uptime: $(((NOW - START) /60)) min"
done