#!/bin/bash

if [[ ${UID} -ne 0 ]]
then
	echo 'Run the script with root privilages'
	exit 1
fi

if [[ ${#} -lt 1 ]]
then 
	echo "USAGE: ${0} USER_NAME COMMENT..." 
	exit 1
fi 

USER_NAME=${1}

shift

COMMENT=${*}

useradd -c "${COMMENT}" -m ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
	echo 'Sorry couldnot create your account!'
	exit 1
fi

PASSWORD = $(date +%s%N | sha256sum | head -c8)

echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then 
	echo 'Password for account couldnot be set.'
	exit 1
fi


passwd -e ${USER_NAME}

echo "Details of the account created"
echo "USER_NAME: ${USER_NAME}"
echo "PASSWORD: ${PASSWORD}"
echo "COMMENT: ${COMMENT}"
echo "Host: ${HOSTNAME}"
