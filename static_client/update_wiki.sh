#!/bin/bash

SCRIPT_DIR=`dirname $0`

LOCAL_WIKI='/media/Dropbox/XLCTeam/wiki'
DOWNLOAD_KEY=$SCRIPT_DIR'/update_static'
SERVER='xlc-1.cust.erigones.com'
REMOTE_USER='wiki'
REMOTE_DIR='static_dump/'

SSH_AUTH_SOCK="" SSH_AGENT_PID="" rsync -asv -e 'ssh -i '$DOWNLOAD_KEY $REMOTE_USER'@'$SERVER':'$REMOTE_DIR $LOCAL_WIKI
