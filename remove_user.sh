#!/bin/bash

if [[ ${UID} -ne 0 ]]
then
	echo 'Run the script with root privilages'
	exit 1
fi

USER_NAME=${1}

userdel -r ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then 
	echo 'User not deleted sucessfully'
	exit 1
fi