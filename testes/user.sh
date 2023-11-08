#!/bin/bash
SLEEPTIME=$1
QTUSERS=$(w -h | sort | uniq | wc -l)
USERLIST=$(w -h | cut -d ' ' -f1 | sort | uniq | xargs)

while true
do
    NEWQTUSERS=$(w -h | cut -f1 -d ' ' | sort | uniq | wc -l)
    NEWUSERLIST=$(w -h | cut -d ' ' -f1 | sort | uniq | xargs)
    if [ ${NEWQTUSERS} -gt ${QTUSERS} ]
    then
        echo "Entraram usuários."

        for user in ${NEWUSERLIST}
        do
            if echo ${USERLIST} | grep -q -v "${user}"
            then
                echo "Usuário ${user} entrou."
            fi
            #if [[ ${USERLIST} != *"${user}"* ]]
            #then
                #echo "Usuário ${user} entrou."
            #fi
        done

        USERLIST=${NEWUSERLIST}
        QTUSERS=${NEWQTUSERS}
    fi
    if [ ${NEWQTUSERS} -lt ${QTUSERS} ]
    then
        echo "Sairam usuários."

        for user in ${USERLIST}
        do
            if echo ${NEWUSERLIST} | grep -q -v "${user}"
            then
                echo "Usuário ${user} entrou."
            fi
        done
        USERLIST=${NEWUSERLIST}
        QTUSERS=${NEWQTUSERS}
    fi