#!/usr/bin/bash

WIKIDIR="/home/wiki/web"
STATICDIR="/home/wiki/static_dump"
LOG=~/sync.log

function log(){
	echo `date` $@ >> $LOG
}

function log_echo(){
	log $@
	echo $@
}

log "original command: $SSH_ORIGINAL_COMMAND"
log `/opt/local/bin/php $WIKIDIR/extensions/dumpHTML/dumpHTML.php -d $STATICDIR -k monobook --image-snapshot 2>&1`

case "$SSH_ORIGINAL_COMMAND" in
	*\&*)
	log_echo "Rejected"
	;;

	*\(*)
	log_echo "Rejected"
	;;

	*\{*)
	log_echo "Rejected"
	;;

	*\;*)
	log_echo "Rejected"
	;;

	*\<*)
	log_echo "Rejected"
	;;

	*\`*)
	log_echo "Rejected"
	;;

	*\|*)
	log_echo "Rejected"
	;;

	rsync\ --server\ --sender*)
	$SSH_ORIGINAL_COMMAND
	;;

	*)
	log_echo "Rejected"
	;;
esac 
