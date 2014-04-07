#!/usr/bin/bash

WIKIDIR="/home/wiki/web"
STATICDIR="/home/wiki/static_dump"
LOG=~/sync.log

echo `date` "original command: $SSH_ORIGINAL_COMMAND" >> $LOG
echo `date` `/opt/local/bin/php $WIKIDIR/extensions/dumpHTML/dumpHTML.php -d $STATICDIR -k monobook --image-snapshot 2>&1` >> $LOG

case "$SSH_ORIGINAL_COMMAND" in
	*\&*)
	echo "Rejected"
	;;

	*\(*)
	echo "Rejected"
	;;

	*\{*)
	echo "Rejected"
	;;

	*\;*)
	echo "Rejected"
	;;

	*\<*)
	echo "Rejected"
	;;

	*\`*)
	echo "Rejected"
	;;

	*\|*)
	echo "Rejected"
	;;

	rsync\ --server\ --sender*)
	$SSH_ORIGINAL_COMMAND
	;;

	*)
	echo "Rejected"
	;;
esac 
