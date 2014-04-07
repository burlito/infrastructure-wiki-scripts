#!/bin/bash

SCRIPT_DIR=`dirname $0`

LOCAL_WIKI='/media/Dropbox/wiki'
DOWNLOAD_KEY=$SCRIPT_DIR.'/update_static'
SERVER='xlc-1.cust.erigones.com'
REMOTE_USER='wiki'
REMOTE_DIR='static_dump/'

rsync -asv -e 'ssh -i '.$DOWNLOAD_KEY $REMOTE_USER.'@'.$SERVER.':'.$REMOTE_DIR $LOCAL_WIKI
