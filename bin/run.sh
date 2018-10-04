#!/bin/sh

if [ "$ACCESS_KEY" != "none" ] && [ "$SECRET_KEY" != "none" ]; then
        echo "$ACCESS_KEY:$SECRET_KEY" >  ~/.passwd-s3fs
        chmod 600  ~/.passwd-s3fs
        if [ "$ENDPOINT" != "none" ] && [ "$BUCKET" != "none" ]; then
                sudo mkdir -p /$BUCKET
                sudo /usr/local/bin/s3fs $BUCKET /$BUCKET -o passwd_file=$HOME/.passwd-s3fs -o instance_name=$BUCKET,url=$ENDPOINT,use_path_request_style,allow_other,dbglevel=info,umask=0022,uid=1000,gid=1000
        fi
fi

START=$(date +%s)

while true; do
	sleep 60
	NOW=$(date +%s)
	echo "$(date)  ->  Uptime: $(((NOW - START) /60)) min"
done