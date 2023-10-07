#!/bin/bash
SLEEPTIME=$1
QTUSERS=$(w -h | sort | uniq | wc -l)
USERSLIST=$(w -h | cut -f1 -d' '| sort | uniq  | xargs)

while true
do
	NEWQTUSERS=$(w -h | cut -f1 -d ' '| sort | uniq | wc -l )
	NEWUSERSLIST=$(w -h | cut -f1 -d' ' | sort | uniq | xargs)
	if [ ${NEWQTUSERS} -gt ${QTUSERS} ]
	then
		echo "Entraram usuários."

		for user in ${NEWUSERSLIST}
		do
			if echo $USERSLIST | grep -v -q $user
			then
				echo "$user entrou."
			fi
		done

		USERSLIST=${NEWUSERSLIST}
	        QTUSERS=${NEWQTUSERS}
	fi
	if [ ${NEWQTUSERS} -lt ${QTUSERS} ]
	then
		echo "Saíram usuários."
		for user in ${USERSLIST}
		do
			if echo $NEWUSERSLIST | grep -v -q $user
			then
				echo "$user saiu."
			fi
		done

		USERSLIST=${NEWUSERSLIST}
	        QTUSERS=${NEWQTUSERS}
	fi
	sleep ${SLEEPTIME}
done
