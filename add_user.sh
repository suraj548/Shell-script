#!/bin/bash

if [[ ${UID} -ne 0 ]]
then
	echo 'Run the script with root privilages'
	exit 1
fi

read -p 'Enter the username to create: ' USER_NAME

read -p 'Enter the name of user who will use this account: ' COMMENT

read -p 'Enter the password for the account: ' PASSWORD

useradd -c "${COMMENT}" -m ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
	echo 'Sorry couldnot create your account!'
	exit 1
fi

echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

passwd -e ${USER_NAME}

echo "Details of the account created"
echo "USER_NAME: ${USER_NAME}"
echo "PASSWORD: ${PASSWORD}"
echo "COMMENT: ${COMMENT}"
echo "Host: ${HOSTNAME}"






